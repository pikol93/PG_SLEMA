import 'package:pg_slema/features/medicine/logic/entity/medicine.dart';
import 'package:pg_slema/features/notification/logic/repository/shared_preferences_notification_repository.dart';
import 'package:pg_slema/features/notification/logic/service/notification_service.dart';
import 'package:pg_slema/features/notification/logic/entity/get_notification.dart';
import 'package:pg_slema/features/notification/logic/entity/notification.dart'
    as nt;
import 'package:pg_slema/features/notification/presentation/controller/manage_notifications_controller.dart';
import 'package:pg_slema/utils/frequency/frequency.dart';
import 'package:pg_slema/utils/id/integer_id_generator.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:uuid/uuid.dart';

class AddMedicineController with Logger, ManageNotificationsController {
  String _medicineId = const Uuid().v4();
  late final NotificationService _notificationService;
  String typedMedicineName = "";
  DateTime startIntakeDate = DateTime.now();
  DateTime endIntakeDate = DateTime.now();
  Frequency frequency = Frequency.singular;
  int delayBetweenIntakes = Frequency.singular.defaultDelayBetweenIntakes;
  String typedDose = "";
  String typedIntakeType = "";
  String typedOpinion = "";
  String typedMedicineType = "";
  bool canStartDateBePicked = true;
  bool canEndDateBePicked = false;
  bool canDelayBetweenIntakesBePicked = false;
  @override
  List<GetNotification> notifications =
      List<GetNotification>.empty(growable: true);

  AddMedicineController() : super() {
    final notificationRepository = SharedPreferencesNotificationRepository();
    _notificationService = NotificationService(notificationRepository);
  }

  void initFromMedicine(Medicine medicine) {
    _medicineId = medicine.id;
    typedMedicineName = medicine.name;
    endIntakeDate = medicine.lastIntakeDate;
    frequency = medicine.intakeFrequency;
    notifications = medicine.notifications
        .map((e) => GetNotification(e.id, e.notificationTime))
        .toList(growable: true);
    delayBetweenIntakes = medicine.delayBetweenIntakes;
    typedDose = medicine.dose;
    typedIntakeType = medicine.intakeType;
    typedOpinion = medicine.opinion;
    typedMedicineType = medicine.medicineType;
    checkIfEndDateCanBePicked();
    checkIfDelayBetweenIntakesCanBePicked();
  }

  Future<Medicine> createMedicine() async {
    var lastMedicineDate = _getLastNotificationDateTime();

    var medicineNotifications =
        await _createNotificationsForMedicine(lastMedicineDate);

    Medicine medicine = Medicine(
        _medicineId,
        typedMedicineName,
        startIntakeDate,
        lastMedicineDate,
        frequency,
        medicineNotifications,
        delayBetweenIntakes,
        typedDose,
        typedIntakeType,
        typedOpinion,
        typedMedicineType);

    return medicine;
  }

  @override
  void onNotificationDeleted(GetNotification notification) {
    logger.debug("notification deleted: ${notification.id}");
    notifications.removeWhere((el) => el.id == notification.id);
  }

  @override
  void onNotificationCreated(GetNotification notification) {
    logger.debug("notification created: ${notification.id}");
    notifications.add(notification);
  }

  @override
  void onNotificationChanged(GetNotification notification) {
    logger.debug("notification changed: ${notification.id}");
    notifications[notifications
        .indexWhere((element) => element.id == notification.id)] = notification;
  }

  DateTime _getLastNotificationDateTime() {
    if (frequency == Frequency.singular) {
      return startIntakeDate;
    } else {
      return endIntakeDate;
    }
  }

  Future<List<nt.Notification>> _createNotificationsForMedicine(
      DateTime lastNotificationDate) async {
    var forbiddenIds = await _notificationService.getAllNotifications().then(
        (notifications) => notifications.map((e) => e.scheduledId).toList());
    var idsToSchedule =
        IntegerIdGenerator.generateRandomIdsWhichAreNotForbidden(
            forbiddenIds, notifications.length);
    return notifications
        .map((notification) => nt.Notification(
            notification.id,
            _medicineId,
            'Przypomnienie',
            'Trzeba przyjąć $typedMedicineName',
            notification.notificationTime,
            startIntakeDate,
            lastNotificationDate,
            frequency,
            idsToSchedule.removeLast(),
            delayBetweenIntakes))
        .toList(growable: true);
  }

  void onFrequencyChanged(Frequency frequency) {
    this.frequency = frequency;
    delayBetweenIntakes = frequency.defaultDelayBetweenIntakes;
    checkIfDelayBetweenIntakesCanBePicked();
    checkIfEndDateCanBePicked();
  }

  void checkIfEndDateCanBePicked() {
    canEndDateBePicked = frequency == Frequency.singular ? false : true;
  }

  void checkIfDelayBetweenIntakesCanBePicked() {
    canDelayBetweenIntakesBePicked =
        frequency == Frequency.everyXDays ? true : false;
  }
}

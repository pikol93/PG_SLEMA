import 'package:flutter/material.dart';
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
import 'package:pg_slema/utils/time_of_day/time_of_day_comparing_extension.dart';
import 'package:uuid/uuid.dart';

class AddMedicineController extends ChangeNotifier
    with Logger, ManageNotificationsController {
  String _medicineId = const Uuid().v4();
  late final NotificationService _notificationService;
  String typedMedicineName = "";
  String typedIntakeType = "";
  DateTime endIntakeDate = DateTime.now();
  Frequency frequency = Frequency.singular;
  bool canDateBePicked = false;
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
    typedIntakeType = medicine.intakeType;
    endIntakeDate = medicine.lastIntakeDate;
    frequency = medicine.intakeFrequency;
    notifications = medicine.notifications
        .map((e) => GetNotification(e.id, e.notificationTime))
        .toList(growable: true);
    checkIfDateCanBePicked();
  }

  Future<Medicine> createMedicine() async {
    var lastMedicineDate = _getLastNotificationDateTime();

    var medicineNotifications =
        await _createNotificationsForMedicine(lastMedicineDate);

    Medicine medicine = Medicine(
        _medicineId,
        typedMedicineName,
        typedIntakeType,
        DateTime.now(),
        lastMedicineDate,
        frequency,
        medicineNotifications);

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
      return _getDateTimeForSingularIntakeMedicine();
    } else {
      return endIntakeDate;
    }
  }

  DateTime _getDateTimeForSingularIntakeMedicine() {
    var currentTime = TimeOfDay.now();
    return notifications
            .where((notification) =>
                !notification.notificationTime.isHigher(currentTime))
            .isNotEmpty
        ? DateTime.now().add(const Duration(days: 1))
        : DateTime.now();
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
            DateTime.now(),
            lastNotificationDate,
            frequency,
            idsToSchedule.removeLast()))
        .toList(growable: true);
  }

  void checkIfDateCanBePicked() {
    canDateBePicked = frequency == Frequency.singular ? false : true;
  }
}

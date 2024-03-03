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

class AddMedicineController with Logger, ManageNotificationsController {
  String _medicineId = const Uuid().v4();
  late final NotificationService _notificationService;
  String typedMedicineName = "";
  DateTime intakeDate = DateTime.now();
  Frequency frequency = Frequency.singular;
  String typedDose = "";
  String typedIntakeType = "";
  String typedOpinion = "";
  String typedMedicineType = "";
  bool canDateBePicked = true;
  bool canNotificationsBePicked = false;
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
    intakeDate = medicine.intakeDate;
    frequency = medicine.intakeFrequency;
    notifications = medicine.notifications
        .map((e) => GetNotification(e.id, e.notificationTime))
        .toList(growable: true);
    canNotificationsBePicked = notifications.isNotEmpty;
    typedDose = medicine.dose;
    typedIntakeType = medicine.intakeType;
    typedOpinion = medicine.opinion;
    typedMedicineType = medicine.medicineType;
    updatePermissionForDatePicking();
  }

  Future<Medicine> createMedicine() async {
    List<nt.Notification> medicineNotifications = [];
    if (canNotificationsBePicked) {
      medicineNotifications = await _createNotificationsForMedicine();
    }

    Medicine medicine = Medicine(
        _medicineId,
        typedMedicineName,
        intakeDate.compareTo(DateTime.now()) >= 0 ? intakeDate : DateTime.now(),
        frequency,
        medicineNotifications,
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

  Future<List<nt.Notification>> _createNotificationsForMedicine() async {
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
            _getDateForNotification(notification.notificationTime),
            frequency,
            idsToSchedule.removeLast()))
        .toList(growable: true);
  }

  void onFrequencyChanged(Frequency frequency) {
    this.frequency = frequency;
    intakeDate = DateTime.now();
    updatePermissionForDatePicking();
  }

  void updatePermissionForDatePicking() {
    canDateBePicked = frequency == Frequency.singular;
  }

  DateTime _getDateForNotification(TimeOfDay notificationTime) {
    if (frequency == Frequency.singular) {
      var now = DateTime.now();
      var nowTime = TimeOfDay(hour: now.hour, minute: now.minute);
      var tomorrow = now.add(const Duration(days: 1));
      int compareDates = intakeDate.compareTo(now);
      if (compareDates > 0) {
        return intakeDate;
      } else if (compareDates < 0 || nowTime.isHigher(notificationTime)) {
        return tomorrow;
      }
    }

    return intakeDate;
  }
}

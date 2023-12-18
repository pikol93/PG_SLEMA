import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/application/service/medicine_service.dart';
import 'package:pg_slema/features/medicine/data/repository/shared_preferences_medicine_repository.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';
import 'package:pg_slema/features/notification/application/service/notification_service.dart';
import 'package:pg_slema/features/notification/data/repository/shared_preferences_notification_repository.dart';
import 'package:pg_slema/features/medicine/domain/converter/medicine_to_dto_converter.dart';
import 'package:pg_slema/features/notification/domain/get_notification.dart';
import 'package:pg_slema/features/notification/domain/notification.dart' as nt;
import 'package:pg_slema/utils/frequency/frequency.dart';
import 'package:pg_slema/utils/id/integer_id_generator.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:pg_slema/utils/time_of_day/time_of_day_comparing_extension.dart';
import 'package:uuid/uuid.dart';

class AddMedicineController extends ChangeNotifier with Logger {
  late final NotificationService _notificationService;
  late final MedicineService _medicineService;
  String typedMedicineName = "";
  String typedIntakeType = "";
  List<GetNotification> notifications =
      List<GetNotification>.empty(growable: true);
  DateTime endIntakeDate = DateTime.now();
  Frequency frequency = Frequency.singular;

  AddMedicineController() : super() {
    final notificationRepository = SharedPreferencesNotificationRepository();
    _notificationService = NotificationService(notificationRepository);
    final converter = MedicineToDtoConverter(_notificationService);
    final medicineRepository = SharedPreferencesMedicineRepository(converter);
    _medicineService =
        MedicineService(medicineRepository, _notificationService);
  }

  Future saveMedicine() async {
    var idGenerator = const Uuid();
    var lastDate = _getLastNotificationDateTime();
    //TODO generatre N random Ids instead of generating on map -> duplicates!.
    //TODO: add missing fields to form

    var medicineNotifications = notifications
        .map((notification) => nt.Notification(
            notification.id,
            idGenerator.v4(),
            'Przypomnienie',
            'Trzeba przyjąć $typedIntakeType',
            notification.notificationTime,
            DateTime.now(),
            lastDate,
            frequency,
            IntegerIdGenerator.generateRandomId()))
        .toList(growable: true);

    medicineNotifications
        .forEach((element) => logger.debug(element.toString()));

    Medicine medicine = Medicine(
        idGenerator.v4(),
        typedMedicineName,
        typedIntakeType,
        DateTime.now(),
        lastDate,
        frequency,
        medicineNotifications);

    logger.debug(medicine.toString());

    _medicineService.addMedicine(medicine);
    medicineNotifications.forEach(_notificationService.addNotification);
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
}

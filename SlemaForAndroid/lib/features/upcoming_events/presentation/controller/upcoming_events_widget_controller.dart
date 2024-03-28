import 'package:pg_slema/features/medicine/logic/service/medicine_service.dart';
import 'package:pg_slema/features/medicine/logic/converter/medicine_to_dto_converter.dart';
import 'package:pg_slema/features/medicine/logic/repository/shared_preferences_medicine_repository.dart';
import 'package:pg_slema/features/notification/logic/repository/shared_preferences_notification_repository.dart';
import 'package:pg_slema/features/notification/logic/service/notification_service.dart';
import 'package:pg_slema/features/medicine/logic/entity/medicine.dart';
import 'package:pg_slema/utils/frequency/frequency.dart';

class UpcomingEventsWidgetController {
  late final MedicineService _medicineService;
  final int _visibleUpcomingEvents = 4;

  UpcomingEventsWidgetController() {
    final notificationRepository = SharedPreferencesNotificationRepository();
    final notificationService = NotificationService(notificationRepository);
    final converter = MedicineToDtoConverter(notificationService);
    final medicineRepository = SharedPreferencesMedicineRepository(converter);
    _medicineService = MedicineService(medicineRepository, notificationService);
  }

  Future<List<Medicine>> getUpcomingEvents() async {
    //Ideally, this function will return list of ANY entity that is upcoming
    List<Medicine> events = await _medicineService.getAllMedicines();
    events.removeWhere(_removeMedicineWhere);
    events.sort((a, b) => a.intakeDate.compareTo(b.intakeDate));
    return events.take(_visibleUpcomingEvents).toList();
  }

  bool _removeMedicineWhere(Medicine medicine) {
    // Beware, this method is vulnerable and needs testing
    DateTime dateTimeNow = DateTime.now();
    if ((medicine.intakeFrequency == Frequency.singular) &
        medicine.intakeDate.isBefore(dateTimeNow)) {
      return true;
    }
    // return medicine.notifications.any((notification) =>
    //     notification.notificationDate.isBefore(dateTimeNow) |
    //     (notification.notificationDate.isToday &
    //         notification.notificationTime.isHigher(TimeOfDay.now())));
    // This would work if the notifications were added every day.
    // It is not a case here.

    return medicine.notifications.isEmpty;
  }
}

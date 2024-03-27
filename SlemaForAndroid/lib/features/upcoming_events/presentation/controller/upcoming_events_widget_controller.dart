import 'package:pg_slema/features/medicine/logic/service/medicine_service.dart';
import 'package:pg_slema/features/medicine/logic/converter/medicine_to_dto_converter.dart';
import 'package:pg_slema/features/medicine/logic/repository/shared_preferences_medicine_repository.dart';
import 'package:pg_slema/features/notification/logic/repository/shared_preferences_notification_repository.dart';
import 'package:pg_slema/features/notification/logic/service/notification_service.dart';
import 'package:pg_slema/features/medicine/logic/entity/medicine.dart';

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

  Future<Iterable<Medicine>> getUpcomingEvents() async {
    //Ideally, this function will return list of ANY entity that is upcoming
    List<Medicine> events = await _medicineService.getAllMedicines();
    DateTime dateTimeNow = DateTime.now();
    events.removeWhere((e) => e.intakeDate.isBefore(dateTimeNow));
    events.sort((a, b) => a.intakeDate.compareTo(b.intakeDate));
    return events.getRange(0, _visibleUpcomingEvents - 1);
  }
}

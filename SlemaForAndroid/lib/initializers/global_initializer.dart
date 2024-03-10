import 'package:pg_slema/features/ingredient/logic/converter/ingredient_to_dto_converter.dart';
import 'package:pg_slema/features/ingredient/logic/repository/shared_preferences_ingredient_repository.dart';
import 'package:pg_slema/features/ingredient/logic/service/ingredient_service.dart';
import 'package:pg_slema/features/notification/logic/repository/shared_preferences_notification_repository.dart';
import 'package:pg_slema/features/notification/logic/service/notification_scheduling_service.dart';
import 'package:pg_slema/features/notification/logic/service/notification_service.dart';
import 'package:pg_slema/initializers/diet_initializer.dart';
import 'package:pg_slema/initializers/initializer.dart';
import 'package:pg_slema/initializers/notifications_initializer.dart';

class GlobalInitializer with Initializer {
  final DietInitializer dietInitializer;

  final NotificationsInitializer notificationsInitializer;

  GlobalInitializer()
      : dietInitializer = DietInitializer(IngredientService(
            SharedPreferencesIngredientRepository(IngredientToDtoConverter()))),
        notificationsInitializer = NotificationsInitializer(
            NotificationService(SharedPreferencesNotificationRepository()),
            NotificationSchedulingService());

  @override
  Future initialize() async {
    await dietInitializer.initialize();
    await notificationsInitializer.initialize();
  }
}

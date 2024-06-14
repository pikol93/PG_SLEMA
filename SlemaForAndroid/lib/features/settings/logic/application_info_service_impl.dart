import 'package:pg_slema/features/settings/logic/application_info_repository.dart';
import 'package:pg_slema/features/settings/logic/application_info_service.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class ApplicationInfoServiceImpl extends ApplicationInfoService with Logger {
  static const requiredDebugModeCount = 10;

  final ApplicationInfoRepository applicationInfoRepository;

  int developerModeCounter = 0;

  ApplicationInfoServiceImpl({
    required this.applicationInfoRepository,
  });

  @override
  void incrementDeveloperModeCounter() {
    developerModeCounter++;
    logger.debug("Developer mode counter: $developerModeCounter");
    if (developerModeCounter < requiredDebugModeCount) {
      return;
    }

    applicationInfoRepository.setDeveloperMode(true);
  }

  @override
  void disableDeveloperMode() {
    developerModeCounter = 0;
    applicationInfoRepository.setDeveloperMode(false);
  }
}

import 'package:flutter/material.dart';
import 'package:pg_slema/features/about/presentation/widget/about_section_widget.dart';
import 'package:pg_slema/features/about/presentation/widget/link_widget.dart';
import 'package:pg_slema/features/settings/logic/application_info_repository.dart';
import 'package:pg_slema/features/settings/logic/application_info_service.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ApplicationSectionWidget extends StatelessWidget with Logger {
  static const repositoryUrl = "https://github.com/pikol93/PG_SLEMA";

  static final repositoryUri = Uri.parse(repositoryUrl);

  const ApplicationSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final applicationInfoRepository = Provider.of<ApplicationInfoRepository>(
      context,
      listen: false,
    );

    return AboutSectionWidget(
      sectionTitle: "Kontakt",
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinkWidget(
              label: "Wersja aplikacji:",
              buttonText:
                  "${applicationInfoRepository.getVersion()}-${applicationInfoRepository.getBuildNumber()}",
              onTap: () => _onVersionClicked(context),
            ),
            LinkWidget(
              label: "GitHub:",
              buttonText: repositoryUrl,
              onTap: _onRepositoryLinkClicked,
            ),
          ],
        ),
      ],
    );
  }

  void _onVersionClicked(BuildContext context) {
    logger.debug("Version tapped");
    Provider.of<ApplicationInfoService>(context, listen: false)
        .incrementDeveloperModeCounter();
  }

  Future _onRepositoryLinkClicked() async {
    logger.debug("Repository link tapped");
    if (!await launchUrl(repositoryUri)) {
      logger.error("Could not open URI $repositoryUri");
    }
  }
}

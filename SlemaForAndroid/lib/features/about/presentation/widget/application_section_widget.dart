import 'package:flutter/material.dart';
import 'package:pg_slema/features/about/presentation/widget/about_section_widget.dart';
import 'package:pg_slema/features/about/presentation/widget/link_widget.dart';
import 'package:pg_slema/features/settings/logic/application_info_repository.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:provider/provider.dart';

class ApplicationSectionWidget extends StatelessWidget with Logger {
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
              onTap: _onVersionClicked,
            ),
            LinkWidget(
              label: "Facebook:",
              buttonText: "https://github.com/pikol93/PG_SLEMA",
              onTap: _onRepositoryLinkClicked,
            ),
          ],
        ),
      ],
    );
  }

  void _onVersionClicked() {
    logger.debug("Version tapped");
  }

  void _onRepositoryLinkClicked() {
    logger.debug("Repository link tapped");
  }
}

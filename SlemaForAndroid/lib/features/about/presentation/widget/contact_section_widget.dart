import 'package:flutter/material.dart';
import 'package:pg_slema/features/about/presentation/widget/about_section_widget.dart';
import 'package:pg_slema/features/about/presentation/widget/link_widget.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class ContactSectionWidget extends StatelessWidget with Logger {
  const ContactSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AboutSectionWidget(
      sectionTitle: "Kontakt",
      children: [
        LinkWidget(
          label: "Strona internetowa:",
          buttonText: "https://toczenpolska.pl",
          onTap: _onSiteLinkTapped,
        ),
        LinkWidget(
          label: "Facebook:",
          buttonText: "Toczeń Polska",
          onTap: _onFacebookLinkTapped,
        ),
        LinkWidget(
          label: "Instagram:",
          buttonText: "#lupuspolandfoundation",
          onTap: _onInstagramLinkTapped,
        ),
        LinkWidget(
          label: "E-mail:",
          buttonText: "fundacja@toczenpolska.pl",
          onTap: _onEmailTapped,
        ),
      ],
    );
  }

  void _onSiteLinkTapped() {
    logger.debug("Site link tapped");
  }

  void _onFacebookLinkTapped() {
    logger.debug("Facebook link tapped");
  }

  void _onInstagramLinkTapped() {
    logger.debug("Instagram link tapped");
  }

  void _onEmailTapped() {
    logger.debug("E-mail address tapped");
  }
}

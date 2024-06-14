import 'package:flutter/material.dart';
import 'package:pg_slema/features/about/presentation/widget/about_section_widget.dart';
import 'package:pg_slema/features/about/presentation/widget/link_widget.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSectionWidget extends StatelessWidget with Logger {
  static const siteUrl = "https://toczenpolska.pl";
  static const facebookUrl =
      "https://www.facebook.com/profile.php?id=100092263937449";
  static const instagramUrl = "https://www.instagram.com/lupuspolandfoundation";
  static const mailAddress = "fundacja@toczenpolska.pl";

  static final siteUri = Uri.parse(siteUrl);
  static final facebookUri = Uri.parse(facebookUrl);
  static final instagramUri = Uri.parse(instagramUrl);
  static final mailUri = Uri(
    scheme: "mailto",
    path: mailAddress,
  );

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
          buttonText: siteUrl,
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

  Future _onSiteLinkTapped() async {
    logger.debug("Site link tapped");
    if (!await launchUrl(siteUri)) {
      logger.error("Could not open URI $siteUri");
    }
  }

  Future _onFacebookLinkTapped() async {
    logger.debug("Facebook link tapped");
    if (!await launchUrl(facebookUri)) {
      logger.error("Could not open URI $facebookUri");
    }
  }

  Future _onInstagramLinkTapped() async {
    logger.debug("Instagram link tapped");
    if (!await launchUrl(instagramUri)) {
      logger.error("Could not open URI $instagramUri");
    }
  }

  Future _onEmailTapped() async {
    logger.debug("E-mail address tapped");
    if (!await launchUrl(mailUri)) {
      logger.error("Could not open URI $mailUri");
    }
  }
}

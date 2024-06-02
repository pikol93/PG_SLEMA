import 'package:flutter/material.dart';
import 'package:pg_slema/features/settings/logic/application_info_repository.dart';
import 'package:pg_slema/features/settings/presentation/widget/setting_text.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:provider/provider.dart';

class ChangeServerAddressSettingText extends StatefulWidget {
  const ChangeServerAddressSettingText({super.key});

  @override
  State<StatefulWidget> createState() => ChangeServerAddressSettingTextState();
}

class ChangeServerAddressSettingTextState
    extends State<ChangeServerAddressSettingText> with Logger {
  late String currentValue;

  @override
  void initState() {
    super.initState();
    currentValue =
        Provider.of<ApplicationInfoRepository>(context, listen: false)
            .getServerAddress();
  }

  @override
  Widget build(BuildContext context) {
    return SettingText(
      label: "Adres serwera",
      initialValue: currentValue,
      onConfirmPressed: (newValue) => onConfirmPressed(context, newValue),
    );
  }

  void onConfirmPressed(BuildContext context, String newValue) {
    logger.debug("Setting server address value: $newValue.");
    Provider.of<ApplicationInfoRepository>(context, listen: false)
        .setServerAddress(newValue);

    setState(() {
      currentValue = newValue;
    });
  }
}

import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String? label;
  final IconData? icon;
  final String? initialValue;
  final ValueChanged<String> onChanged;
  final bool isValueRequired;

  const CustomTextFormField(
      {super.key,
      required this.onChanged,
      this.label,
      this.icon,
      this.initialValue,
      this.isValueRequired = true});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final double defaultTextBottomPadding = 0.0;
  final double borderWidth = 2.5;
  final double borderRadius = 18.0;
  final double labelFontSize = 24.0;
  final double prefixIconSize = 38.0;
  final double prefixIconPaddingWidth = 12.0;
  final double verticalDividerWidth = 2.0;
  final double verticalDividerBoxHeight = 33.0;
  late double prefixBoxWidth;

  @override
  void initState() {
    prefixBoxWidth =
        prefixIconSize + prefixIconPaddingWidth + verticalDividerWidth + 14.0;
    super.initState();
  }

  String? validateInput(String? value) {
    if (widget.isValueRequired && (value == null || value.trim().isEmpty)) {
      return 'Proszę uzupełnić to pole';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      validator: validateInput,
      onChanged: widget.onChanged,
      keyboardType: TextInputType.text,
      style: TextStyle(
        fontSize: Theme.of(context).textTheme.labelSmall?.fontSize,
        color: Theme.of(context).primaryColor,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.primaryContainer,
        label: Padding(
          padding: EdgeInsets.only(bottom: defaultTextBottomPadding),
          child: Text(widget.label ?? ""),
        ),
        labelStyle: Theme.of(context).textTheme.labelSmall,
        prefixIcon: widget.icon == null
            ? null
            : SizedBox(
                width: prefixBoxWidth,
                child: Row(
                  children: [
                    SizedBox(
                      width: prefixIconPaddingWidth,
                    ),
                    Icon(
                      widget.icon,
                      color: Theme.of(context).primaryColor,
                      size: prefixIconSize,
                    ),
                    SizedBox(
                      height: verticalDividerBoxHeight,
                      child: VerticalDivider(
                        color: Theme.of(context).primaryColor,
                        thickness: verticalDividerWidth,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

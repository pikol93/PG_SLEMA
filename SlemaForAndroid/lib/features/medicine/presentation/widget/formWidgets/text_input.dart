import 'package:flutter/material.dart';
import 'package:pg_slema/theme/custom_colors.dart';
import 'package:photo_manager/photo_manager.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final IconData? icon;
  final String? initialValue;
  final ValueChanged<String> onChanged;

  const CustomTextFormField(
      {super.key,
      required this.label,
      required this.icon,
      required this.onChanged,
      this.initialValue});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final double defaultTextBottomPadding = 0.0;
  final double borderWidth = 2.0;
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
    if (value == null || value.isEmpty) {
      return 'Proszę uzupełnić to pole';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final MyColors? myColors = Theme.of(context).extension<MyColors>();
    return TextFormField(
      initialValue: widget.initialValue,
      validator: validateInput,
      onChanged: widget.onChanged,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        label: Padding(
          padding: EdgeInsets.only(bottom: defaultTextBottomPadding),
          child: Text(widget.label),
        ),
        labelStyle: TextStyle(
          fontSize: labelFontSize,
          fontWeight: FontWeight.w700,
          color: myColors?.formsCustomTextInputBorderColor ?? Colors.black12,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
            borderSide: BorderSide(
                color:
                    myColors?.formsCustomTextInputBorderColor ?? Colors.black12,
                width: borderWidth)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
            borderSide: BorderSide(
                color:
                    myColors?.formsCustomTextInputBorderColor ?? Colors.black12,
                width: borderWidth)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
            borderSide: BorderSide(
                color:
                    myColors?.formsCustomTextInputBorderColor ?? Colors.black12,
                width: borderWidth)),
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
                      color: myColors?.formsButtonBackgroundColor ??
                          Colors.black12,
                      size: prefixIconSize,
                    ),
                    SizedBox(
                      height: verticalDividerBoxHeight,
                      child: VerticalDivider(
                        color: myColors?.formsCustomTextInputBorderColor ??
                            Colors.black12,
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

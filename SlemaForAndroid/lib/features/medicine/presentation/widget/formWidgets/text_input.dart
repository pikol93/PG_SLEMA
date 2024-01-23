import 'package:flutter/material.dart';
import 'package:pg_slema/theme/custom_colors.dart';

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
  @override
  Widget build(BuildContext context) {
    final MyColors? myColors = Theme.of(context).extension<MyColors>();
    return TextFormField(
      initialValue: widget.initialValue,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Proszę uzupełnić to pole';
        }
        return null;
      },
      onChanged: (value) {
        widget.onChanged(value);
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: myColors?.formsCustomTextInputBorderColor ?? Colors.black12,
        ),
        border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(18),
            ),
            borderSide: BorderSide(
                color:
                    myColors?.formsCustomTextInputBorderColor ?? Colors.black12,
                width: 2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(18),
            ),
            borderSide: BorderSide(
                color:
                    myColors?.formsCustomTextInputBorderColor ?? Colors.black12,
                width: 2)),
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(18),
            ),
            borderSide: BorderSide(
                color:
                    myColors?.formsCustomTextInputBorderColor ?? Colors.black12,
                width: 2)),
        prefixIcon: widget.icon == null
            ? null
            : SizedBox(
                width: 54,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 12,
                    ),
                    Icon(
                      widget.icon,
                      color: myColors?.formsButtonBackgroundColor ??
                          Colors.black12,
                    ),
                    SizedBox(
                      height: 33,
                      child: VerticalDivider(
                        color: myColors?.formsCustomTextInputBorderColor ??
                            Colors.black12,
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

// Row(
// children: [
// const SizedBox(
// width: 12,
// ),
// Icon(
// widget.icon,
// color: myColors?.formsButtonBackgroundColor ??
// Colors.black12,
// ),
// SizedBox(
// height: 33,
// child: VerticalDivider(
// color: myColors?.formsCustomTextInputBorderColor ??
// Colors.black12,
// thickness: 2,
// ),
// ),
// ],
// )

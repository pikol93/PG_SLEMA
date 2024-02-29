import 'package:flutter/material.dart';
import 'package:pg_slema/utils/frequency/frequency.dart';

class FrequencyList extends StatefulWidget {
  final ValueChanged<Frequency> onChanged;
  final Frequency initialValue;

  const FrequencyList(
      {super.key, required this.onChanged, required this.initialValue});

  @override
  State<StatefulWidget> createState() => _FrequencyListState();

  List<DropdownMenuEntry<Frequency>> _createFrequencyEntries() {
    return Frequency.values
        .map((e) => DropdownMenuEntry<Frequency>(
              value: e,
              label: e.name,
              style: const ButtonStyle(),
            ))
        .toList();
  }
}

class _FrequencyListState extends State<FrequencyList> {
  final double borderWidth = 2.5;
  final double borderRadius = 18.0;
  final double labelFontSize = 24.0;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      initialSelection: widget.initialValue,
      dropdownMenuEntries: widget._createFrequencyEntries(),
      onSelected: (value) {
        widget.onChanged(value!);
      },
      label: const Text("Częstotliwość przyjmowania"),
      width: MediaQuery.of(context).size.width - 50,
      textStyle: TextStyle(
        fontSize: labelFontSize,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).primaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Theme.of(context).colorScheme.primaryContainer,
        suffixIconColor: Theme.of(context).colorScheme.primary,
        labelStyle: TextStyle(
          fontSize: labelFontSize,
          fontWeight: FontWeight.w700,
          color: Theme.of(context).primaryColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          borderSide: BorderSide(
              color: Theme.of(context).primaryColor, width: borderWidth),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          borderSide: BorderSide(
              color: Theme.of(context).primaryColor, width: borderWidth),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          borderSide: BorderSide(
              color: Theme.of(context).primaryColor, width: borderWidth),
        ),
      ),
      //Setting width because of: https://github.com/flutter/flutter/issues/125199
    );
  }
}

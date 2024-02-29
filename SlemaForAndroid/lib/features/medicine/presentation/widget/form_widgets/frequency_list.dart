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
        .map((e) => DropdownMenuEntry<Frequency>(value: e, label: e.name))
        .toList();
  }
}

class _FrequencyListState extends State<FrequencyList> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      initialSelection: widget.initialValue,
      dropdownMenuEntries: widget._createFrequencyEntries(),
      onSelected: (value) {
        widget.onChanged(value!);
      },
      label: const Text("Częstotliwość przyjmowania"),
    );
  }
}

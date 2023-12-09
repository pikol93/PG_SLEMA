import 'package:flutter/material.dart';
import 'package:pg_slema/features/diet/presentation/controller/calendar_exact_date_picker_controller.dart';
import 'package:pg_slema/features/diet/presentation/widget/calendar_exact_date_picker.dart';

class DietScreen extends StatefulWidget {
  final CalendarExactDatePickerController exactDatePickerController =
      CalendarExactDatePickerController();
  DietScreen({super.key});

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen>
    with AutomaticKeepAliveClientMixin {
  String appBarDateText = "Dzisiaj";
  void updatePickedDateStringRepresentation(String value) {
    setState(() {
      appBarDateText = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(15, 10),
          ),
        ),
        elevation: 5,
        toolbarHeight: 60,
        title: Row(
          children: [
            CalendarExactDatePicker(
              onPickedDate: updatePickedDateStringRepresentation,
              controller: widget.exactDatePickerController,
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            Text(
              appBarDateText,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            const Spacer(flex: 4),
          ],
        ),
      ),
      body: const Center(
        child: Text("TODO"),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class DatePickerController {
  final DateTime allowedFirstDate;
  final DateTime allowedLastDate;
  final DateTime initialDate;

  late DateTime selectedDate;

  DatePickerController({
    required this.allowedFirstDate,
    required this.allowedLastDate,
    required this.initialDate,
  }) {
    selectedDate = initialDate;
  }
}

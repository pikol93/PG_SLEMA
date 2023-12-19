class DatePickerController {
  final DateTime allowedFirstDate;
  final DateTime allowedLastDate;
  final DateTime initialDate;
  late DateTime selectedDate;

  DatePickerController(this.allowedFirstDate, this.allowedLastDate,
      this.initialDate) {
    selectedDate = initialDate;
  }
}

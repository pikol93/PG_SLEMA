import 'package:flutter/material.dart';

class Medicine {
  static String medicineListSharedPrefKey = 'medicines';
  final String id;
  final String name;
  final String intakeType;
  final List<Notification> notifications;

  Medicine(this.name, this.intakeType, this.notifications, this.id);
}

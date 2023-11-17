import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;

class MotivationScreenController extends ChangeNotifier {
  final String _quotesFilePath = 'assets/motivational_quotes.txt';

  List<String> quotes = [];
  String currentQuote = '';

  Future<void> loadQuotes() async {
    try {
      String response = await rootBundle.loadString(_quotesFilePath);
      quotes = response.split('\n');
      currentQuote = quotes.isNotEmpty ? quotes[0] : '';
    } catch (e) {
      // TODO: Log this event
    }
  }

  String getNewQuote() {
    String newQuote;
    do {
      newQuote = quotes[_getRandomIndex()];
    } while (newQuote == currentQuote);
    return newQuote;
  }

  int _getRandomIndex() => Random().nextInt(quotes.length);
}

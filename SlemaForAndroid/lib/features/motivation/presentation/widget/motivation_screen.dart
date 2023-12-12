import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pg_slema/features/motivation/controller/motivation_screen_controller.dart';

class MotivationScreen extends StatefulWidget {
  const MotivationScreen({super.key});

  @override
  MotivationScreenState createState() => MotivationScreenState();
}

class MotivationScreenState extends State<MotivationScreen> {
  late MotivationScreenController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        Provider.of<MotivationScreenController>(context, listen: false);
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (_controller.currentQuote.isEmpty) {
      await _controller.loadQuotes();
      _reloadQuote();
    }
  }

  void _reloadQuote() {
    String newQuote = _controller.getNewQuote();
    setState(() {
      _controller.currentQuote = newQuote;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    _controller.currentQuote,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              child: ElevatedButton(
                onPressed: _reloadQuote,
                child: const Text('Odśwież'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

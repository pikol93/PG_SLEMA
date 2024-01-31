import 'package:flutter/material.dart';
import 'package:pg_slema/features/motivation/controller/motivation_screen_controller.dart';
import 'package:provider/provider.dart';

class MotivationDaily extends StatefulWidget {
  const MotivationDaily({super.key});

  @override
  State<MotivationDaily> createState() => _MotivationDailyState();
}

class _MotivationDailyState extends State<MotivationDaily> {
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
    return Column(
      children: [
        Text(
          "Twój codzienny cytat",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                height: 1.0,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF133150), //TODO
              ),
        ),
        Text(
          _controller.currentQuote,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                height: 1.0,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                wordSpacing: -3.0, //TODO
                color: const Color(0xB2133150), //TODO
              ),
        ),
      ],
    );
  }
}

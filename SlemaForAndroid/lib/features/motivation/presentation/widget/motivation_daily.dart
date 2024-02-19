import 'package:flutter/material.dart';
import 'package:pg_slema/features/motivation/presentation/controller/motivation_screen_controller.dart';
import 'package:provider/provider.dart';
import 'package:pg_slema/theme/custom_colors.dart';

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
    final MyColors? myColors = Theme.of(context).extension<MyColors>();
    return Column(
      children: [
        Text(
          "Twój codzienny cytat",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        ),
        Text(
          _controller.currentQuote,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                height: 1.0,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                wordSpacing: -3.0,
                color: myColors?.colorPrimaryLighter,
              ),
        ),
      ],
    );
  }
}

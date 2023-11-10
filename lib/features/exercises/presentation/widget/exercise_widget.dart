import 'package:flutter/material.dart';

class ExerciseWidget extends StatefulWidget {
  //TODO: remove it to another class, temporary for demo
  final String exerciseName;
  final String series;
  final String repetitions;
  final String weight;

  const ExerciseWidget(
      {super.key,
      required this.exerciseName,
      required this.series,
      required this.repetitions,
      required this.weight});

  @override
  ExerciseWidgetState createState() => ExerciseWidgetState();
}

class ExerciseWidgetState extends State<ExerciseWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
        color: Colors.red,
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.exerciseName,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Powtórzenia: ${widget.repetitions}',
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          Text(
            'Obciążenie: ${widget.weight}',
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Seria ${widget.series}',
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const CircleBorder(),
                      elevation: 0,
                    ),
                    child: const Center(
                      child: Text(
                        '+',
                        style: TextStyle(fontSize: 16.0, color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(),
                        elevation: 0),
                    child: const Center(
                      child: Text(
                        '-',
                        style: TextStyle(fontSize: 16.0, color: Colors.red),
                      ),
                    ),
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const StadiumBorder(),
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.red,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

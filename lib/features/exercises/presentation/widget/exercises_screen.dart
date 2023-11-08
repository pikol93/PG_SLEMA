import 'package:flutter/material.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  ExercisesScreenState createState() => ExercisesScreenState();
}

class ExercisesScreenState extends State<ExercisesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Podciąganie',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Powtórzenia: 3x8',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'Obciążenie: +15kg',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Seria 1/5',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '+',
                          style: TextStyle(fontSize: 16.0, color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),


          Container(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Akcja po naciśnięciu przycisku "Edytuj ćwiczenie"
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: const StadiumBorder(),
              ),
              child: const Text(
                'Edytuj ćwiczenie',
                style: TextStyle(color: Colors.white),
              ),
            ),

          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Container(
            margin: const EdgeInsets.only(top: 16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.edit_calendar, color: Colors.white),
              ],
            ),
          ),
          ),
        ],
      ),
    );
  }
}
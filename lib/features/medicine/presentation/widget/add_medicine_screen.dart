import 'package:flutter/material.dart';

class AddMedicineScreen extends StatelessWidget {
  const AddMedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dodaj lek"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                //controller: ,
                decoration: const InputDecoration(
                  labelText: "Nazwa",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.create)
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                  ),
                  child: const Text(
                    "Zapisz",
                    style: TextStyle(
                      fontSize: 20.0, // Ustawienie wielkości tekstu
                      color: Colors.white, // Opcjonalnie, jeśli chcesz zmienić kolor tekstu
                    ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

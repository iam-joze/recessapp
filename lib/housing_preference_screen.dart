import 'package:flutter/material.dart';
import 'package:yo_broker_app/renting_preference_screen.dart';

class HousingPreferenceScreen extends StatelessWidget {
  const HousingPreferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Housing Preference'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'What are you looking for?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Todo: Navigate to Renting Preference
                print('User chose Renting');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RentingPreferenceScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50), //make button wider
                textStyle: const TextStyle(fontSize: 18),
              ), 
              child: const Text('Renting'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
              onPressed: () {
                // Todo: Navigate to Airbnb Preference
                print('User chose Airbnb');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50), //make button wider
                textStyle: const TextStyle(fontSize: 18),
              ), 
              child: const Text('Airbnb'),
              ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:yo_broker_app/housing_preference_screen.dart';

void main() {
  runApp(const YoBrokerApp());
}

class YoBrokerApp extends StatelessWidget {
  const YoBrokerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yo Broker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AccountCreationScreen(),
    );
  }
}

class AccountCreationScreen extends StatefulWidget {
  const AccountCreationScreen({super.key});

  @override
  State<AccountCreationScreen> createState() => _AccountCreationScreenState();
}

class _AccountCreationScreenState extends State<AccountCreationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // its good practice to dispose of controllers when the widget is removed
  @override 
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: const Text('Yo broker - Account Creation'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Text(
              'Welcome to Yo Broker',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder() // Gives a nice border around the input
              ),
            ),

            SizedBox(height: 10), // spacing between the fields

            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder()
              ),
              keyboardType: TextInputType.phone, //optimizes keyboard for phone numbers
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                //logic for account creation goes here
                print('Name: ${_nameController.text}');
                print('Phone: ${_phoneController.text}');

                // Simulate account creation success and then navigate
                // Navigate to the HousingPreferenceScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HousingPreferenceScreen(),
                    ),
                );
              },
              child: const Text('Create Account'),
              )
          ],
        ),
      ),
    );
  }
}

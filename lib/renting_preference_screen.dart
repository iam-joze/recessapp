import 'package:flutter/material.dart';

class RentingPreferenceScreen extends StatefulWidget {
  const RentingPreferenceScreen({super.key});

  @override
  State<RentingPreferenceScreen> createState() => _RentingPreferenceScreenState();
}

class _RentingPreferenceScreenState extends State<RentingPreferenceScreen> {
  // Controllers for text fields
  final TextEditingController _locationController =TextEditingController();
  final TextEditingController _minRentController =TextEditingController();
  final TextEditingController _maxRentController =TextEditingController();

  // Variable for selections
  String? _selectedRoomType; // 'Single' or 'Double'
  bool _isSelfContained = false;
  bool _isFenced = false;

  // Dispose controllers to prevent memory leaks
  @override
  void dispose() {
    _locationController.dispose();
    _minRentController.dispose();
    _maxRentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Renting Preference'),
      ),
      body: SingleChildScrollView( // allow scrolling if contetnt exceeds screen height
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Tell us about your ideal rental',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 20),

            // Location Input
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(
                labelText: 'Preferred Location',
                border: OutlineInputBorder(),
                hintText: 'e.g., Kampala, Entebbe',
              ),
            ),

            const SizedBox(height: 20),

            // Room Type Selection (Dropdown)
            const Text(
              'Room Type', 
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 8),

            DropdownButtonFormField<String>(
              value: _selectedRoomType,
              hint: const Text('Selected Room Type'),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              items: <String>['Single','Double'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState((){
                  _selectedRoomType = newValue;
                });
              },
            ),

            const SizedBox(height:20),

            // Self-contained Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Self-contained', style: TextStyle(fontSize: 16),),
                Switch(
                  value: _isSelfContained, 
                  onChanged: (bool value) {
                    setState(() {
                      _isSelfContained = value;
                    });
                  }),
              ],
            ),

            const SizedBox(height: 10),

            // Fenced Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Fenced Property', style: TextStyle(fontSize: 16),),
                Switch(
                  value: _isFenced, 
                  onChanged: (bool value){
                    setState(() {
                      _isFenced = value;
                    });
                  })
              ],
            ),

            const SizedBox(height: 20),

            //Rent Range Input
            const Text('Rent Range (UGX):', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8,),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _minRentController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Min Rent',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: TextField(
                    controller: _maxRentController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Max Rent',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Find Properties Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // collect all preferences
                      print('Location: ${_locationController.text}');
                      print('Room Type: $_selectedRoomType');
                      print('Self-contained: $_isSelfContained');
                      print('Fenced: $_isFenced');
                      print('Rent Range: Min ${_minRentController.text}, Max ${_maxRentController.text}');

                      // Todo: implement logic to search for properties based on these preferences
                      // and then navigate to property Matching Screen
                    }, 
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(50),
                      //minimumSize: const Size(double.infinity, 50), // make button full width
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text('Find Properties'),
                  ),
                ),
              ],
            ),
          ],
        )
        ),
    );
  }
}

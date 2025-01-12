import 'package:flutter/material.dart';

class WaterGoalsPage extends StatefulWidget {
  const WaterGoalsPage({Key? key}) : super(key: key);

  @override
  State<WaterGoalsPage> createState() => _WaterGoalsPageState();
}

class _WaterGoalsPageState extends State<WaterGoalsPage> {
  String dropdownValue = 'Choose goal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Goals'), // AppBar Title
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
      child: Center(
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.menu),
          style: const TextStyle(color: Colors.black), // Text color changed for better visibility
          underline: Container(
            height: 2,
            color: Colors.blue,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: const [
            DropdownMenuItem<String>(
              value: 'Choose goal',
              child: Text('Choose goal'),
            ),
            DropdownMenuItem<String>(
              value: '2000ml',
              child: Text('2000ml'),
            ),
            DropdownMenuItem<String>(
              value: '2500ml',
              child: Text('2500ml'),
            ),
            DropdownMenuItem<String>(
              value: '3000ml',
              child: Text('3000ml'),
            ),
          ],
        ),
      ),
      )
  );
  }
}

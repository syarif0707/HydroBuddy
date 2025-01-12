import 'package:flutter/material.dart';

class WaterGoalsPage extends StatefulWidget {
  const WaterGoalsPage({Key? key}) : super(key: key);

  @override
  State<WaterGoalsPage> createState() => _WaterGoalsPageState();
}

class _WaterGoalsPageState extends State<WaterGoalsPage> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Goals'), // AppBar Title
      ),
      body: Center(
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
              value: 'One',
              child: Text('One'),
            ),
            DropdownMenuItem<String>(
              value: 'Two',
              child: Text('Two'),
            ),
            DropdownMenuItem<String>(
              value: 'Three',
              child: Text('Three'),
            ),
          ],
        ),
      ),
    );
  }
}

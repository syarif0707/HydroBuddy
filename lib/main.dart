// lib/main.dart
import 'package:flutter/material.dart';
import 'package:hydrobuddy2/water_intake_mode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WaterIntakeModel(),
      child: MaterialApp(
        title: 'Water Intake Tracker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WaterIntakeHome(),
      ),
    );
  }
}

class WaterIntakeHome extends StatelessWidget {
  const WaterIntakeHome({super.key});

  @override
  Widget build(BuildContext context) {
    final waterIntakeModel = Provider.of<WaterIntakeModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Water Intake Tracker'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center (
          child: Stack(
           alignment: Alignment.center,
           children: [
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.90),
                shape: BoxShape.circle,
        ),
      ), 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Water Intake Today:',
            style: TextStyle(fontSize: 24),
            ),
            Text(
              '${waterIntakeModel.intake} ml',
              style: TextStyle(
                fontSize: 48, 
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                waterIntakeModel.addIntake(250); // Add 250 ml
              },
              child: Text('Add 250 ml'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                waterIntakeModel.resetIntake(); // Reset intake
              },
              child: Text('Reset Intake'),
              ),
              ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
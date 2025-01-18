// lib/main.dart
import 'package:flutter/material.dart';
import 'package:hydrobuddy2/login.dart';
import 'package:hydrobuddy2/water_intake_mode.dart';
import 'package:provider/provider.dart';
import 'package:hydrobuddy2/watergoals.dart';


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
        home: LoginPage(),
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
        title: const Text('Water Intake Tracker'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Center content (Circle with water goal and intake)
            Expanded(
              flex: 3,
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 50, 137, 208).withOpacity(0.90),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'Goals: ${waterIntakeModel.waterGoal}',
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                        Text(
                          '${waterIntakeModel.intake} ml',
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Buttons at the bottom
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical:5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        waterIntakeModel.addIntake(250); // Add 250 ml
                      },
                      child: const Text('Add 250 ml'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        waterIntakeModel.resetIntake(); // Reset intake
                      },
                      child: const Text('Reset Intake'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WaterGoalsPage()), // Navigate to WaterGoalsPage
                        );
                      },
                      child: const Text('Change Water Goal'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

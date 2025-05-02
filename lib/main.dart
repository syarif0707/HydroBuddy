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

    final waterGoal = waterIntakeModel.waterGoal;
    final intake = waterIntakeModel.intake;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Intake Tracker'),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/images/maindart.jpg'),
    fit: BoxFit.cover,
  ),
),

          child: Column(
            children: [
              // Circular progress section
              Expanded(
                flex: 3,
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 250,
                        height: 250,
                        child: CircularProgressIndicator(
                          value: waterGoal > 0 ? intake / waterGoal : 0.0,
                          strokeWidth: 10,
                          backgroundColor: Colors.grey.shade300,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Color.fromARGB(255, 50, 137, 208),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              'Goal: ${waterGoal > 0 ? waterGoal.toStringAsFixed(0) : "Not set"} ml',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          Text(
                            '${intake.toStringAsFixed(0)} ml',
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

              // Bottom buttons using Flexible and limited height
              Flexible(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            waterIntakeModel.addIntake(250);
                          },
                          child: const Text('Add 250 ml'),
                        ),
                      ),
                      const SizedBox(height: 6),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            waterIntakeModel.resetIntake();
                          },
                          child: const Text('Reset Intake'),
                        ),
                      ),
                      const SizedBox(height: 1),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WaterGoalsPage(),
                              ),
                            );
                          },
                          child: const Text('Change Water Goal'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

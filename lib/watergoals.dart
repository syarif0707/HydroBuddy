//lib/watergoals
import 'package:flutter/material.dart';
import 'package:hydrobuddy2/water_intake_mode.dart';
import 'package:provider/provider.dart';

class WaterGoalsPage extends StatelessWidget {
  const WaterGoalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final waterIntakeModel = Provider.of<WaterIntakeModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Goals'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: DropdownButton<String>(
            value: waterIntakeModel.waterGoal,
            icon: const Icon(Icons.menu),
            style: const TextStyle(color: Colors.black),
            underline: Container(
              height: 2,
              color: Colors.blue,
            ),
            onChanged: (String? newValue) {
              if (newValue != null) {
                waterIntakeModel.updateWaterGoal(newValue);
              }
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
      ),
    );
  }
}


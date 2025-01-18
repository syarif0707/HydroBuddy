//lib/watergoals
import 'package:flutter/material.dart';
import 'package:hydrobuddy2/water_intake_mode.dart';
import 'package:provider/provider.dart';

class WaterGoalsPage extends StatelessWidget {
  const WaterGoalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final waterIntakeModel = Provider.of<WaterIntakeModel>(context);
    final TextEditingController controller = TextEditingController(
      text: waterIntakeModel.waterGoal > 0
          ? waterIntakeModel.waterGoal.toString()
          : "",
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Water Goal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Water Goal (ml)',
                hintText: 'Enter your daily water goal in ml',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newGoal = double.tryParse(controller.text);
                if (newGoal != null && newGoal > 0) {
                  waterIntakeModel.updateWaterGoal(newGoal);
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter a valid water goal.'),
                    ),
                  );
                }
              },
              child: const Text('Set Goal'),
            ),
          ],
        ),
      ),
    );
  }
}

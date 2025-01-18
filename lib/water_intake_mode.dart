import 'package:flutter/foundation.dart';

class WaterIntakeModel extends ChangeNotifier {
  double intake = 0;
  double waterGoal = 0.0;

  void addIntake(double amount) {
    intake += amount;
    notifyListeners();
  }

  void resetIntake() {
    intake = 0;
    notifyListeners();
  }

  void updateWaterGoal(double newGoal) {
    waterGoal = newGoal;
    notifyListeners();
  }
}

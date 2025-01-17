// TODO Implement this library.
import 'package:flutter/foundation.dart';

class WaterIntakeModel extends ChangeNotifier {
  int intake = 0; // Current water intake
  String waterGoal = 'Choose goal'; // Default water goal

  void addIntake(int amount) {
    intake += amount;
    notifyListeners();
  }

  void resetIntake() {
    intake = 0;
    notifyListeners();
  }

  void updateWaterGoal(String newGoal) {
    waterGoal = newGoal;
    notifyListeners();
  }
}

import 'package:flutter/foundation.dart';

class WaterIntakeModel extends ChangeNotifier {
  int intake = 0;
  String waterGoal = 'Choose goal';

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

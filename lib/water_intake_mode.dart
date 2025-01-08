import 'package:flutter/foundation.dart';

class WaterIntakeModel with ChangeNotifier {
  int _intake = 0;

  int get intake => _intake;

  void addIntake(int amount) {
    _intake += amount;
    notifyListeners();
  }

  void resetIntake() {
    _intake = 0;
    notifyListeners();
  }
}
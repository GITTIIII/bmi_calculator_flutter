import "dart:math";

class CalculatorBrain {
  CalculatorBrain(this.weight, this.height);
  final int weight;
  final int height;

  double _bmi = 0;

  String calculateBMI() {
    double heightCm = height / 100;
    _bmi = weight / pow(heightCm, 2);
    return _bmi.toStringAsFixed(1); // decimal 1 digit
  }

  String getResult() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getDescription() {
    if (_bmi >= 25) {
      return "You have a higher than normal body weight. Try to exercise more.";
    } else if (_bmi > 18.5) {
      return "You have a normal body weight. Good Job!";
    } else {
      return "You have a lower than normal bod weight. You can eat a bit more.";
    }
  }
}

import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'screens/results_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  static const primaryColor = Color(0xFF0A0E21);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(color: primaryColor),
        scaffoldBackgroundColor: primaryColor,
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(backgroundColor: Colors.purple),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const InputPage(),
        "result": (context) => const ResultsPage(
              bmiResult: "",
              bmiNumber: "",
              bmiDescription: "",
            ),
      },
      // home: const InputPage(),
    );
  }
}

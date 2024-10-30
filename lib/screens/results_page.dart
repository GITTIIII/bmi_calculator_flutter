import 'package:flutter/material.dart';
import "../constants.dart";
import "../components/reuse_card.dart";
import "../components/bottom_button.dart";

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {super.key,
      required this.bmiResult,
      required this.bmiNumber,
      required this.bmiDescription});

  final String bmiResult;
  final String bmiNumber;
  final String bmiDescription;

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String bmiResult = arguments['bmiResult'];
    String bmiNumber = arguments['bmiNumber'];
    String bmiDescription = arguments['bmiDescription'];

    return Scaffold(
      appBar: AppBar(title: const Text("BMI CALCULATOR")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: const Text(
                "Your Result",
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReuseCard(
              cardColor: kActiveCardColor,
              cardChild: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      bmiResult.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiNumber,
                      style: kResultNumberTextStyle,
                    ),
                    Text(
                      bmiDescription,
                      style: kResultDescriptionTextStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
          BottomButton(
            label: "RE-CALCULATE",
            onTap: () {
              Navigator.pushNamed(context, "/");
            },
          )
        ],
      ),
    );
  }
}

import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reuse_card.dart';
import '../components/icon_content.dart';
import "../constants.dart";
import 'package:rflutter_alert/rflutter_alert.dart';
import "../components/bottom_button.dart";
import "../components/round_icon_button.dart";
import "package:bmi_calculator_flutter/calculator_brain.dart";

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  Gender? sexSelect;
  int height = 100;
  int weight = 50;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseCard(
                    onPress: () {
                      setState(() {
                        sexSelect =
                            (sexSelect != Gender.male) ? Gender.male : null;
                      });
                    },
                    cardColor: sexSelect == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: const IconContent(
                        label: "MALE", icon: FontAwesomeIcons.mars),
                  ),
                ),
                Expanded(
                  child: ReuseCard(
                    onPress: () {
                      setState(() {
                        sexSelect =
                            (sexSelect != Gender.female) ? Gender.female : null;
                      });
                    },
                    cardColor: sexSelect == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: const IconContent(
                        label: "FEMALE", icon: FontAwesomeIcons.venus),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReuseCard(
                  cardColor: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "HEIGHT",
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toString(), style: kNumberTextStyle),
                          const Text(
                            " cm",
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 15.0),
                            thumbColor: const Color(0xFFEB1555),
                            overlayColor: const Color(0x29EB1555),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: const Color(0xFF8D8E98)),
                        child: Slider(
                          value: height.toDouble(),
                          min: 0,
                          max: 250,
                          onChanged: (double value) => setState(() {
                            height = value.toInt();
                          }),
                        ),
                      )
                    ],
                  ))),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReuseCard(
                  cardColor: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "WEIGHT",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                if (weight > 0) {
                                  weight--;
                                }
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                if (weight < 300) {
                                  weight++;
                                }
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReuseCard(
                  cardColor: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "AGE",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                if (age > 0) {
                                  age--;
                                }
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                if (age < 300) {
                                  age++;
                                }
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          BottomButton(
            label: "CALCULATE",
            onTap: () {
              CalculatorBrain cal = CalculatorBrain(weight, height);
              if (sexSelect == null) {
                Alert(
                        style: const AlertStyle(
                          titleStyle: TextStyle(color: Colors.white),
                          descStyle: TextStyle(color: Colors.white),
                        ),
                        context: context,
                        title: "ERROR",
                        desc: "Please select gender.")
                    .show();
              } else {
                Navigator.pushNamed(context, "result", arguments: {
                  'bmiResult': cal.getResult(),
                  "bmiNumber": cal.calculateBMI(),
                  "bmiDescription": cal.getDescription()
                });
              }
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import "../constants.dart";

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.label,
    required this.onTap,
  });
  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      color: kBottomContainerColor,
      width: double.infinity,
      height: kBottomContainerHeight,
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Center(
          child: Text(
            label,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}

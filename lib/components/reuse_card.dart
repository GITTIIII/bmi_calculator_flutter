import "package:flutter/material.dart";

class ReuseCard extends StatelessWidget {
  const ReuseCard(
      {super.key, required this.cardColor, this.cardChild, this.onPress});
  final Color cardColor;
  final Widget? cardChild;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: cardColor, borderRadius: BorderRadius.circular(10.0)),
        child: cardChild,
      ),
    );
  }
}

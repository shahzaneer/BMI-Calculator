import 'package:flutter/material.dart';

class BMICard extends StatelessWidget {
   BMICard({Key? key, required this.color, this.childCard})
      : super(key: key);

  final Color color;
  final Widget? childCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: childCard,
    );
  }
}

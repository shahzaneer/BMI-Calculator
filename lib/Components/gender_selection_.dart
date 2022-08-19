import 'package:flutter/material.dart';
import 'card_.dart';

class GenderSelection extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color colour;
  // final Function onPress;

  const GenderSelection({
    Key? key,
    required this.icon,
    required this.text,
    required this.colour,
    // required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BMICard(
      color: colour,
      childCard: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 90.0,
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 22.0,
              color: Color(0xff7E7F8A),
            ),
          ),
        ],
      ),
    );
  }
}

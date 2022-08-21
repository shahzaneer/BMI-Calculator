import 'package:flutter/material.dart';
import '../Constants/constants_.dart';
import 'card_.dart';

class HeightSlider extends StatelessWidget {
  const HeightSlider({Key? key, required this.height, required this.onchanged})
      : super(key: key);

  final double height;
  final Function(double value)? onchanged;

  @override
  Widget build(BuildContext context) {
    return BMICard(
      color: const Color(0xff1D1E33),
      childCard: Column(
        children: [
          Text(
            "Height".toUpperCase(),
            style: const TextStyle(fontSize: 29.0, color: grey),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                height.toString(),
                style: const TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                width: 2.0,
              ),
              const Text(
                "cm",
                style: TextStyle(color: grey),
              )
            ],
          ),
          Slider(
            value: height.toDouble(),
            onChanged: onchanged,
            min: 180.0,
            max: 220.0,
          ),
        ],
      ),
    );
  }
}

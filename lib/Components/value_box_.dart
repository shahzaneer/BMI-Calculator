import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Constants/constants_.dart';
import 'card_.dart';

class ValueBox extends StatelessWidget {
  const ValueBox(
      {Key? key,
      required this.value,
      required this.name,
      required this.increment,
      required this.decrement})
      : super(key: key);

  final double value;
  final String name;
  final Function()? increment;
  final Function()? decrement;

  @override
  Widget build(BuildContext context) {
    return BMICard(
      color: const Color(0xff1D1E33),
      childCard: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name.toUpperCase(),
            style: const TextStyle(
              color: grey,
              fontSize: 30.0,
            ),
          ),
          Text(
            value.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 50.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: RawMaterialButton(
                    onPressed: decrement,
                    fillColor: inActiveCardColor,
                    shape: const CircleBorder(side: BorderSide.none),
                    constraints: const BoxConstraints.tightFor(
                      width: 50.0,
                      height: 50.0,
                    ),
                    child: const Icon(FontAwesomeIcons.minus),
                  ),
                ),
                Expanded(
                  child: RawMaterialButton(
                    onPressed: decrement,
                    fillColor: inActiveCardColor,
                    shape: const CircleBorder(side: BorderSide.none),
                    constraints: const BoxConstraints.tightFor(
                      width: 50.0,
                      height: 50.0,
                    ),
                    child: const Icon(FontAwesomeIcons.add),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

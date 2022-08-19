import 'package:bmi_calculator/Constants/constants_.dart';
import "package:flutter/material.dart";
import '../Components/card_.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required this.bmi, required this.result, required this.status}) : super(key: key);

  final String bmi;
  final String result;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator".toUpperCase(),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 15.0),
          Text(
            "Your Result",
            style: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 15.0),
          Expanded(
            child: BMICard(
              color: activeCardColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    result,
                    style: TextStyle(
                      color: Color(0xff4fff8a),
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    bmi,
                    style:
                        TextStyle(fontSize: 100.0, fontWeight: FontWeight.w900),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: Text(
                      status,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 70.0,
              width: double.infinity,
              color: buttonColor,
              margin: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: Text(
                  "Re-Calculate".toUpperCase(),
                  style: TextStyle(fontSize: 27.0, fontWeight: FontWeight.w900),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:bmi_calculator/Components/height_slider_.dart';
import 'package:bmi_calculator/Components/value_box_.dart';
import 'package:bmi_calculator/Constants/constants_.dart';
import 'package:bmi_calculator/Components/gender_selection_.dart';
import 'package:bmi_calculator/Screens/result_.dart';
import 'package:bmi_calculator/backendLogic/calculations.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

enum Gender {
  male,
  female,
}

class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  Gender? selectedGen;

  Calculation cal = Calculation(height: 180, weight: 60, age: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GenderSelection(
                    onPress: () {
                      setState(() {
                        selectedGen = Gender.male;
                      });
                    },
                    onDoublePress: () {
                      setState(() {
                        selectedGen = null;
                      });
                    },
                    icon: Icons.male,
                    colour: selectedGen == Gender.male
                        ? activeCardColor
                        : inActiveCardColor,
                    text: "Male",
                  ),
                ),
                Expanded(
                  child: GenderSelection(
                    onPress: () {
                      setState(() {
                        selectedGen = Gender.female;
                      });
                    },
                    onDoublePress: () {
                      setState(() {
                        selectedGen = null;
                      });
                    },
                    icon: Icons.female,
                    colour: selectedGen == Gender.female
                        ? activeCardColor
                        : inActiveCardColor,
                    text: "Female",
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: HeightSlider(
              height: cal.height.toDouble(),
              onchanged: (double value) {
                setState(() {
                  cal.height = value.toInt();
                });
              },
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ValueBox(
                    name: "Weight".toUpperCase(),
                    value: cal.weight.toDouble(),
                    increment: () {
                      setState(
                        () {
                          cal.weight++;
                        },
                      );
                    },
                    decrement: () {
                      setState(
                        () {
                          if (cal.weight >= 0) {
                            cal.weight++;
                          }
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ValueBox(
                    name: "Age".toUpperCase(),
                    value: cal.age.toDouble(),
                    increment: () {
                      setState(
                        () {
                          cal.age++;
                        },
                      );
                    },
                    decrement: () {
                      setState(
                        () {
                          if (cal.age >= 0) {
                            cal.age++;
                          }
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (selectedGen == null) {
                Alert(
                  context: context,
                  title: "Complete Info",
                  desc: "Please Specify the Gender First",
                  style: const AlertStyle(
                      animationType: AnimationType.grow,
                      backgroundColor: inActiveCardColor,
                      titleStyle: TextStyle(color: Colors.white),
                      descStyle:
                          TextStyle(fontWeight: FontWeight.bold, color: grey)),
                ).show();
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result(
                      bmi: cal.calculateBmi().toString(),
                      result: cal.getResult(),
                      status: cal.getInterpretation(),
                    ),
                  ),
                );
              }
            },
            child: Container(
              height: 70.0,
              width: double.infinity,
              color: buttonColor,
              margin: const EdgeInsets.only(top: 10.0),
              child: const Center(
                child: Text(
                  "Calculate your BMI",
                  style: TextStyle(fontSize: 27.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

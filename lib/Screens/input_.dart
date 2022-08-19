import 'package:bmi_calculator/Constants/constants_.dart';
import 'package:bmi_calculator/Components/gender_selection_.dart';
import 'package:bmi_calculator/Screens/result_.dart';
import 'package:bmi_calculator/backendLogic/calculations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../Components/card_.dart';

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
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGen = Gender.male;
                      });
                    },
                    onDoubleTap: () {
                      setState(() {
                        selectedGen = null;
                      });
                    },
                    child: GenderSelection(
                      icon: Icons.male,
                      text: "Male",
                      colour: (selectedGen == Gender.male)
                          ? activeCardColor
                          : inActiveCardColor,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGen = Gender.female;
                      });
                    },
                    onDoubleTap: () {
                      setState(() {
                        selectedGen = null;
                      });
                    },
                    child: GenderSelection(
                      icon: Icons.female,
                      text: "Female",
                      colour: (selectedGen == Gender.female)
                          ? activeCardColor
                          : inActiveCardColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BMICard(
              color: const Color(0xff1D1E33),
              childCard: Column(children: [
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
                      cal.height.toString(),
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
                  value: cal.height.toDouble(),
                  onChanged: (double newValue) {
                    setState(() {
                      cal.height = newValue.round();
                    });
                  },
                  min: 180.0,
                  max: 220.0,
                ),
              ]),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BMICard(
                    color: const Color(0xff1D1E33),
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Weight".toUpperCase(),
                          style: const TextStyle(
                            color: grey,
                            fontSize: 30.0,
                          ),
                        ),
                        Text(
                          cal.weight.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    if (cal.weight >= 0) {
                                      cal.weight--;
                                    }
                                  });
                                },
                                fillColor: inActiveCardColor,
                                shape:
                                    const CircleBorder(side: BorderSide.none),
                                constraints: const BoxConstraints.tightFor(
                                  width: 50.0,
                                  height: 50.0,
                                ),
                                child: const Icon(FontAwesomeIcons.minus),
                              ),
                            ),
                            Expanded(
                              child: RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    cal.weight++;
                                  });
                                },
                                fillColor: inActiveCardColor,
                                shape:
                                    const CircleBorder(side: BorderSide.none),
                                constraints: const BoxConstraints.tightFor(
                                  width: 50.0,
                                  height: 50.0,
                                ),
                                child: const Icon(FontAwesomeIcons.add),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BMICard(
                    color: const Color(0xff1D1E33),
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age".toUpperCase(),
                          style: const TextStyle(
                            color: grey,
                            fontSize: 30.0,
                          ),
                        ),
                        Text(
                          cal.age.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    if (cal.age >= 0) {
                                      cal.age--;
                                    }
                                  });
                                },
                                fillColor: inActiveCardColor,
                                shape:
                                    const CircleBorder(side: BorderSide.none),
                                constraints: const BoxConstraints.tightFor(
                                  width: 50.0,
                                  height: 50.0,
                                ),
                                child: const Icon(FontAwesomeIcons.minus),
                              ),
                            ),
                            Expanded(
                              child: RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    cal.age++;
                                  });
                                },
                                fillColor: inActiveCardColor,
                                shape:
                                    const CircleBorder(side: BorderSide.none),
                                constraints: const BoxConstraints.tightFor(
                                  width: 50.0,
                                  height: 50.0,
                                ),
                                child: const Icon(FontAwesomeIcons.add),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
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
          )
        ],
      ),
    );
  }
}

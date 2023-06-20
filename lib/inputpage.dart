import 'dart:ffi';

import 'package:flutter/material.dart';
import 'main.dart';
import 'reuseablecard.dart';
import 'icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'results.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 60;
  Gender? selectedgender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reuseablecard(
                    onpress: () {
                      setState(() {
                        selectedgender = Gender.male;
                      });
                    },
                    colour: selectedgender == Gender.male
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    Cardchild: Iconsselection(
                      icons: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: Reuseablecard(
                    onpress: () {
                      setState(() {
                        selectedgender = Gender.female;
                      });
                    },
                    colour: selectedgender == Gender.female
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    Cardchild: Iconsselection(
                      icons: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Reuseablecard(
                  colour: kactiveCardColor,
                  Cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('HEIGHT', style: klabelstyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: knostyle,
                          ),
                          Text(
                            'cm',
                            style: klabelstyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x1fEB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            min: 120,
                            max: 220,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            }),
                      )
                    ],
                  ))),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: Reuseablecard(
                        colour: kactiveCardColor,
                        Cardchild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: klabelstyle,
                            ),
                            Text(
                              weight.toString(),
                              style: knostyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Roundbutton(
                                  icons: FontAwesomeIcons.plus,
                                  onpressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Roundbutton(
                                  icons: FontAwesomeIcons.minus,
                                  onpressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ))),
                Expanded(
                    child: Reuseablecard(
                  colour: kactiveCardColor,
                  Cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: klabelstyle,
                        ),
                        Text(
                          age.toString(),
                          style: knostyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Roundbutton(
                              icons: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Roundbutton(
                              icons: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        )
                      ]),
                )),
              ],
            ),
          ),
          Bottombutton(
            buttonName: 'CALCULATE',
            ontap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Results(
                      bmiresult: calc.calculateBMI(),
                      resulttext: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ));
            },
          )
        ],
      ),
    );
  }
}

class Roundbutton extends StatelessWidget {
  Roundbutton({required this.icons, required this.onpressed});
  final IconData icons;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icons),
      constraints: BoxConstraints.tightFor(
        height: 46,
        width: 46,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      elevation: 6,
      onPressed: onpressed,
    );
  }
}

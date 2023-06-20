import 'package:bmi_cal/constants.dart';
import 'package:bmi_cal/reuseablecard.dart';
import 'package:flutter/material.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

class Results extends StatelessWidget {
  Results(
      {required this.bmiresult,
      required this.resulttext,
      required this.interpretation});
  final String bmiresult;
  final String resulttext;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: Text(
              'YOUR RESULT',
              style: ktitlestyle,
            ),
          )),
          Expanded(
              flex: 5,
              child: Reuseablecard(
                colour: kactiveCardColor,
                Cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resulttext.toUpperCase(),
                        style: kresultstyle,
                      ),
                      Text(
                        bmiresult,
                        style: ktitlestyle,
                      ),
                      Text(interpretation)
                    ]),
              )),
          Bottombutton(
            buttonName: 'RE-CALCULATE',
            ontap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

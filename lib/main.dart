import 'package:flutter/material.dart';
import 'reuseablecard.dart';
import 'icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'inputpage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: InputPage(),
    );
  }
}

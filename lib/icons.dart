import 'package:flutter/material.dart';
import 'main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class Iconsselection extends StatelessWidget {
  Iconsselection({required this.icons, required this.label});
  final IconData icons;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icons,
          size: 50,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: klabelstyle,
        ),
      ],
    );
  }
}

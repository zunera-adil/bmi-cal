import 'package:flutter/material.dart';

class Reuseablecard extends StatelessWidget {
  Reuseablecard({required this.colour, required this.Cardchild, this.onpress});
  Color colour;
  final Widget Cardchild;
  final onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: Cardchild,
        height: 200,
        width: 170,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

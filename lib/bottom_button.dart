import 'package:flutter/material.dart';

class Bottombutton extends StatelessWidget {
  final VoidCallback ontap;
  final String buttonName;
  const Bottombutton(
      {super.key, required this.ontap, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Expanded(
        child: Container(
          child: Center(
            child: Text(buttonName),
          ),
          color: Colors.pink,
          margin: EdgeInsets.only(top: 10),
          width: double.infinity,
          height: 80,
        ),
      ),
    );
  }
}

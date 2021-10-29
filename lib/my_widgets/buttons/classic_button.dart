import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ClassicButton extends StatelessWidget {
  const ClassicButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(""),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(50),
          color: HexColor("9962DB")),
    );
  }
}

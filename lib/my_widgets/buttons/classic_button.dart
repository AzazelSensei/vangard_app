import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ClassicButton extends StatelessWidget {
  final String? title;
  const ClassicButton({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("$title"),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(50),
          color: HexColor("9962DB")),
    );
  }
}

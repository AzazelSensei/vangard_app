import 'package:flutter/material.dart';
import 'package:vangard_app/extensions/ui_extension.dart';

class AGInputLabel extends StatelessWidget {
  final String labelTexts;
  final Icon? icons;
  const AGInputLabel({Key? key, required this.labelTexts, this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: Colors.black),
      child: Container(
        height: context.lowHeight * 2,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  labelText: labelTexts,
                  prefixIcon: icons,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

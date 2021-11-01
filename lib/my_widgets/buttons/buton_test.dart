import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vangard_app/extensions/ui_extension.dart';

class ButonTest extends StatelessWidget {
  const ButonTest({Key? key, this.title, this.onpressed}) : super(key: key);

  final String? title;
  final Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      child: Container(
        padding: context.lowPadding / 10,
        child: Text(title ?? "Button",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.white,
                )),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20)),
        backgroundColor: MaterialStateProperty.all(HexColor("9962DB")),
      ),
    );
  }
}

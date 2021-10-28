import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ButonTest extends StatelessWidget {
  const ButonTest({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: FittedBox(
        child: Text(title ?? "Button",
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.white, fontSize: 17)),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20)),
        backgroundColor: MaterialStateProperty.all(HexColor("9962DB")),
      ),
    );
  }
}

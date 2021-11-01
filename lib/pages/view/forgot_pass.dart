import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vangard_app/my_widgets/buttons/buton_test.dart';
import 'package:vangard_app/my_widgets/page_extension/inputlabel.dart';
import 'package:vangard_app/my_widgets/page_extension/ag_app_bar.dart';
import 'package:vangard_app/extensions/ui_extension.dart';
import 'package:vangard_app/pages/view/login_page.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(primary: HexColor("9962DB"))),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          decoration: backgroundImage,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: const AGAppBar(
              title: "FORGOT MY PASSWORD",
            ),
            body: SafeArea(
              child: Padding(
                padding: context.lowHorPadding * 1.3,
                child: Column(
                  children: [
                    Padding(padding: context.normalVerPadding / 4),
                    const AGInputLabel(
                      labelTexts: ("Mail Adress"),
                      icons: Icon(
                        Icons.mail_outline,
                        color: Colors.black54,
                      ),
                    ),
                    Padding(padding: context.lowVerPadding * 0.7),
                    orText,
                    Padding(padding: context.lowVerPadding * 0.7),
                    const AGInputLabel(
                      labelTexts: ("User ID"),
                      icons: Icon(
                        Icons.person,
                        color: Colors.black54,
                      ),
                    ),
                    Padding(padding: context.lowVerPadding * 0.7),
                    ButonTest(
                      onpressed: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) =>
                              CupertinoAlertDialog(
                            title: const Text('Your Password'),
                            content: const Text('Introduction send your mail.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage())),
                                child: const Text('CONFIRM'),
                              ),
                            ],
                          ),
                        );
                      },
                      title: "CONFIRM",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding get orText => Padding(
        padding: context.lowHorPadding * 1,
        child: Row(
          children: [
            Expanded(
                child: Container(
              height: 1.5,
              color: Colors.black54,
            )),
            Padding(
              padding: context.lowHorPadding * 1,
              child: Text(
                'OR',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: Container(
              height: 1.5,
              color: Colors.black54,
            )),
          ],
        ),
      );

  BoxDecoration get backgroundImage => const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/image/background.png"),
          fit: BoxFit.fill,
        ),
      );
}

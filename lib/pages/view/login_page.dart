// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vangard_app/extensions/ui_extension.dart';
import 'package:vangard_app/my_widgets/buttons/social_button.dart';
import 'package:vangard_app/navigation_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: backgroundImage,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.09, right: size.width * 0.09),
                child: ListView(
                  children: [
                    Container(height: context.lowHeight * 3),
                    Center(
                      child: loginText,
                    ),
                    Container(height: context.lowHeight),
                    userIdContainer,
                    Container(height: context.lowHeight),
                    passwordContainer,
                    Container(height: context.lowHeight),
                    loginButton,
                    Container(height: context.lowHeight * 1.1),
                    forgotPassText,
                    Container(height: context.lowHeight),
                    orConnectWithText,
                    Container(height: context.lowHeight * 2),
                    connectionMethodFirstRow,
                    Container(height: context.lowHeight / 1.5),
                    connectionMethodSecondRow,
                    Container(height: context.normalHeight * 1.1),
                    dontHaveAccountSignUpText,
                    Container(height: context.normalHeight * 1.1),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Padding get dontHaveAccountSignUpText => Padding(
        padding: EdgeInsets.all(0),
        child: GestureDetector(
          onTap: () {
            SemanticsFlag.isSelected;
            const Shadow(
                color: Colors.black, blurRadius: 5, offset: Offset.zero);
          },
          child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.black12),
                shape: MaterialStateProperty.all(const StadiumBorder()),
              ),
              onPressed: () {},
              child: Text.rich(
                TextSpan(
                  text: "Don't have a account? ",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.white.withOpacity(0.95),
                      ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Sign Up',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    // can add more TextSpans here...
                  ],
                ),
              )),
        ),
      );

  Center get connectionMethodSecondRow => Center(
        child: SocialButton(
          onTap: () {},
          image: "faceicon.png",
          title: "FACEBOOK",
          color: Colors.white,
        ),
      );

  Row get connectionMethodFirstRow => Row(
        children: [
          Expanded(
            child: SocialButton(
              onTap: () {},
              image: "googleicon.png",
              title: "GOOGLE",
              color: Colors.white,
            ),
          ),
          Container(
            width: 20,
          ),
          Expanded(
            child: SocialButton(
              onTap: () {},
              image: "appleicon.png",
              title: "APPLE",
              color: Colors.white,
            ),
          )
        ],
      );

  Row get orConnectWithText => Row(
        children: [
          Expanded(
              child: Container(
            height: 1.5,
            color: Colors.black,
          )),
          Padding(
            padding: context.lowHorPadding * 1.2,
            child: Text(
              'OR CONNECT\nWITH',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: Container(
            height: 1.5,
            color: Colors.black87,
          )),
        ],
      );

  Center get forgotPassText => Center(
        child: TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.black12),
            shape: MaterialStateProperty.all(const StadiumBorder()),
          ),
          onPressed: () {},
          child: RichText(
            text: TextSpan(
              text: '',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.white),
              children: const <TextSpan>[
                TextSpan(
                    text: 'Forgot your password?',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ''),
              ],
            ),
          ),
        ),
      );

  CupertinoButton get loginButton => CupertinoButton(
        borderRadius: BorderRadius.circular(50),
        color: const Color(0xff5327F2),
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => NavigationPage()));
        },
        child: Center(
          heightFactor: context.lowHeight / 30,
          child: Text("LOGIN",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      );

  Container get passwordContainer => Container(
        height: context.lowHeight * 2,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(50)),
        child: Row(
          children: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.lock,
              ),
            ),
            Expanded(
                child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'PASSWORD',
                border: InputBorder.none,
              ),
            )),
          ],
        ),
      );

  Container get userIdContainer => Container(
        height: context.lowHeight * 2,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Row(
          children: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.person,
              ),
            ),
            Expanded(
                child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'USER ID',
                border: InputBorder.none,
              ),
            )),
          ],
        ),
      );

  Text get loginText => Text(
        "LOGIN",
        style: Theme.of(context).textTheme.headline6!.copyWith(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 45),
      );

  BoxDecoration get backgroundImage => BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/image/login_backgraund.png"),
          fit: BoxFit.fill,
        ),
      );

  Widget spacer({double? height}) => SizedBox(
        height: height ?? 20,
      );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vangard_app/pages/view/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int _currentStep = 0;
  late String name, mail, password;
  late List<Step> allSteps;
  bool hata = false;

  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    allSteps = _allSteps();

    return Theme(
      data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(primary: HexColor("9962DB"))),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginPage())),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          automaticallyImplyLeading: false,
          title: Text(
            'Sign Up',
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Stepper(
            steps: allSteps,
            currentStep: _currentStep,
            /* onStepTapped: (tiklanilanStep) {
              setState(() {
                _aktifStep = tiklanilanStep;
              });
            },*/
            onStepContinue: () {
              setState(() {
                forwardButtonControl();
              });
            },
            onStepCancel: () {
              setState(() {
                if (_currentStep > 0) {
                  _currentStep--;
                } else {
                  _currentStep = 0;
                }
              });
            },
          ),
        ),
      ),
    );
  }

  List<Step> _allSteps() {
    List<Step> stepler = [
      Step(
        title: Text(
          "UserID",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.black, fontSize: 17),
        ),
        subtitle: const Text("*Cannot be less than 3 characters."),
        state: _setState(0),
        isActive: true,
        content: TextFormField(
            key: key0,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "UserID",
            ),
            validator: (girilenDeger) {
              if (girilenDeger!.length < 3) {
                return "Cannot be less than 3 characters";
              } else {
                return null;
              }
            },
            onSaved: (value) {
              setState(() {
                name = value!;
              });
            }),
      ),
      Step(
        title: Text(
          "Mail",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.black, fontSize: 17),
        ),
        subtitle: const Text("*Please enter a valid e-mail."),
        state: _setState(1),
        isActive: true,
        content: TextFormField(
            key: key1,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "MailLabel",
              hintText: "MailHint",
            ),
            validator: (girilenDeger) {
              if (girilenDeger!.length < 6 || !girilenDeger.contains("@")) {
                return "Geçerli bir mail adresi giriniz";
              } else {
                return null;
              }
            },
            onSaved: (girilenDeger) {
              setState(() {
                mail = girilenDeger!;
              });
            }),
      ),
      Step(
        title: Text(
          "Şifre başlık",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.black, fontSize: 17),
        ),
        subtitle: const Text("Şifre alt başlık"),
        state: _setState(2),
        isActive: true,
        content: TextFormField(
          key: key2,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "ŞifreText",
            hintText: "ŞifreHint",
          ),
          validator: (girilenDeger) {
            if (girilenDeger!.length < 6) {
              return "Şifreniz en az altı karakter olmalı.";
            } else {
              return null;
            }
          },
          onSaved: (girilenDeger) {
            setState(() {
              password = girilenDeger!;
            });
          },
        ),
      ),
    ];
    return stepler;
  }

  _setState(int oankiStep) {
    if (_currentStep == oankiStep) {
      if (hata) {
        return StepState.error;
      } else {
        return StepState.editing;
      }
    } else {
      return StepState.complete;
    }
  }

  void forwardButtonControl() {
    switch (_currentStep) {
      case 0:
        if (key0.currentState!.validate()) {
          key0.currentState!.save();
          hata = false;
          _currentStep = 1;
        } else {
          hata = true;
        }
        break;

      case 1:
        if (key1.currentState!.validate()) {
          key1.currentState!.save();
          hata = false;
          _currentStep = 2;
        } else {
          hata = true;
        }
        break;

      case 2:
        if (key2.currentState!.validate()) {
          key2.currentState!.save();
          hata = false;
          formTamamlandi();
        } else {
          hata = true;
        }
        break;
    }
  }

  void formTamamlandi() {
    debugPrint(
        "Girilen değerler : isim : $name, mail : $mail, şifre : $password");
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vangard_app/pages/view/login_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int _aktifStep = 0;
  late String isim, mail, sifre;
  late List<Step> butunStepler;
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
    butunStepler = _tumStepler();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage())),
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
          steps: butunStepler,
          currentStep: _aktifStep,
          /* onStepTapped: (tiklanilanStep) {
            setState(() {
              _aktifStep = tiklanilanStep;
            });
          },*/
          onStepContinue: () {
            setState(() {
              ileriButonuKontrolu();
            });
          },
          onStepCancel: () {
            setState(() {
              if (_aktifStep > 0) {
                _aktifStep--;
              } else {
                _aktifStep = 0;
              }
            });
          },
        ),
      ),
    );
  }

  List<Step> _tumStepler() {
    List<Step> stepler = [
      Step(
        title: Text("UserName başlık"),
        subtitle: Text("UserName alt başlık"),
        state: _stateleriAyarla(0),
        isActive: true,
        content: TextFormField(
            key: key0,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "LabelText",
              hintText: "HintText",
            ),
            validator: (girilenDeger) {
              if (girilenDeger!.length < 6) {
                return "En az 6 karakter giriniz";
              } else
                return null;
            },
            onSaved: (girilenDeger) {
              setState(() {
                isim = girilenDeger!;
              });
            }),
      ),
      Step(
        title: Text("Mail Başlık"),
        subtitle: Text("Mail alt başlık"),
        state: _stateleriAyarla(1),
        isActive: true,
        content: TextFormField(
            key: key1,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "MailLabel",
              hintText: "MailHint",
            ),
            validator: (girilenDeger) {
              if (girilenDeger!.length < 6 || !girilenDeger.contains("@")) {
                return "Geçerli bir mail adresi giriniz";
              } else
                return null;
            },
            onSaved: (girilenDeger) {
              setState(() {
                mail = girilenDeger!;
              });
            }),
      ),
      Step(
        title: Text("Şifre başlık"),
        subtitle: Text("Şifre alt başlık"),
        state: _stateleriAyarla(2),
        isActive: true,
        content: TextFormField(
          key: key2,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "ŞifreText",
            hintText: "ŞifreHint",
          ),
          validator: (girilenDeger) {
            if (girilenDeger!.length < 6) {
              return "Şifreniz en az altı karakter olmalı.";
            } else
              return null;
          },
          onSaved: (girilenDeger) {
            setState(() {
              sifre = girilenDeger!;
            });
          },
        ),
      ),
    ];
    return stepler;
  }

  _stateleriAyarla(int oankiStep) {
    if (_aktifStep == oankiStep) {
      if (hata) {
        return StepState.error;
      } else
        return StepState.editing;
    } else
      return StepState.complete;
  }

  void ileriButonuKontrolu() {
    switch (_aktifStep) {
      case 0:
        if (key0.currentState!.validate()) {
          key0.currentState!.save();
          hata = false;
          _aktifStep = 1;
        } else {
          hata = true;
        }
        break;

      case 1:
        if (key1.currentState!.validate()) {
          key1.currentState!.save();
          hata = false;
          _aktifStep = 2;
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
    debugPrint("Girilen değerler : isim : $isim, mail : $mail, şifre : $sifre");
  }
}

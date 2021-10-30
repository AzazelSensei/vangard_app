import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vangard_app/pages/view/login_page.dart';
import 'package:vangard_app/pages/view/open_post_view/alert_dialog.dart';

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
  var key3 = GlobalKey<FormFieldState>();

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
            controlsBuilder: (context, {onStepCancel, onStepContinue}) {
              return Container(
                margin: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: onStepContinue,
                          child: const Text("CONTİUNE"),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                const StadiumBorder()),
                            textStyle: MaterialStateProperty.all(
                                const TextStyle(fontSize: 15)),
                            backgroundColor:
                                MaterialStateProperty.all(HexColor("9962DB")),
                          )),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    if (_currentStep != 0)
                      Expanded(
                          child: ElevatedButton(
                              onPressed: onStepCancel,
                              child: const Text("CANCEL"),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    const StadiumBorder()),
                                textStyle: MaterialStateProperty.all(
                                    const TextStyle(fontSize: 15)),
                                backgroundColor: MaterialStateProperty.all(
                                    HexColor("9962DB")),
                              ))),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              );
            },
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
          "User ID",
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
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              hintText: "UserID",
            ),
            validator: (value) {
              if (value!.length < 3) {
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
          "Mail Adress",
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
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              hintText: "Mail@mail.com",
            ),
            validator: (value) {
              if (value!.length < 6 || !value.contains("@")) {
                return "Please enter a valid e-mail.";
              } else {
                return null;
              }
            },
            onSaved: (value) {
              setState(() {
                mail = value!;
              });
            }),
      ),
      Step(
        title: Text(
          "Password",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.black, fontSize: 17),
        ),
        subtitle: const Text("*Cannot be less than 6 characters."),
        state: _setState(2),
        isActive: true,
        content: TextFormField(
          key: key2,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            hintText: "Password",
          ),
          validator: (value) {
            if (value!.length < 6) {
              return "Cannot be less than 6 characters.";
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
      Step(
        title: Text(
          "Password Again",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.black, fontSize: 17),
        ),
        subtitle: const Text("*Cannot be less than 6 characters."),
        state: _setState(3),
        isActive: true,
        content: TextFormField(
          key: key3,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            hintText: "Password",
          ),
          validator: (value) {
            if (value!.length < 6) {
              return "Cannot be less than 6 characters.";
            } else {
              return null;
            }
          },
          onSaved: (value) {
            setState(() {
              password = value!;
            });
          },
        ),
      ),
    ];
    return stepler;
  }

  _setState(int currentStep) {
    if (_currentStep == currentStep) {
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
          _currentStep = 3;
        } else {
          hata = true;
        }
        break;

      case 3:
        if (key3.currentState!.validate()) {
          key3.currentState!.save();
          hata = false;
          const AgAlert();
        } else {
          hata = true;
        }
        break;
    }
  }

  CupertinoAlertDialog formTamamlandi() {
    return CupertinoAlertDialog(
      title: const Text("Registration Succesfull!"),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }
}

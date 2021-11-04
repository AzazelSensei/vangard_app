import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vangard_app/my_widgets/page_extension/ag_app_bar.dart';
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
      child: Container(
        decoration: backgroundImage,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AGAppBar(titlee: "SIGN UP"),
          body: SingleChildScrollView(
            child: Stepper(
              controlsBuilder: (context, {onStepCancel, onStepContinue}) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: agElevatedButton(onStepContinue),
                      ),
                      Expanded(
                        child: Container(),
                        flex: 1,
                      ),
                      //if (_currentStep != 0)
                      Expanded(
                          flex: 8,
                          child: agElevatedButtonCancel(onStepCancel)),
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
      ),
    );
  }

  ElevatedButton agElevatedButtonCancel(VoidCallback? onStepCancel) {
    return ElevatedButton(
                            onPressed: onStepCancel,
                            child: const Text("CANCEL"),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  const StadiumBorder()),
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(fontSize: 15)),
                              backgroundColor: MaterialStateProperty.all(
                                  HexColor("9962DB")),
                            ));
  }

  ElevatedButton agElevatedButton(VoidCallback? onStepContinue) {
    return ElevatedButton(
                          onPressed: onStepContinue,
                          child: const Text("CONTINUE"),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                const StadiumBorder()),
                            textStyle: MaterialStateProperty.all(
                                const TextStyle(fontSize: 15)),
                            backgroundColor:
                                MaterialStateProperty.all(HexColor("9962DB")),
                          ));
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
        //subtitle: const Text("*Cannot be less than 3 characters."),
        state: _setState(0),
        isActive: true,
        content: TextFormField(
            key: key0,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              hintText: "UserID",
              filled: true,
              fillColor: Colors.white54,
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
        //subtitle: const Text("*Please enter a valid e-mail."),
        state: _setState(1),
        isActive: true,
        content: TextFormField(
            key: key1,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              hintText: "Mail@mail.com",
              filled: true,
              fillColor: Colors.white54,
            ),
            validator: (value) {
              if (value!.length < 6 || !validateEmail(value)) {
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
        //subtitle: const Text("*Cannot be less than 6 characters."),
        state: _setState(2),
        isActive: true,
        content: TextFormField(
          key: key2,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            hintText: "Password",
            filled: true,
            fillColor: Colors.white54,
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
        //subtitle: const Text("*Cannot be less than 6 characters."),
        state: _setState(3),
        isActive: true,
        content: TextFormField(
          key: key3,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            hintText: "Password",
            filled: true,
            fillColor: Colors.white54,
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
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => CupertinoAlertDialog(
              title: const Text('Sign Up Succesfull'),
              content: const Text(''),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                      (Route<dynamic> route) => false),
                  child: const Text('CONFIRM'),
                ),
              ],
            ),
          );
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

  BoxDecoration get backgroundImage => const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/image/background.png"), fit: BoxFit.fill),
      );
}

validateEmail(String email) {
  final emailReg = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  return emailReg.hasMatch(email);
}

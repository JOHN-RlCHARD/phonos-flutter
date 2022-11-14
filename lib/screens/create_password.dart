import 'package:app_fono/screens/home_paciente.dart';
import 'package:app_fono/widgets/custom_button.dart';
import 'package:app_fono/widgets/responsive_bg.dart';
import 'package:app_fono/widgets/responsive_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_password_strength/flutter_password_strength.dart';

import '../widgets/appbar.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  late String password = "";
  late String password2 = "";
  double strength = 0;
  bool isObscure = true;
  bool isObscure2 = true;
  int isCorresponding = 0;

  String correspondingText = "As senhas devem ser iguais";
  String text = "";

  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[a-zA-Z].*");

  void checkPassword(String value) {
    password = value.trim();
    checkPassword2(password2);

    if (password.isEmpty) {
      setState(() {
        strength = 0;
      });
    } else if (password.length < 6) {
      setState(() {
        strength = 1 / 4;
        text = "Senha muito curta";
      });
    } else if (password.length < 8) {
      setState(() {
        strength = 2 / 4;
        text = "Senha fraca";
      });
    } else {
      if (!letterReg.hasMatch(password) || !numReg.hasMatch(password)) {
        setState(() {
          strength = 3 / 4;
          text = "Senha média";
        });
      } else {
        setState(() {
          strength = 1;
          text = "Senha forte";
        });
      }
    }
  }

  void checkPassword2(String value) {
    password2 = value.trim();

    setState(() {
      if (password2.isEmpty) {
        isCorresponding = 0;
      } else {
        if (password2 == password)
          isCorresponding = 2;
        else
          isCorresponding = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MyAppBar(),
      ),
      body: ResponsiveBackground(
        child: Center(
          child: ResponsiveBox(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Olá, ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Fulano",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF449BC0),
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Text(
                "Cadastre sua senha!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 250),
                      child: TextFormField(
                        onChanged: ((value) => checkPassword(value)),
                        obscureText: isObscure,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(isObscure
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                          ),
                          hintText: 'Senha',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 250),
                      child: TextFormField(
                        onChanged: (value) => checkPassword2(value),
                        obscureText: isObscure2,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(isObscure2
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                isObscure2 = !isObscure2;
                              });
                            },
                          ),
                          hintText: 'Repita sua senha',
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Container(
                      height: 18,
                      constraints: BoxConstraints(maxWidth: 250),
                      child: (isCorresponding != 1)
                          ? null
                          : Text(
                              correspondingText,
                              style: TextStyle(color: Colors.red, fontSize: 13),
                            ),
                    ),

                    SizedBox(
                      height: strength == 0 ? null : 10,
                    ),

                    //PASSWORD STRENGTH INDICATOR
                    // ConstrainedBox(
                    //   constraints: BoxConstraints(maxWidth: 250),
                    //   child: (strength == 0)
                    //       ? null
                    //       : LinearProgressIndicator(
                    //           color: strength == 1 / 4
                    //               ? Colors.red
                    //               : strength == 2 / 4
                    //                   ? Colors.yellow
                    //                   : strength == 3 / 4
                    //                       ? Colors.blue
                    //                       : Colors.green,
                    //           value: strength,
                    //           backgroundColor: Colors.grey.withOpacity(0.5),
                    //         ),
                    // ),
                    Container(
                      constraints: BoxConstraints(maxWidth: 250),
                      child: strength == 0
                          ? null
                          : FlutterPasswordStrength(password: password),
                    ),
                    SizedBox(
                      height: strength == 0 ? null : 10,
                    ),
                    //PASSWORD STRENGTH TEXT
                    Container(
                      constraints: BoxConstraints(maxWidth: 250),
                      child: (strength == 0)
                          ? null
                          : Text(
                              text,
                              style: TextStyle(color: Colors.grey),
                            ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                        text: "Enviar",
                        onPressed: (strength < 2 / 4 || isCorresponding < 2)
                            ? null
                            : () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            HomePaciente())));
                              }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

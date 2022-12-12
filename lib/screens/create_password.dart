import 'package:app_fono/api/api_service.dart';
import 'package:app_fono/api/models/paciente.dart';
import 'package:app_fono/screens/choose_avatar.dart';
import 'package:app_fono/screens/home_paciente.dart';
import 'package:app_fono/variables/globals.dart';
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
          child: FutureBuilder(
            future: ApiService().getPacienteByToken(USER_TOKEN, ACCESS_TOKEN),
            builder: (BuildContext context, AsyncSnapshot<Paciente?> snapshot) { 
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: ResponsiveBox(
                    children: [
                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            "Olá, responsável de ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            snapshot.data!.fname+".",
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
                        "Como esse é seu primeiro login,\ndeverá cadastrar uma senha.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
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
                                      style:
                                          TextStyle(color: Colors.red, fontSize: 13),
                                    ),
                            ),

                            SizedBox(
                              height: strength == 0 ? null : 10,
                            ),

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
                                    : () async {
                                      ApiService().putFirstLogin(USER_TOKEN, password, ACCESS_TOKEN);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    ChooseAvatar(route: "firstLogin",))));
                                      }),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
             },
            
          ),
        ),
      ),
    );
  }
}

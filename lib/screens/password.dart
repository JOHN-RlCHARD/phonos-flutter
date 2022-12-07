import 'package:app_fono/screens/create_password.dart';
import 'package:app_fono/screens/home_paciente.dart';
import 'package:app_fono/widgets/custom_button.dart';
import 'package:app_fono/widgets/responsive_bg.dart';
import 'package:app_fono/widgets/responsive_box.dart';
import 'package:flutter/material.dart';

import '../api/models/paciente.dart';
import '../widgets/appbar.dart';

class Password extends StatefulWidget {
  final Paciente user;

  const Password({super.key, required this.user});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {

  final formKey = GlobalKey<FormState>();
  bool isObscure = true;
  String password = '';

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
              Text(
                "Digite a sua senha",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20,),
              Form(
                key: formKey,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 250),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) return 'Campo vazio';
                      if (value != widget.user.password) return 'Senha incorreta';
                      return null;
                    },
                    onChanged: ((value) => password = value),
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
              ),
              SizedBox(height: 20,),
              CustomButton(
                text: 'Entrar',
                onPressed: () {
                  final isValidForm = formKey.currentState!.validate();

                  if (isValidForm) {
                    if (widget.user.firstLogin) {
                      Navigator.push( context, MaterialPageRoute(
                              builder: ((context) => CreatePassword(user: widget.user,))));
                    } else {
                      Navigator.push( context, MaterialPageRoute(
                              builder: ((context) => HomePaciente(avatar: widget.user.img, user: widget.user,))));
                    }
                  }

                }
                )
            ],
          ),
        ),
      ),
    );
  }
}
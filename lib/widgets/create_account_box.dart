import 'package:app_fono/widgets/custom_button.dart';
import 'package:app_fono/widgets/feedback_icon.dart';
import 'package:app_fono/widgets/responsive_box.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateAccountBox extends StatefulWidget {
  const CreateAccountBox({super.key});

  @override
  State<CreateAccountBox> createState() => _LoginBoxState();
}

class _LoginBoxState extends State<CreateAccountBox> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController crfaController;
  final formKey = GlobalKey<FormState>();
  final crfaKey = GlobalKey<FormFieldState>();
  final emailKey = GlobalKey<FormFieldState>();
  final crfSize = 5;
  FeedbackIcon feedbackIconCrfa = new FeedbackIcon(null);
  FeedbackIcon feedbackIconEmail = new FeedbackIcon(null);
  bool isHiddenPassword1 = true;
  bool isHiddenPassword2 = true;
  bool enabledCrfa = true;
  bool enabledEmail = true;
  Icon passwordIcon1 = Icon(Icons.visibility_off);
  Icon passwordIcon2 = Icon(Icons.visibility_off);

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    crfaController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    crfaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBox(
      children: [
        const Text(
          'Crie sua',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        Wrap(
          children: const [
            Text(
              'Conta, ',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
            Text(
              'Fono',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
                color: Color(0xFF449BC0),
              ),
            ),
          ],
        ),
        Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  onChanged: (value) {
                    if (value.length == 5) {
                      feedbackIconCrfa = new FeedbackIcon(true);
                    } else {
                      feedbackIconCrfa = new FeedbackIcon(null);
                    }
                    setState(() {});
                  },
                  enabled: enabledCrfa,
                  key: crfaKey,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('CRFA'),
                    suffixIcon: feedbackIconCrfa,
                  ),
                  controller: crfaController,
                  validator: (value) {
                    if (value!.isEmpty && enabledCrfa) {
                      return 'Campo em branco.';
                    } else if (RegExp(r'^[a-z A-Z]+$').hasMatch(value) ||
                        value.length < crfSize && enabledCrfa) {
                      return 'Insira um CRF válido';
                    } else {
                      return null;
                    }
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    LengthLimitingTextInputFormatter(crfSize),
                  ]),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  if (EmailValidator.validate(value)) {
                    feedbackIconEmail = new FeedbackIcon(true);
                  } else {
                    feedbackIconEmail = new FeedbackIcon(null);
                  }
                  setState(() {});
                },
                enabled: enabledEmail,
                key: emailKey,
                decoration: InputDecoration(
                  label: Text('Email'),
                  suffixIcon: feedbackIconEmail,
                ),
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty && enabledEmail) {
                    return 'Campo em branco.';
                  } else if (!EmailValidator.validate(value) && enabledEmail) {
                    return 'Insira um email válido';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text('Nome Completo'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: isHiddenPassword1,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    label: Text('Senha'),
                    suffixIcon: InkWell(
                      onTap: () {
                        isHiddenPassword1 = !isHiddenPassword1;
                        if (isHiddenPassword1) {
                          passwordIcon1 = Icon(Icons.visibility_off);
                        } else {
                          passwordIcon1 = Icon(Icons.visibility);
                        }
                        setState(() {});
                      },
                      child: passwordIcon1,
                    )),
                controller: passwordController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: isHiddenPassword2,
                decoration: InputDecoration(
                  label: Text('Confirme sua senha'),
                  suffixIcon: InkWell(
                    onTap: () {
                      isHiddenPassword2 = !isHiddenPassword2;
                      if (isHiddenPassword2) {
                        passwordIcon2 = Icon(Icons.visibility_off);
                      } else {
                        passwordIcon2 = Icon(Icons.visibility);
                      }
                      setState(() {});
                    },
                    child: passwordIcon2,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
            text: 'Criar',
            onPressed: () {
              if (crfaKey.currentState!.validate() && enabledCrfa) {
                feedbackIconCrfa = new FeedbackIcon(true);
              } else if (!crfaKey.currentState!.validate() && enabledCrfa) {
                feedbackIconCrfa = new FeedbackIcon(false);
              }
              if (emailKey.currentState!.validate() && enabledEmail) {
                feedbackIconEmail = new FeedbackIcon(true);
              } else if (!emailKey.currentState!.validate() && enabledEmail) {
                feedbackIconEmail = new FeedbackIcon(false);
              }
              setState(() {});
              // if (validateLogin())
              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => FonoMainPage()));
              //if (formKey.currentState!.validate()) {}
            }),
      ],
    );
  }

  bool validateLogin() {
    if ((crfaController.text.toString() == '22222' ||
            emailController.text.toString() == 'david@david.com') &&
        passwordController.text.toString() == 'david') {
      return true;
    }
    return false;
  }
}

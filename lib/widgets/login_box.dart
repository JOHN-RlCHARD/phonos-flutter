import 'package:app_fono/screens/fono_dashboard/fono_main.dart';
import 'package:app_fono/screens/home.dart';
import 'package:app_fono/widgets/custom_button.dart';
import 'package:app_fono/widgets/feedback_icon.dart';
import 'package:app_fono/widgets/responsive_box.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginBox extends StatefulWidget {
  const LoginBox({super.key});

  @override
  State<LoginBox> createState() => _LoginBoxState();
}

class _LoginBoxState extends State<LoginBox> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController crfaController;
  final formKey = GlobalKey<FormState>();
  final crfaKey = GlobalKey<FormFieldState>();
  final emailKey = GlobalKey<FormFieldState>();
  final crfSize = 5;
  FeedbackIcon feedbackIconCrfa = new FeedbackIcon(null);
  FeedbackIcon feedbackIconEmail = new FeedbackIcon(null);
  bool isHiddenPassword = true;
  bool enabledCrfa = true;
  bool enabledEmail = true;
  Icon passwordIcon = Icon(Icons.visibility_off);

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
          'Entre na sua',
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
                  if (value.length == 0) {
                    enabledEmail = true;
                    setState(() {});
                  } else {
                    enabledEmail = false;
                    setState(() {});
                  }
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
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  LengthLimitingTextInputFormatter(crfSize),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  if (value.length == 0) {
                    enabledCrfa = true;
                    setState(() {});
                  } else {
                    enabledCrfa = false;
                    setState(() {});
                  }
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
                obscureText: isHiddenPassword,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    label: Text('Senha'),
                    suffixIcon: InkWell(
                      onTap: () {
                        isHiddenPassword = !isHiddenPassword;
                        if (isHiddenPassword) {
                          passwordIcon = Icon(Icons.visibility_off);
                        } else {
                          passwordIcon = Icon(Icons.visibility);
                        }
                        setState(() {});
                      },
                      child: passwordIcon,
                    )),
                controller: passwordController,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
            text: 'Entrar',
            onPressed: () {
              if (crfaKey.currentState!.validate() && enabledCrfa) {
                feedbackIconCrfa = FeedbackIcon(true);
              } else if (!crfaKey.currentState!.validate() && enabledCrfa) {
                feedbackIconCrfa = FeedbackIcon(false);
              }
              if (emailKey.currentState!.validate() && enabledEmail) {
                feedbackIconEmail = FeedbackIcon(true);
              } else if (!emailKey.currentState!.validate() && enabledEmail) {
                feedbackIconEmail = FeedbackIcon(false);
              }
              setState(() {});
              if (validateLogin())
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FonoMainPage()));
              //if (formKey.currentState!.validate()) {}
            }),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          children: [
            const Text(
              'Nao possui uma conta?',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            Container(
              width: 67,
              height: 16,
              child: TextButton(
                  onPressed: () {
                    
                  },
                  child: const Text(
                    'Crie agora.',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  )),
            ),
          ],
        ),
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

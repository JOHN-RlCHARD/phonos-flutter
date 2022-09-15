import 'dart:html';

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
  final crfSize = 5;
  FeedbackIcon feedbackIcon = new FeedbackIcon(false);

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
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text('CRFA'),
                  suffixIcon: feedbackIcon,
                ),
                controller: crfaController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo em branco.';
                  } else if (RegExp(r'^[a-z A-Z]+$').hasMatch(value) ||
                      value.length < crfSize) {
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
                decoration: InputDecoration(
                  label: Text('Email'),
                  suffixIcon: feedbackIcon,
                ),
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo em branco.';
                  } else if (!EmailValidator.validate(value)) {
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
                obscureText: true,
                decoration: InputDecoration(label: Text('Senha')),
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
              if (!formKey.currentState!.validate()) {
                feedbackIcon = new FeedbackIcon(true);
                setState(() {});
              }
              if (formKey.currentState!.validate()) {}
            }),
      ],
    );
  }
}

import 'package:app_fono/widgets/custom_button.dart';
import 'package:app_fono/widgets/responsive_box.dart';
import 'package:flutter/material.dart';

class LoginBox extends StatefulWidget {
  const LoginBox({super.key});

  @override
  State<LoginBox> createState() => _LoginBoxState();
}

class _LoginBoxState extends State<LoginBox> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController crfController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    crfController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    crfController.dispose();
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
              const SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(label: Text('CRF')),
                controller: crfController,
              ),
              const SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(label: Text('Email')),
                controller: emailController,
              ),
              const SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(label: Text('Senha')),
                controller: passwordController,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20,),
        CustomButton(
          text: 'Entrar',
          onPressed: () {}),
      ],
    );
  }
}

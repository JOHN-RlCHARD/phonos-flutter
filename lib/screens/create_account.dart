import 'package:app_fono/widgets/responsive_bg.dart';
import 'package:flutter/material.dart';
import '../widgets/create_account_box.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccount();
}

class _CreateAccount extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBackground(
        child: SingleChildScrollView(child: CreateAccountBox()),
      ),
    );
  }
}

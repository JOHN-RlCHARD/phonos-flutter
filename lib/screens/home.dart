import 'package:app_fono/api/api_service.dart';
import 'package:app_fono/screens/create_password.dart';
import 'package:app_fono/screens/home_paciente.dart';
import 'package:app_fono/screens/password.dart';
import 'package:app_fono/widgets/appbar.dart';
import 'package:app_fono/widgets/responsive_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../api/models/paciente.dart';
import '../widgets/custom_button.dart';
import '../widgets/responsive_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController txt1, txt2, txt3, txt4, txt5;
  late FocusNode focus1, focus2, focus3, focus4, focus5;
  String token = "";

  @override
  void initState() {
    super.initState();
    txt1 = new TextEditingController();
    txt2 = new TextEditingController();
    txt3 = new TextEditingController();
    txt4 = new TextEditingController();
    txt5 = new TextEditingController();
    focus1 = new FocusNode();
    focus2 = new FocusNode();
    focus3 = new FocusNode();
    focus4 = new FocusNode();
    focus5 = new FocusNode();
  }

  void getToken() {
    setState(() {
      token = txt1.text.toString() +
          txt2.text.toString() +
          txt3.text.toString() +
          txt4.text.toString() +
          txt5.text.toString();
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
              SizedBox(
                height: 10,
              ),
              Wrap(
                alignment: WrapAlignment.end,
                crossAxisAlignment: WrapCrossAlignment.center,
                verticalDirection: VerticalDirection.up,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Wrap(
                        children: [
                          Text(
                            'Bem vindo ao ',
                            style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            ),
                          ),
                          Text(
                            'Phonos!',
                            style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            color: Color(0xFF449BC0),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Entre com seu Token',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                          ),
                          Container(
                            constraints: BoxConstraints(maxWidth: 200, minWidth: 100),
                            width: 200,
                            child: Image(
                              image: AssetImage('assets/dog_login.png'),
                            ),
                          ),
                        ],
                      ),
              

              Container(
                width: 250,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 45,
                      child: TextField(
                        focusNode: focus1,
                        controller: txt1,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        inputFormatters: [UpperCaseTextFormatter()],
                        onChanged: (value) {
                          if (value.length == 1)
                            FocusScope.of(context).requestFocus(focus2);
                        },
                        decoration: InputDecoration(
                            counterText: "",
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.3)),
                      ),
                    ),
                    Container(
                      width: 45,
                      child: TextField(
                        focusNode: focus2,
                        controller: txt2,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        inputFormatters: [UpperCaseTextFormatter()],
                        onChanged: (value) {
                          if (value.length == 1)
                            FocusScope.of(context).requestFocus(focus3);
                          if (value.length == 0)
                            FocusScope.of(context).requestFocus(focus1);
                        },
                        decoration: InputDecoration(
                            counterText: "",
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.3)),
                      ),
                    ),
                    Container(
                      width: 45,
                      child: TextField(
                        focusNode: focus3,
                        controller: txt3,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        inputFormatters: [UpperCaseTextFormatter()],
                        onChanged: (value) {
                          if (value.length == 1)
                            FocusScope.of(context).requestFocus(focus4);
                          if (value.length == 0)
                            FocusScope.of(context).requestFocus(focus2);
                        },
                        decoration: InputDecoration(
                            counterText: "",
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.3)),
                      ),
                    ),
                    Container(
                      width: 45,
                      child: TextField(
                        focusNode: focus4,
                        controller: txt4,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        inputFormatters: [UpperCaseTextFormatter()],
                        onChanged: (value) {
                          if (value.length == 1)
                            FocusScope.of(context).requestFocus(focus5);
                          if (value.length == 0)
                            FocusScope.of(context).requestFocus(focus3);
                        },
                        decoration: InputDecoration(
                            counterText: "",
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.3)),
                      ),
                    ),
                    Container(
                      width: 45,
                      child: TextField(
                        focusNode: focus5,
                        controller: txt5,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        inputFormatters: [UpperCaseTextFormatter()],
                        onChanged: (value) {
                          getToken();
                          if (value.length == 0)
                            FocusScope.of(context).requestFocus(focus4);
                        },
                        decoration: InputDecoration(
                            counterText: "",
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.3)),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 30,
              ),
              CustomButton(
                text: 'Entrar',
                onPressed: (token.length != 5)
                    ? null
                    : () async {
                        token = '${txt1.text.toString()}${txt2.text.toString()}${txt3.text.toString()}${txt4.text.toString()}${txt5.text.toString()}';
                        // Navigator.push(
                        // context,
                        // MaterialPageRoute(
                        //     builder: ((context) => Test())));
                        List<Paciente> pacientes = await ApiService().getPacientes(); 
                        bool isValidToken = false;
                        Paciente user = Paciente(id: '0', fname: '0', lname: '0', img: '0', bday: '0', condicao: '0', password: '0', fonos: ['0'], token: '0', firstLogin: false, v: 0);
                        for (int i=0; i<pacientes.length; i++) {
                          if (pacientes[i].token == token) {
                            isValidToken = true;
                            user = pacientes[i];                          }
                        }

                        if (isValidToken) {
                            Navigator.push( context, MaterialPageRoute(
                              builder: ((context) => Password(user: user,))));
                        } else { showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                            actionsAlignment: MainAxisAlignment.center,
                            title: Center(child: Text('Token Inválido')),
                            actions: [
                              TextButton(
                                onPressed: () {Navigator.of(context).pop();},
                                child: Text("Ok")
                              )
                            ],
                            );
                          }
                        );
                        }
                      },
              ),
              //SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

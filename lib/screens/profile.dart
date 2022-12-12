import 'package:app_fono/api/api_service.dart';
import 'package:app_fono/api/models/fono.dart';
import 'package:app_fono/api/models/paciente.dart';
import 'package:app_fono/variables/globals.dart';
import 'package:app_fono/widgets/custom_button.dart';
import 'package:app_fono/widgets/responsive_bg.dart';
import 'package:app_fono/widgets/responsive_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/appbar.dart';
import 'choose_avatar.dart';

class ProfileScreen extends StatefulWidget {

  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String idade="";
  List<Fono?> fonos = [];

  Future<Paciente?> calcularIdade() async {
    var now = DateTime.now();

    var user = await ApiService().getPacienteByToken(USER_TOKEN, ACCESS_TOKEN);
  
    for (int i=0; i<user!.fonos.length; i++) {
      var fono = await ApiService().getFonoByCrfa(user.fonos[i], ACCESS_TOKEN);
      fonos.add(fono);
    }

    var birthYear = user.bday.substring(0,4);
    var birthYearInt = int.parse(birthYear);

    var birthMonth = user.bday.substring(5,7);
    var birthMonthInt = int.parse(birthMonth);

    var birthDay = user.bday.substring(8,10);
    var birthDayInt = int.parse(birthDay);

    var idadeInt = now.year - birthYearInt;

    if (now.month<=birthMonthInt && now.day<birthDayInt) idadeInt--;

    idade = idadeInt.toString();

    return user;

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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: FutureBuilder(
                future: calcularIdade(),
                builder: (BuildContext context, AsyncSnapshot<Paciente?> snapshot) { 
                  if (snapshot.hasData) {
                    return ResponsiveBox(
                      children: [
                        Container(
                          width: 80,
                          child: Image(image: AssetImage(snapshot.data!.img,),)
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                          icon: Icon(Icons.change_circle),
                          text: 'Mudar Avatar',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      ChooseAvatar(route: "changeAvatar",))));
                          }
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: 300),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Wrap(
                                children: [
                                  Container(
                                    width: 70,
                                    child: Text(
                                      'Token: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                          fontSize: 18),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    snapshot.data!.token,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                        fontSize: 18),
                                  )
                                ],
                              ),
                              Wrap(
                                children: [
                                  Container(
                                    width: 70,
                                    child: Text(
                                      'Nome: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                          fontSize: 18),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    snapshot.data!.fname+" "+snapshot.data!.lname,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                        fontSize: 18),
                                  )
                                ],
                              ),
                              Wrap(
                                children: [
                                  Container(
                                    width: 70,
                                    child: Text(
                                      'Idade: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                          fontSize: 18),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    child: Text(
                                      idade+" anos",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                          fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                              Wrap(
                                children: [
                                  Container(
                                    width: 70,
                                    child: Text(
                                      'Fonos: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                          fontSize: 18),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    constraints: BoxConstraints(maxHeight: 100, maxWidth: 120),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: fonos.length,
                                      itemBuilder: (BuildContext context, int index) { 
                                        return Text(
                                          fonos[0]!.fname+" "+fonos[0]!.lname,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54,
                                            fontSize: 18),
                                        );
                                      },
                                      ),
                                  )
                                  
                                ],
                              ),
                            ],
                          ),
                        ),
                        
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Suas Medalhas',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 23),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset('assets/gold_medal.svg'),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  '2',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset('assets/silver_medal.svg'),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  '5',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset('assets/bronze_medal.svg'),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  '10',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          'Total de jogos completos: 17',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                              fontSize: 23),
                        ),
                      ],
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                 },
                
              ),
            ),
          ),
        ),
      ),
    );
  }
}

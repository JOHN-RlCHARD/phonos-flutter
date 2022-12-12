import 'package:app_fono/api/models/paciente.dart';
import 'package:app_fono/widgets/responsive_bg.dart';
import 'package:app_fono/widgets/responsive_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/appbar.dart';

class ProfileScreen extends StatefulWidget {
  final Paciente user;
  final String avatar;

  ProfileScreen({super.key, required this.user, required this.avatar});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String idade="";


  void calcularIdade() {
    var now = DateTime.now();

    var birthYear = widget.user.bday.substring(0,4);
    var birthYearInt = int.parse(birthYear);

    var birthMonth = widget.user.bday.substring(5,7);
    var birthMonthInt = int.parse(birthMonth);

    var birthDay = widget.user.bday.substring(8,10);
    var birthDayInt = int.parse(birthDay);

    var idadeInt = now.year - birthYearInt;

    if (now.month<=birthMonthInt && now.day<birthDayInt) idadeInt--;

    idade = idadeInt.toString();

  }
  
  @override
  void initState() {
    calcularIdade();
    super.initState();
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
              Container(
                width: 80,
                child: Image(image: AssetImage(widget.avatar,),)
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                constraints: BoxConstraints(maxWidth: 360),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Seu Nome: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 18),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.user.fname+" "+widget.user.lname,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 18),
                    )
                  ],
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 360),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Idade: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 18),
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
                mainAxisAlignment: MainAxisAlignment.center,
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
          ),
        ),
      ),
    );
  }
}

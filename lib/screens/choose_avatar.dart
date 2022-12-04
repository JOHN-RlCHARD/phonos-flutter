import 'package:app_fono/screens/home_paciente.dart';
import 'package:app_fono/widgets/custom_button.dart';
import 'package:app_fono/widgets/responsive_bg.dart';
import 'package:app_fono/widgets/responsive_box.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar.dart';

class ChooseAvatar extends StatefulWidget {
  const ChooseAvatar({super.key});

  @override
  State<ChooseAvatar> createState() => _ChooseAvatarState();
}

class _ChooseAvatarState extends State<ChooseAvatar> with TickerProviderStateMixin {

  late String selectedAvatar;

  late AnimationController _colorAnimationController0;
  late AnimationController _colorAnimationController1;
  late AnimationController _colorAnimationController2;
  late Animation _iconColorAnimation0;
  late Animation _iconColorAnimation1;
  late Animation _iconColorAnimation2;
  bool _active0 = false;
  bool _active1 = false;
  bool _active2 = false;

  @override
  void initState() {

    _colorAnimationController0 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds:500),
    );

    _colorAnimationController1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds:500),
    );

    _colorAnimationController2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds:500),
    );

    _iconColorAnimation0 = ColorTween(
      begin: Colors.white,
      end: Color(0xFFB6DDED),
    ).animate(_colorAnimationController0)..addListener(() {
      setState(() {});
    });

    _iconColorAnimation1 = ColorTween(
      begin: Colors.white,
      end: Color(0xFFB6DDED),
    ).animate(_colorAnimationController1)..addListener(() {
      setState(() {});
    });

    _iconColorAnimation2 = ColorTween(
      begin: Colors.white,
      end: Color(0xFFB6DDED),
    ).animate(_colorAnimationController2)..addListener(() {
      setState(() {});
    });

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
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: ResponsiveBox(
                  children: [
                    Text(
                        "Escolha o avatar com que você mais se identifica!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Mas não se preocupe,\n você poderá alterá-lo depois.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    SizedBox(height: 20,),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      children: [
                        
                        AvatarCard(
                          avatar: 0,
                          color: _iconColorAnimation0.value,
                          onTap: () {
                            _active0
                              ? _colorAnimationController0.forward()
                              : _colorAnimationController0.reverse();

                              _active0 = !_active0;

                            if(!_active1) {
                              _colorAnimationController1.reverse();
                              _active1 = !_active1;
                              }
                            if(!_active2) {
                              _colorAnimationController2.reverse();
                              _active2 = !_active2;
                            }

                            selectedAvatar = 'assets/avatar_dog.png';

                          },
                        ),
                        AvatarCard(
                          avatar: 1,
                          color: _iconColorAnimation1.value,
                          onTap: () {
                            _active1
                              ? _colorAnimationController1.forward()
                              : _colorAnimationController1.reverse();

                              _active1 = !_active1;

                              if(!_active0) {
                              _colorAnimationController0.reverse();
                              _active0 = !_active0;
                              }
                            if(!_active2) {
                              _colorAnimationController2.reverse();
                              _active2 = !_active2;
                            }

                            selectedAvatar = 'assets/avatar_coruja.png';

                          },
                        ),
                        AvatarCard(
                          avatar: 2,
                          color: _iconColorAnimation2.value,
                          onTap: () {
                            _active2
                              ? _colorAnimationController2.forward()
                              : _colorAnimationController2.reverse();

                              _active2 = !_active2;

                              if(!_active1) {
                              _colorAnimationController1.reverse();
                              _active1 = !_active1;
                              }
                            if(!_active0) {
                              _colorAnimationController0.reverse();
                              _active0 = !_active0;
                            }

                            selectedAvatar = 'assets/avatar_morcego.png';

                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      text: 'Confirmar', 
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: ((context) => HomePaciente(avatar: selectedAvatar,))));
                      }
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AvatarCard extends StatefulWidget {

  final int avatar;
  final Color color;
  final Function() onTap;

  AvatarCard({super.key, required this.avatar, required this.color, required this.onTap});

  @override
  State<AvatarCard> createState() => _AvatarCardState();
}

class _AvatarCardState extends State<AvatarCard> with TickerProviderStateMixin{

  var desc = [
    'Cachorros são leais e obedientes, o melhor amigo do homem',
    'Corujas são sábias e pacientes, sempre esperam o melhor momento para agir',
    'Morcegos são criaturas noturnas, dormem durante o dia para agir durante o luar'
  ];

  var label = [
    'Cachorro',
    'Coruja',
    'Morcego'
  ];

  var images = [
    'assets/avatar_dog.png',
    'assets/avatar_coruja.png',
    'assets/avatar_morcego.png'
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: widget.onTap,

      child: Container(
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ]
        ),
        width: 200,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50,
                child: Image(image: AssetImage(images[widget.avatar]))
              ),
              SizedBox(height: 10,),
              
              Text(
                label[widget.avatar],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w800
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 100,
                child: Text(
                  desc[widget.avatar],
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


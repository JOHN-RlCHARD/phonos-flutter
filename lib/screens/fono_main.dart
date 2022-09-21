import 'package:app_fono/widgets/responsive_bg.dart';
import 'package:app_fono/widgets/responsive_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/infos_card.dart';

class FonoMainPage extends StatelessWidget {
  const FonoMainPage({super.key});

  @override
  Widget build(BuildContext context) {
  final screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Container(
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20)
                ),
                color: Color(0xFFDBEFFA)
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset('assets/person_icon.svg',
                      color: Color(0xFFDBEFFA),
                    ),
                  ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  child: Column(
                    children: [
                      InfosCardBox(),
                      SizedBox(height: 15,),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  color: Color(0xFFDBEFFA),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'Lista de Pacientes',
                                    style: TextStyle(
                                      color: Color(0xFF78746D),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12,),
                            Expanded(
                              flex: 4,
                              child: Container(
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  color: Color(0xFFDBEFFA),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'Anotações',
                                    style: TextStyle(
                                      color: Color(0xFF78746D),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12,),
                      Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color(0xFF5A90AC),
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Atividade',
                            style: TextStyle(
                              color: Color(0xFF78746D),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
              child: Container(
                padding: EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width/3.5,
                constraints: BoxConstraints(
                  maxWidth: 400,
                  minWidth: 200,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xFFDBEFFA),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Calendário',
                      style: TextStyle(
                        color: Color(0xFF78746D),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfosCardBox extends StatelessWidget {
  const InfosCardBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 15,
      runSpacing: 15,
      alignment: WrapAlignment.spaceAround,
      children: [
        Wrap(
          spacing: 15,
          children: [
            InfosCard(
              backgroundColor: Color(0xFFFADBE2),
              iconColor: Color(0xFFFF698D),
              label: 'Pacientes:',
              value: '35',
              svgIconPath: 'assets/pacientes_icon.svg',
            ),
            InfosCard(
              backgroundColor: Color(0xFFDBE2FA),
              iconColor: Color(0xFF86A2FF),
              label: 'Consultas:',
              value: '11',
              svgIconPath: 'assets/calendar_icon.svg',
            ),
          ],
        ),
        Wrap(
          spacing: 15,
          children: [
            InfosCard(
              backgroundColor: Color(0xFFFAEFDB),
              iconColor: Color(0xFFFFD280),
              label: 'Pacientes:',
              value: '35',
              svgIconPath: 'assets/pacientes_icon.svg',
            ),
            InfosCard(
              backgroundColor: Color(0xFFDCFADB),
              iconColor: Color(0xFF76E072),
              label: 'Pacientes:',
              value: '35',
              svgIconPath: 'assets/pacientes_icon.svg',
            ),
          ],
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../classes/responsive.dart';

class InfosCardBox extends StatelessWidget {
  const InfosCardBox({super.key});

  @override
  Widget build(BuildContext context) {
    return (Responsive.isMobile(context))
        ? Column(
            children: [
              Row(
                children: [
                  InfosCard(
                    backgroundColor: Color(0xFFFADBE2),
                    iconColor: Color(0xFFFF698D),
                    label: 'Pacientes:',
                    value: '35',
                    svgIconPath: 'assets/pacientes_icon.svg',
                  ),
                  SizedBox(
                    width: 12,
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
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  InfosCard(
                    backgroundColor: Color(0xFFFAEFDB),
                    iconColor: Color(0xFFFFD280),
                    label: 'Tarefas:',
                    value: '35',
                    svgIconPath: 'assets/task_icon.svg',
                  ),
                  SizedBox(
                    width: 12,
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
          )
        : Row(
            children: [
              InfosCard(
                backgroundColor: Color(0xFFFADBE2),
                iconColor: Color(0xFFFF698D),
                label: 'Pacientes:',
                value: '35',
                svgIconPath: 'assets/pacientes_icon.svg',
              ),
              SizedBox(
                width: 12,
              ),
              InfosCard(
                backgroundColor: Color(0xFFDBE2FA),
                iconColor: Color(0xFF86A2FF),
                label: 'Consultas:',
                value: '11',
                svgIconPath: 'assets/calendar_icon.svg',
              ),
              SizedBox(
                width: 12,
              ),
              InfosCard(
                backgroundColor: Color(0xFFFAEFDB),
                iconColor: Color(0xFFFFD280),
                label: 'Tarefas:',
                value: '35',
                svgIconPath: 'assets/task_icon.svg',
              ),
              SizedBox(
                width: 12,
              ),
              InfosCard(
                backgroundColor: Color(0xFFDCFADB),
                iconColor: Color(0xFF76E072),
                label: 'Pacientes:',
                value: '35',
                svgIconPath: 'assets/pacientes_icon.svg',
              ),
            ],
          );
  }
}

class InfosCard extends StatelessWidget {
  const InfosCard(
      {super.key,
      required this.backgroundColor,
      required this.iconColor,
      required this.label,
      required this.value,
      required this.svgIconPath});
  final Color backgroundColor;
  final Color iconColor;
  final String svgIconPath;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        height: 80,
        width: double.infinity,
        constraints: BoxConstraints(
          minWidth: 120,
          maxWidth: 160,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: backgroundColor,
        ),
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          spacing: 10,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: SvgPicture.asset(
                  svgIconPath,
                  color: iconColor,
                ),
              ),
            ),
            //Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF757575),
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

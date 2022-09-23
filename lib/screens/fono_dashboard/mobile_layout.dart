import 'package:app_fono/widgets/calendar.dart';
import 'package:flutter/material.dart';

import '../../widgets/infos_card.dart';

class MobileDashboard extends StatelessWidget {
  const MobileDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: InfosCardBox(),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xFFDBEFFA),
              ),
              child: Column(
                children: [
                  Text(
                    'Calendário',
                    style: TextStyle(
                      color: Color(0xFF78746D),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 600,
                    child: Calendar(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

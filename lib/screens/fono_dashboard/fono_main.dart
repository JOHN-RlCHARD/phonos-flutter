import 'package:app_fono/classes/responsive.dart';
import 'package:app_fono/screens/fono_dashboard/dashboard_calendar.dart';
import 'package:app_fono/screens/fono_dashboard/dashboard_center.dart';
import 'package:app_fono/screens/fono_dashboard/dashboard_sidebar.dart';
import 'package:app_fono/widgets/responsive_bg.dart';
import 'package:app_fono/widgets/responsive_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/infos_card.dart';

class FonoMainPage extends StatelessWidget {
  const FonoMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? PreferredSize(
              child: CustomAppBar(),
              preferredSize: Size.fromHeight(56),
            )
          : null,
      body: SafeArea(
        child: (Responsive.isMobile(context))
            ? SingleChildScrollView(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Calendário',
                              style: TextStyle(
                                color: Color(0xFF78746D),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              height: 300,
                              width: double.infinity,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Row(
                children: [
                  if (Responsive.isDesktop(context))
                    DashBoardSidebar(
                      avatarRadius: 40,
                    ),
                  if (Responsive.isTablet(context))
                    DashBoardSidebar(avatarRadius: 30),
                  DashBoardCenter(),
                  DashBoardCalendar(),
                ],
              ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(Icons.list),
      backgroundColor: Color(0xFFDBEFFA),
      shadowColor: Colors.black12,
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: SvgPicture.asset(
                  'assets/person_icon.svg',
                  color: Color(0xFFDBEFFA),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

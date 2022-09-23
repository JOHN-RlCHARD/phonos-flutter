import 'package:app_fono/classes/responsive.dart';
import 'package:app_fono/screens/fono_dashboard/dashboard_calendar.dart';
import 'package:app_fono/screens/fono_dashboard/dashboard_center.dart';
import 'package:app_fono/screens/fono_dashboard/dashboard_sidebar.dart';
import 'package:app_fono/screens/fono_dashboard/mobile_layout.dart';
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
            ? MobileDashboard()
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
      backgroundColor: Color(0xFFDBEFFA),
      shadowColor: Colors.black12,
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: CircleAvatar(
                radius: 20,
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

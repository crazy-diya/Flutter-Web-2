import 'package:flutter/material.dart';
import 'package:second_web/controllers/menu_controller.dart';
import 'package:second_web/responsive.dart';
import 'package:second_web/screens/components/side_menu.dart';
import 'package:second_web/screens/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
        drawer: const SideMenu(),
        body: SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          if(Responsive.isDesktop(context))
            const Expanded(
            child: SideMenu(),
          ),
          const Expanded(
            //default flex 1
            //it enable 5 to 6 size of screen
            flex: 5,
            child: DashBoardScreen()
          )
        ],
      ),
    ));
  }
}


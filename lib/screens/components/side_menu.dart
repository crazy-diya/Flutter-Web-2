import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:second_web/screens/main/main_screen.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset("assets/images/logo.png"),
            ),
            DrawerListTile(
              title: "Dashboard",
              svgPic: "menu_dashbord.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Transaction",
              svgPic: "menu_tran.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Documents",
              svgPic: "menu_doc.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Store",
              svgPic: "menu_store.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Notification",
              svgPic: "menu_notification.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Profile",
              svgPic: "menu_profile.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Settings",
              svgPic: "menu_setting.svg",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title, svgPic;
  final VoidCallback press;

  const DrawerListTile({
    Key? key,
    required this.title,
    required this.svgPic,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        "assets/icons/$svgPic",
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
      onTap: press,
      horizontalTitleGap: 0.0,
    );
  }
}


import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:second_web/constants.dart';
import 'package:second_web/responsive.dart';
import 'package:second_web/screens/components/chart.dart';
import 'package:second_web/screens/components/header.dart';
import 'package:second_web/screens/components/myfiles.dart';
import 'package:second_web/screens/components/storage_details.dart';
import 'package:second_web/screens/components/storage_info_card.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(),
            const SizedBox(
              height: defaultPadding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  const Expanded(
                  flex: 5,
                  child: MyFiles(),
                ),
                if(!Responsive.isMobile(context))
                const SizedBox(
                  width: defaultPadding,
                ),
                if(!Responsive.isMobile(context))
                  const Expanded(
                  child: StorageDetails(),
                  flex: 2,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

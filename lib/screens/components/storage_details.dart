import 'package:flutter/material.dart';
import 'package:second_web/constants.dart';

import 'chart.dart';
import 'storage_info_card.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: const [
            Text(
              "Storage Details",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: defaultPadding,
            ),
            Chart(),
            SizedBox(
              height: defaultPadding,
            ),
            StorageInfoCard(
              title: "Documents Files",
              amountOfFiles: "1.3GB",
              numOfFiles: 1329,
              svgSrc: "assets/icons/Documents.svg",
            ),
            StorageInfoCard(
              title: "Media Files",
              amountOfFiles: "15.3GB",
              numOfFiles: 1125,
              svgSrc: "assets/icons/media.svg",
            ),
            StorageInfoCard(
              title: "Other Files",
              amountOfFiles: "11.5GB",
              numOfFiles: 2451,
              svgSrc: "assets/icons/folder.svg",
            ),
            StorageInfoCard(
              title: "Unknown",
              amountOfFiles: "2.3GB",
              numOfFiles: 2547,
              svgSrc: "assets/icons/unknown.svg",
            ),
          ],
        ),
      ),
    );
  }
}

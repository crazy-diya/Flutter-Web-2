import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:second_web/constants.dart';
import 'package:second_web/models/my_files.dart';

class FileInfoCard extends StatelessWidget {
  final CloudStorageInfo cloudStorageInfo;

  const FileInfoCard({
    Key? key,
    required this.cloudStorageInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(defaultPadding * 0.75),
                decoration: BoxDecoration(
                  color: cloudStorageInfo.color!.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  cloudStorageInfo.svgSrc.toString(),
                  color: cloudStorageInfo.color,
                ),
              ),
              const Icon(
                Icons.more_vert,
                color: Colors.white54,
              ),
            ],
          ),
          Text(
            cloudStorageInfo.title.toString(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 5,
                decoration: BoxDecoration(
                    color: cloudStorageInfo.color!.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) => Container(
                  width: constraints.maxWidth * 0.5,
                  height: 5,
                  decoration: BoxDecoration(
                      color: cloudStorageInfo.color,
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(cloudStorageInfo.numOfFiles.toString()),
              Text(cloudStorageInfo.totalStorage.toString()),
            ],
          )
        ],
      ),
    );
  }
}

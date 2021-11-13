import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:second_web/constants.dart';
import 'package:second_web/models/my_files.dart';
import 'package:second_web/models/recent_file.dart';
import 'package:second_web/responsive.dart';

import 'file_info_card.dart';
import 'storage_details.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Files",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding:  EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical: defaultPadding / (Responsive.isMobile(context)? 2 : 1),),
              ),
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text(
                "Add New",
              ),
            ),
          ],
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Responsive(
          mobile: FileInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 ? 1.3 : 1,
          ),
          desktop: FileInfoCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
          tablet: FileInfoCardGridView(),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Container(
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Recent Files",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(
                width: double.infinity,
                child: DataTable(
                    horizontalMargin: 0,
                    columnSpacing: defaultPadding,
                    columns: const [
                      DataColumn(
                        label: Text(
                          "File Name",
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Date",
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Size",
                        ),
                      ),
                    ],
                    rows: List.generate(demoRecentFiles.length,
                        (index) => recentFileDataRow(demoRecentFiles[index]))),
              ),
            ],
          ),
        ),
        if (Responsive.isMobile(context))
          const SizedBox(
            height: defaultPadding,
          ),
        if (Responsive.isMobile(context)) const StorageDetails()
      ],
    );
  }

  DataRow recentFileDataRow(RecentFile file) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              SvgPicture.asset(
                file.icon.toString(),
                height: 30,
                width: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(file.title.toString()),
              ),
            ],
          ),
        ),
        DataCell(
          Text(file.date.toString()),
        ),
        DataCell(
          Text(file.size.toString()),
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
      ),
      itemBuilder: (context, index) => FileInfoCard(
        cloudStorageInfo: demoMyFiles[index],
      ),
    );
  }
}

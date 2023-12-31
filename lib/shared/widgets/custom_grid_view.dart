import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investment_analytics/shared/config/constants.dart';
import 'package:investment_analytics/shared/config/styles.dart';
import 'package:investment_analytics/shared/config/themes.dart';
import 'package:investment_analytics/shared/models/app/bundle_model.dart';
import 'package:investment_analytics/shared/widgets/rounded_container.dart';
import 'package:investment_analytics/shared/widgets/widget_spacer.dart';

class CustomGridView extends StatelessWidget {
  final List<InfoModel> data;
  final int columns;

  const CustomGridView({super.key, required this.data, required this.columns});

  double get childAspectRatio {
    double ratio = 1;
    switch (columns) {
      case 2:
        ratio = 165 / 85;
        break;
      case 3:
        ratio = 1;
        break;
      default:
        ratio = 1;
    }
    return ratio;
  }

  /// Customized only for  this Widget
  int get maxLines => columns - 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.contentPadding),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          crossAxisSpacing: 8.0, // Adjust the spacing between columns
          mainAxisSpacing: 8.0,
          childAspectRatio: childAspectRatio,
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GridItem(
            dataModel: data[index],
            maxLines: maxLines,
          );
        },
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final InfoModel dataModel;
  final int maxLines;

  const GridItem({super.key, required this.dataModel, required this.maxLines});
  bool get shouldScaleDown => maxLines == 1;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: dataModel.isActive ? 1 : 0.1,
      child: RoundedContainer(
        color: Colors.white.withOpacity(0.8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              dataModel.imageAsset,
              height: 27.h,
            ),
            WidgetSpacer(
              space: AppConstants.contentPadding / 2,
            ),
            if (shouldScaleDown)
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  dataModel.title,
                  textAlign: TextAlign.center,
                  maxLines: maxLines,
                  style: AppStyles.secondaryTextStyle.copyWith(
                    color: AppThemes.fontMain,
                  ),
                ),
              ),
            if (!shouldScaleDown)
              Text(
                dataModel.title,
                textAlign: TextAlign.center,
                maxLines: maxLines,
                style: AppStyles.secondaryTextStyle.copyWith(
                  color: AppThemes.fontMain,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

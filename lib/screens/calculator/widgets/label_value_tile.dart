import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investment_analytics/shared/config/styles.dart';
import 'package:investment_analytics/shared/widgets/widget_spacer.dart';

enum LabelValueAlignment { start, end }

class LabelValueTile extends StatelessWidget {
  final String label;
  final String value;
  final double? height;
  final LabelValueAlignment alignment;
  const LabelValueTile({
    super.key,
    required this.label,
    required this.value,
    this.alignment = LabelValueAlignment.start,
    this.height ,
  });

  CrossAxisAlignment get crossAxisAlignment {
    if (alignment == LabelValueAlignment.start) {
      return CrossAxisAlignment.start;
    } else {
      return CrossAxisAlignment.end;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          label,
          style: AppStyles.secondaryTextStyle,
        ),
        WidgetSpacer(space: 4.h),
        SizedBox(
          height: height,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: AppStyles.mainTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}

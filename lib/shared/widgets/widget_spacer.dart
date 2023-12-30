import 'package:flutter/material.dart';
import 'package:investment_analytics/shared/config/constants.dart';

class WidgetSpacer extends StatelessWidget {
  final double? space;
  const WidgetSpacer({
    super.key,
    this.space,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: space ?? AppConstants.space);
  }
}

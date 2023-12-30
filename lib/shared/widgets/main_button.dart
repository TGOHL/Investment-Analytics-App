import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/themes.dart';

class MainButton extends StatelessWidget {
  final double? width;
  final int height;
  final String label;
  final int fontSize;
  final int borderRadius;
  final Function() onPressed;
  final Color fontColor;
  final bool filled;
  final bool verticalGradient;
  final Widget? icon;
  final Color? color;

  const MainButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.width,
    this.height = 60,
    this.fontSize = 16,
    this.borderRadius = 4,
    this.fontColor = Colors.white,
    this.filled = true,
    this.verticalGradient = true,
    this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius.w),
        color: AppThemes.fontMain,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius.w),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(borderRadius.w),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: icon == null
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                if (icon != null)
                  Padding(
                    padding: EdgeInsets.only(left: 6.w, right: 4.w),
                    child: icon,
                  ),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: fontSize.sp,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

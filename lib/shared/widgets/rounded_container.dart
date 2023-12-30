import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? radius;
  final double? width;
  final bool showShadow;
  const RoundedContainer({
    super.key,
    required this.child,
    this.color,
    this.padding,
    this.margin,
    this.radius,
    this.width,
    this.showShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      padding:
          padding ?? EdgeInsets.symmetric(vertical: 14.h, horizontal: 18.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 12.w),
        color: color ?? Colors.white,
        boxShadow: [
          if (showShadow)
            BoxShadow(
              offset: Offset(6.w, 12.h),
              blurRadius: 40.w,
              color: const Color(0x1A989FB9),
            )
        ],
      ),
      child: child,
    );
  }
}

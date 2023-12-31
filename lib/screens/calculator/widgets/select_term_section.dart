import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investment_analytics/shared/cubit/calculator_cubit.dart';
import 'package:investment_analytics/shared/config/styles.dart';
import 'package:investment_analytics/shared/config/themes.dart';

class SelectTermSection extends StatelessWidget {
  final Function(int i)? onChanged;
  final bool isStreached;
  const SelectTermSection({super.key, this.onChanged, this.isStreached = true});

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CalculatorCubit>().selectedTerm;
    return Padding(
      padding: EdgeInsets.only(top: 12.h, left: isStreached ? 0 : 8.w),
      child: Row(
        mainAxisSize: isStreached ? MainAxisSize.max : MainAxisSize.min,
        children: context
            .read<CalculatorCubit>()
            .terms
            .map((e) => _SelectItem(e, e == selected, onChanged))
            .toList(),
      ),
    );
  }
}

class _SelectItem extends StatelessWidget {
  final int term;
  final bool isSelected;
  final Function(int i)? onChanged;
  const _SelectItem(this.term, this.isSelected, this.onChanged);

  bool get isSelective => onChanged != null;
  bool get shouldSelect => isSelected && isSelective;

  Color get backgroundColor {
    if (shouldSelect) return const Color(0xFFE6E9F1);
    if (isSelective) return AppThemes.scaffold;
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          onChanged!(term);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        margin: EdgeInsets.only(right: 8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.w),
          border: Border.all(
            width: 1,
            color: shouldSelect ? AppThemes.fontMain : const Color(0x1C2C561A),
          ),
          color: backgroundColor,
        ),
        child: Text(
          '$term Year Term',
          style: AppStyles.secondaryTextStyle.copyWith(
            color: shouldSelect ? AppThemes.fontMain : null,
          ),
        ),
      ),
    );
  }
}

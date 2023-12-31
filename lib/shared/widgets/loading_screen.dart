import 'package:flutter/material.dart';
import 'package:investment_analytics/shared/config/themes.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppThemes.fontMain,
      ),
    );
  }
}

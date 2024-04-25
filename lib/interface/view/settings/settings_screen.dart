import 'package:flutter/material.dart';
import 'package:wallet_app/constant/theme/theme_resources.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      backgroundColor: AppColors.backgroundPrimary,
      child: Column(
        children: [
          Text(
            'Settings Screen',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}

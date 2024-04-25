import 'package:flutter/material.dart';
import 'package:wallet_app/constant/theme/theme_resources.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class AnnouncementScreen extends StatelessWidget {
  const AnnouncementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      backgroundColor: AppColors.backgroundPrimary,
      child: Column(
        children: [
          Text(
            'Announcement Screen',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
    return const Text('Anonuncement Screen');
  }
}

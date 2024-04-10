import 'package:flutter/material.dart';
import 'package:wallet_app/constant/theme/app_colors.dart';
import 'package:wallet_app/constant/theme/app_fonts.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      useSafeArea: true,
      backgroundColor: AppColors.primary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: [
            Expanded(
              child: Image.asset('assets/logo.png'),
            ),
            SizedBox(
              height: 208.0,
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                runSpacing: 30,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text(
                      'Create Wallet',
                      style: TextStyle(
                        fontWeight: AppFonts.fontWeight500,
                        fontSize: AppFonts.fontSize15,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const Text(
                    // 48 + 48 + 15 + 97
                    'Already have a wallet?',
                    style: TextStyle(
                      fontWeight: AppFonts.fontWeight500,
                      fontSize: AppFonts.fontSize15,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

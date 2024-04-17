import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/constant/theme/theme_resources.dart';
import 'package:wallet_app/interface/service/router_service.dart';
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
              child: SvgPicture.asset('assets/welcome_logo.svg'),
            ),
            SizedBox(
              height: 208.0,
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                runSpacing: 30,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      RouterService.instance.router.push('/sign-up');
                    },
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
                  TextButton(
                    onPressed: () {
                      RouterService.instance.router.push('/sign-in');
                    },
                    child: const Text(
                      'Already have a wallet?',
                      style: TextStyle(
                        fontWeight: AppFonts.fontWeight500,
                        fontSize: AppFonts.fontSize15,
                        color: AppColors.textPrimary,
                      ),
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

import 'package:flutter/material.dart';
import 'package:wallet_app/constant/theme/app_colors.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      useSafeArea: true,
      backgroundColor: AppColors.primary,
      child: Center(
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.vertical,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('dddfsdf'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('dddfsdf'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/constant/theme/theme_resources.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class VerifyPage extends StatelessWidget {
  final String title;
  final String message;
  final List<Widget>? childWidgets;
  const VerifyPage({
    super.key,
    required this.title,
    required this.message,
    this.childWidgets,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: AppColors.backgroundPrimary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: SvgPicture.asset('assets/send-mail.svg'),
              ),
              const SizedBox(height: 48.0),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: AppFonts.fontWeight700,
                  fontSize: AppFonts.fontSize24,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 18.0),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: AppFonts.fontWeight400,
                  fontSize: AppFonts.fontSize14,
                  color: Color(0xFF84819D),
                ),
              ),
              ...?childWidgets?.map((e) => e),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/components/buildSubmit.dart';
import 'package:wallet_app/constant/theme/app_colors.dart';
import 'package:wallet_app/constant/theme/app_fonts.dart';
import 'package:wallet_app/constant/theme/theme_resources.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

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
              const Text(
                '이메일 인증',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: AppFonts.fontWeight700,
                  fontSize: AppFonts.fontSize24,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 18.0),
              const Text(
                '보내드린 인증 메일을 확인해주세요.\n이메일 인증 후 회원가입이 완료됩니다.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: AppFonts.fontWeight400,
                  fontSize: AppFonts.fontSize14,
                  color: Color(0xFF84819D),
                ),
              ),
              const SizedBox(height: 127.0),
              BuildSubmit(
                context,
                buttonText: '확인',
                buttonBackgroundColor: AppColors.buttonPrimary,
                actionWidgets: const [
                  Text(
                    '인증 이메일을 받지 못하셨나요?',
                    style: TextStyle(
                      fontWeight: AppFonts.fontWeight400,
                      fontSize: AppFonts.fontSize14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    '인증 메일 재전송',
                    style: TextStyle(
                      fontWeight: AppFonts.fontWeight400,
                      fontSize: AppFonts.fontSize14,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

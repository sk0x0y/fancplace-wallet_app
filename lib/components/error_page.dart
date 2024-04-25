import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/constant/theme/theme_resources.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: AppColors.white.withOpacity(0.1),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/logo/welcome_logo.svg'),
            const SizedBox(height: 40.0),
            const Text(
              'Oops! Something went wrong.',
              style: TextStyle(
                fontWeight: AppFonts.fontWeight700,
                fontSize: AppFonts.fontSize24,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 40.0),
            const Text(
              '상황이 지속되면 고객센터로 문의해주세요.\n이용에 불편을 드려 죄송합니다.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: AppFonts.fontWeight500,
                fontSize: AppFonts.fontSize20,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              '이메일 : support@fanc.io',
              style: TextStyle(
                fontWeight: AppFonts.fontWeight400,
                fontSize: AppFonts.fontSize16,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

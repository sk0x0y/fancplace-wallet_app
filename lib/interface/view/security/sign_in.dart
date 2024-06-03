import 'package:flutter/material.dart';
import 'package:wallet_app/components/buildInput.dart';
import 'package:wallet_app/components/buildSubmit.dart';
import 'package:wallet_app/constant/theme/app_colors.dart';
import 'package:wallet_app/constant/theme/app_fonts.dart';
import 'package:wallet_app/interface/service/router_service.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeader(context),
                const SizedBox(height: 110.0),
                Wrap(
                  runSpacing: 40.0,
                  children: [
                    BuildInput(
                      context,
                      labelText: '이메일',
                      inputWidget: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.backgroundSecondary,
                          hintText: '이메일을 입력하세요',
                          hintStyle: const TextStyle(
                            fontWeight: AppFonts.fontWeight400,
                            fontSize: AppFonts.fontSize14,
                            color: AppColors.textTertiary,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20.0),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1.0,
                              color: AppColors.borderPrimary,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                    BuildInput(
                      context,
                      labelText: '비밀번호',
                      inputWidget: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.backgroundSecondary,
                          hintText: '비밀번호를 입력하세요',
                          hintStyle: const TextStyle(
                            fontWeight: AppFonts.fontWeight400,
                            fontSize: AppFonts.fontSize14,
                            color: AppColors.textTertiary,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20.0),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1.0,
                              color: AppColors.borderPrimary,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                    BuildSubmit(
                      context,
                      buttonText: '다음',
                      buttonHandler: () {
                        RouterService.instance.router.go('/exchange');
                      },
                      actionWidgets: [
                        TextButton(
                          onPressed: () {
                            RouterService.instance.router.push('/sign/up');
                          },
                          child: const Text(
                            '새 지갑 생성하기',
                            style: TextStyle(
                              fontWeight: AppFonts.fontWeight700,
                              fontSize: AppFonts.fontSize14,
                              color: AppColors.buttonPrimary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 24.0),
                        const Text(
                          '비밀번호 찾기',
                          style: TextStyle(
                            fontWeight: AppFonts.fontWeight700,
                            fontSize: AppFonts.fontSize14,
                            color: AppColors.buttonPrimary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return const Wrap(
      direction: Axis.vertical,
      children: [
        Text(
          'Welcome',
          style: TextStyle(
            fontWeight: AppFonts.fontWeight400,
            fontSize: AppFonts.fontSize18,
            color: AppColors.textPrimary,
          ),
        ),
        Text(
          '로그인',
          style: TextStyle(
            fontWeight: AppFonts.fontWeight700,
            fontSize: AppFonts.fontSize45,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}

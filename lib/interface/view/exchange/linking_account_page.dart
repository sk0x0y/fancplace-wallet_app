import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/components/buildInput.dart';
import 'package:wallet_app/components/buildSubmit.dart';
import 'package:wallet_app/constant/theme/theme_resources.dart';
import 'package:wallet_app/interface/service/router_service.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class LinkingAccountPage extends StatelessWidget {
  const LinkingAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      leader: BackButton(
        onPressed: () {
          RouterService.instance.router.pop();
        },
        color: Colors.white,
      ),
      customTitleWidget: const Text(
        '계정 연동',
        style: TextStyle(
          fontWeight: AppFonts.fontWeight900,
          fontSize: AppFonts.fontSize18,
          color: AppColors.white,
        ),
      ),
      appBarBackgroundColor: AppColors.backgroundPrimary,
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 32.0,
              bottom: 42.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  runSpacing: 32.0,
                  children: [
                    Wrap(
                      spacing: 24.0,
                      children: [
                        PhysicalModel(
                          shape: BoxShape.circle,
                          elevation: 5.0,
                          shadowColor: const Color(0xFF0A043C).withOpacity(0.3),
                          color: AppColors.white,
                          child: SizedBox(
                            width: 66.0,
                            height: 66.0,
                            child: CircleAvatar(
                              backgroundColor: AppColors.black,
                              child: SvgPicture.asset(
                                'assets/logo/celebe_brand_icon.svg',
                                width: 40.0,
                                height: 40.0,
                              ),
                            ),
                          ),
                        ),
                        PhysicalModel(
                          shape: BoxShape.circle,
                          elevation: 5.0,
                          shadowColor: const Color(0xFF0A043C).withOpacity(0.3),
                          color: AppColors.white,
                          child: SizedBox(
                            width: 66.0,
                            height: 66.0,
                            child: CircleAvatar(
                              backgroundColor: AppColors.black,
                              child: SvgPicture.asset(
                                'assets/logo/brand_icon.svg',
                                width: 40.0,
                                height: 40.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Wrap(
                      runSpacing: 12.0,
                      children: [
                        Text(
                          '셀러비 포인트 계정 연동',
                          style: TextStyle(
                            fontWeight: AppFonts.fontWeight700,
                            fontSize: AppFonts.fontSize28,
                            color: AppColors.textBlack,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            text: '셀러비 포인트 이용을 위해, 댐댐 앱에서 발급받은 ',
                            style: TextStyle(
                              fontWeight: AppFonts.fontWeight400,
                              fontSize: AppFonts.fontSize16,
                              color: AppColors.textBlack,
                            ),
                            children: [
                              TextSpan(
                                text: '임시 인증 코드',
                                style: TextStyle(
                                  fontWeight: AppFonts.fontWeight500,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              TextSpan(text: '를 입력하여 인증을 완료해주세요.'),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 32.0),
                BuildInput(
                  context,
                  labelText: '임시 인증 코드',
                  inputWidget: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.backgroundSecondary,
                      hintText: '임시 인증 코드를 입력해주세요',
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
                const SizedBox(height: 64.0),
                BuildInput(
                  context,
                  customLabelText: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '약관 전체 동의',
                            style: TextStyle(
                              fontWeight: AppFonts.fontWeight700,
                              fontSize: AppFonts.fontSize16,
                              color: AppColors.textBlack,
                            ),
                          ),
                          SizedBox(
                            width: 22.0,
                            child: Checkbox(
                              value: true,
                              onChanged: (bool? value) {
                                print('체크박스');
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              side: const BorderSide(
                                color: AppColors.borderSecondary,
                                width: 0.5,
                              ),
                              fillColor:
                                  MaterialStateProperty.resolveWith((states) {
                                if (!states.contains(MaterialState.selected)) {
                                  return AppColors.white;
                                }
                                return const Color(0xFF523EE8);
                              }),
                              checkColor: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  inputWidget: Wrap(
                    runSpacing: 10.0,
                    children: [
                      const Divider(
                        color: Color(0xFFEFEEEE),
                        height: 0.0,
                        thickness: 1.0,
                      ),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '개인정보 제3자 제공 동의(필수)',
                                style: TextStyle(
                                  fontWeight: AppFonts.fontWeight500,
                                  fontSize: AppFonts.fontSize14,
                                  color: AppColors.textBlack,
                                ),
                              ),
                              SizedBox(
                                width: 22.0,
                                child: Checkbox(
                                  value: true,
                                  onChanged: (bool? value) {
                                    print('체크박스');
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  side: const BorderSide(
                                    color: AppColors.borderSecondary,
                                    width: 0.5,
                                  ),
                                  fillColor: MaterialStateProperty.resolveWith(
                                      (states) {
                                    if (!states
                                        .contains(MaterialState.selected)) {
                                      return AppColors.white;
                                    }
                                    return const Color(0xFF523EE8);
                                  }),
                                  checkColor: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '개인정보 처리방침',
                                style: TextStyle(
                                  fontWeight: AppFonts.fontWeight500,
                                  fontSize: AppFonts.fontSize14,
                                  color: AppColors.textBlack,
                                ),
                              ),
                              SizedBox(
                                width: 22.0,
                                child: Checkbox(
                                  value: true,
                                  onChanged: (bool? value) {
                                    print('체크박스');
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  side: const BorderSide(
                                    color: AppColors.borderSecondary,
                                    width: 0.5,
                                  ),
                                  fillColor: MaterialStateProperty.resolveWith(
                                      (states) {
                                    if (!states
                                        .contains(MaterialState.selected)) {
                                      return AppColors.white;
                                    }
                                    return const Color(0xFF523EE8);
                                  }),
                                  checkColor: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 80.0),
                BuildSubmit(context, buttonText: '확인', buttonHandler: () {
                  // RouterService.instance.router.push('/point/conversion');
                  RouterService.instance.router.pop();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

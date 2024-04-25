import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/components/buildInput.dart';
import 'package:wallet_app/components/buildSubmit.dart';
import 'package:wallet_app/constant/theme/app_colors.dart';
import 'package:wallet_app/constant/theme/app_fonts.dart';
import 'package:wallet_app/interface/service/router_service.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      customTitleWidget: const Text(
        '회원가입',
        style: TextStyle(
          fontWeight: AppFonts.fontWeight700,
          fontSize: AppFonts.fontSize16,
          color: AppColors.textBlack,
        ),
      ),
      leader: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 60.0),
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
                      labelText: '언어',
                      inputWidget: Container(
                        width: double.infinity,
                        height: 56.0,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundSecondary,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            icon: SvgPicture.asset(
                              'assets/intro/arrow_down.svg',
                              colorFilter: const ColorFilter.mode(
                                AppColors.backgroundPrimary,
                                BlendMode.srcIn,
                              ),
                            ),
                            value: 'ko',
                            selectedItemBuilder: (context) {
                              return const [
                                Center(
                                  child: Text(
                                    '한국어',
                                    style: TextStyle(
                                      fontWeight: AppFonts.fontWeight400,
                                      fontSize: AppFonts.fontSize15,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                ),
                              ];
                            },
                            dropdownColor: AppColors.backgroundSecondary,
                            items: const [
                              DropdownMenuItem(
                                value: 'ko',
                                child: Text(
                                  '한국어',
                                  style: TextStyle(
                                    fontWeight: AppFonts.fontWeight400,
                                    fontSize: AppFonts.fontSize15,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'en',
                                child: Text(
                                  'English',
                                  style: TextStyle(
                                    fontWeight: AppFonts.fontWeight400,
                                    fontSize: AppFonts.fontSize15,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ),
                            ],
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                    ),
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
                          hintText: '8자 이상 16자 이하, 영문 및 특수문자 가능',
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
                      labelText: '비밀번호 확인',
                      inputWidget: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.backgroundSecondary,
                          hintText: '비밀번호를 다시 입력하세요',
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
                      labelText: '이용약관 및 개인정보 처리방침',
                      inputWidget: Wrap(
                        runSpacing: 10.0,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.backgroundSecondary,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            width: double.infinity,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    '이용약관 확인 후 동의',
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
                                      fillColor:
                                          MaterialStateProperty.resolveWith(
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
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.backgroundSecondary,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            width: double.infinity,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      fillColor:
                                          MaterialStateProperty.resolveWith(
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
                    BuildInput(context,
                        customLabelText: const Text(
                          '꼭 확인하세요!',
                          style: TextStyle(
                            fontWeight: AppFonts.fontWeight700,
                            fontSize: AppFonts.fontSize16,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        inputWidget: Wrap(
                          runSpacing: 10.0,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.backgroundSecondary,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  '''
갑자기 사립문이 삐꺽 열리면서 아름다운 스테파네트가 나타났습니다. 이렇게 달래 놓고는 황급히 불을 활활 피워, 발과 시냇물에 젖은 옷을 말리게 했습니다. 그리고는 구슬 같은 눈물이 글썽글썽 눈에 괴는 걸보고, 그만 나까지도 울고 싶어지는 것이었습니다.

아가씨도 나를 따라 성호를 긋고는 잠시 고개를 들고 하늘을 쳐다보며 깊은 명상에 잠겼습니다. 그리고, 우리 둘 이는 아무 말 없이 나란히 앉아 있었습니다. 이렇게 달래 놓고는 황급히 불을 활활 피워, 발과 시냇물에 젖은 옷을 말리게 했습니다.이렇게 달래 놓고는 황급히 불을 활활 피워, 발과 시냇물에 젖은 옷을 말리게 했습니다.''',
                                  style: TextStyle(
                                    fontWeight: AppFonts.fontWeight400,
                                    fontSize: AppFonts.fontSize14,
                                    color: AppColors.textBlack,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // height: 56.0,
                              decoration: BoxDecoration(
                                color: AppColors.backgroundSecondary,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      '위 내용을 확인하였고 이에 동의합니다.',
                                      style: TextStyle(
                                        fontWeight: AppFonts.fontWeight500,
                                        fontSize: AppFonts.fontSize14,
                                        color: AppColors.textBlack,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 22.0,
                                      child: Checkbox(
                                        value: false,
                                        onChanged: (bool? value) {
                                          print('체크박스');
                                        },
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        side: const BorderSide(
                                          color: AppColors.borderSecondary,
                                          width: 0.5,
                                        ),
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) {
                                          if (!states.contains(
                                              MaterialState.selected)) {
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
                        )),
                    BuildSubmit(
                      context,
                      buttonText: '확인',
                      buttonHandler: () {
                        RouterService.instance.router
                            .go('/security/recover-words');
                      },
                      actionWidgets: [
                        const Text(
                          '이미 회원이십니까?',
                          style: TextStyle(
                            fontWeight: AppFonts.fontWeight500,
                            fontSize: AppFonts.fontSize14,
                            color: AppColors.textBlack,
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        TextButton(
                          onPressed: () {
                            RouterService.instance.router.push('/sign/in');
                          },
                          child: const Text(
                            '로그인 하기',
                            style: TextStyle(
                              fontWeight: AppFonts.fontWeight700,
                              fontSize: AppFonts.fontSize14,
                              color: AppColors.buttonPrimary,
                            ),
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
          'Create New Wallet',
          style: TextStyle(
            fontWeight: AppFonts.fontWeight400,
            fontSize: AppFonts.fontSize18,
            color: AppColors.textPrimary,
          ),
        ),
        Text(
          '회원가입',
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

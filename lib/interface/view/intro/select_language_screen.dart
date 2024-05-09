import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/constant/theme/theme_resources.dart';
import 'package:wallet_app/interface/service/router_service.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

// TODO: OverlayEntry 를 통한 UI 고도화
class SelectLanguageScreen extends StatelessWidget {
  const SelectLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      useSafeArea: true,
      backgroundColor: AppColors.primary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/globe.svg'),
                  const SizedBox(height: 26),
                  const Text(
                    'Select the language',
                    style: TextStyle(
                      fontWeight: AppFonts.fontWeight400,
                      fontSize: AppFonts.fontSize16,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 43),
                  Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.dropdownButtonPrimary,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        icon: SvgPicture.asset(
                          'assets/intro/arrow_down.svg',
                          colorFilter: const ColorFilter.mode(
                            Color(0xFFB2E5F5),
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
                                  color: Color(0xFFB2E5F5),
                                ),
                              ),
                            ),
                          ];
                        },
                        dropdownColor: AppColors.dropdownButtonPrimary,
                        items: const [
                          DropdownMenuItem(
                            value: 'ko',
                            child: Text(
                              '한국어',
                              style: TextStyle(
                                fontWeight: AppFonts.fontWeight400,
                                fontSize: AppFonts.fontSize15,
                                color: Color(0xFFB2E5F5),
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
                                color: Color(0xFFB2E5F5),
                              ),
                            ),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ],
              ),
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
                      RouterService.instance.router.push('/intro/welcome');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        fontWeight: AppFonts.fontWeight500,
                        fontSize: AppFonts.fontSize15,
                        color: AppColors.primary,
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
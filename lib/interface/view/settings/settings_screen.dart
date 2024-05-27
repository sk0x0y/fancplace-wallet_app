import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:wallet_app/constant/theme/theme_resources.dart';
import 'package:wallet_app/interface/service/router_service.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      customTitleWidget: const Text(
        '설정',
        style: TextStyle(
          fontWeight: AppFonts.fontWeight900,
          fontSize: AppFonts.fontSize18,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xFF0A043C),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Text(
                      'NEW',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                        color: Color(0xFF523EE8),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      '공지사항입니다. 공지사항을 확인하세요.',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            _buildSettingsItem(
              title: '개인정보',
              iconPath: 'assets/settings/user-profile.svg',
              onTap: () {
                RouterService.instance.router.push('/settings/profile');
              },
            ),
            _buildSettingsItem(
              title: '보안',
              iconPath: 'assets/settings/security.svg',
              onTap: () {
                RouterService.instance.router.push('/settings/security');
              },
            ),
            _buildSettingsItem(
              title: '알림',
              iconPath: 'assets/settings/notification.svg',
              onTap: () {},
              action: SizedBox(
                width: 40.0,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Switch(
                    value: true,
                    onChanged: (value) {},
                    activeColor: const Color(0xFF523EE8),
                  ),
                ),
              ),
            ),
            _buildSettingsItem(
              title: '자주 하는 질문',
              icon: Bootstrap.chat_dots_fill,
              onTap: () {},
            ),
            _buildSettingsItem(
              title: '이용약관 및 정책',
              iconPath: 'assets/settings/agreement.svg',
              onTap: () {
                RouterService.instance.router.push('/settings/policy');
              },
            ),
            _buildSettingsItem(
              title: '언어 설정',
              iconPath: 'assets/settings/language.svg',
              onTap: () {},
              action: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SizedBox(
                  height: 35.0,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: '한국어',
                      icon: SvgPicture.asset(
                        'assets/intro/arrow_down.svg',
                        colorFilter: const ColorFilter.mode(
                          Color(0xFF84819D),
                          BlendMode.srcIn,
                        ),
                      ),
                      iconSize: 24.0,
                      elevation: 16,
                      style: const TextStyle(
                        color: Color(0xFF0A043C),
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0,
                      ),
                      onChanged: (newValue) {},
                      items: ['한국어', 'English'].map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0,
                                color: Color(0xFF84819D),
                              )),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
            _buildSettingsItem(
              title: '버전 정보',
              iconPath: 'assets/settings/version.svg',
              onTap: () {},
              action: const Row(
                children: [
                  Text(
                    '1.0.0',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                      color: Color(0xFF84819D),
                    ),
                  ),
                  SizedBox(width: 8.0),
                ],
              ),
            ),
            _buildSettingsItem(
              title: '로그아웃',
              iconPath: 'assets/settings/logout.svg',
              onTap: () {},
              action: const Spacer(),
            ),
            const SizedBox(height: 72.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xFFF0EDFF),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 20.0),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/settings/headset_mic.svg'),
                    const SizedBox(width: 20.0),
                    const Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '이용 중 발생하는 불편사항은 아래 메일로 문의주시기 바랍니다.',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                              color: Color(0xFF0A043C),
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            'support@fancplace.io',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Color(0xFF0A043C),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required String title,
    BootstrapIconData? icon,
    String? iconPath,
    required VoidCallback onTap,
    Widget? action,
  }) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFEFEEEE),
            width: 1.0,
          ),
        ),
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 36.0,
                height: 36.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: iconPath != null
                      ? SvgPicture.asset(iconPath)
                      : Icon(icon, size: 18.0, color: const Color(0xFF0A043C)),
                ),
              ),
              const SizedBox(width: 20.0),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0,
                  color: Color(0xFF0A043C),
                ),
              ),
              const Spacer(),
              action ??
                  const SizedBox(
                    width: 36.0,
                    height: 36.0,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 10.0,
                      color: Color(0xFF84819D),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wallet_app/interface/service/router_service.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      leader: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          RouterService.instance.router.pop();
        },
      ),
      customTitleWidget: const Text(
        '개인정보',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 18.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 40.0),
            _buildProfileItem(
              title: '댐댐 계정 연동',
              description: 'email01240@email.com',
            ),
            const SizedBox(height: 16.0),
            _buildProfileItem(
              onTap: () {
                RouterService.instance.router
                    .push('/settings/profile/change-password');
              },
              title: '비밀번호',
              description: '비밀번호 변경하기',
              useAction: true,
            ),
            const SizedBox(height: 16.0),
            _buildProfileItem(
              title: '댐댐 계정 연동',
              description: '연동',
              useAction: true,
              actionText: '연동 해제',
            ),
            const SizedBox(height: 16.0),
            _buildProfileItem(
              title: '셀러비 계정 연동',
              description: '미연동',
              useAction: true,
              actionText: '연동하기',
            ),
            const SizedBox(height: 16.0),
            _buildProfileItem(
              title: '계정 탈퇴',
              description: '회원탈퇴 신청하기',
              useAction: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem({
    VoidCallback? onTap,
    required String title,
    required String description,
    bool useAction = false,
    String? actionText,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: const Color(0xFFE0E0E2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0,
                    color: Color(0xFF523EE8),
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  description,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17.0,
                    color: Color(0xFF0A043C),
                  ),
                ),
              ],
            ),
            useAction
                ? Row(
                    children: [
                      actionText != null
                          ? Text(
                              actionText,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                                color: Color(0xFF84819D),
                              ),
                            )
                          : const SizedBox(),
                      actionText != null
                          ? const SizedBox(width: 16.0)
                          : const SizedBox(),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 12.0,
                        color: Color(0xFF84819D),
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

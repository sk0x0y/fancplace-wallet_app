import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/components/buildSubmit.dart';
import 'package:wallet_app/constant/theme/theme_resources.dart';
import 'package:wallet_app/interface/service/modal_service.dart';
import 'package:wallet_app/interface/service/router_service.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const bool showEmpty = false;

    return DefaultLayout(
      leader: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.white),
        onPressed: () {
          RouterService.instance.router.go('/assets/point/conversion');
        },
      ),
      customTitleWidget: const Text(
        '토큰 전송 내역',
        style: TextStyle(
          fontWeight: AppFonts.fontWeight900,
          fontSize: AppFonts.fontSize18,
          color: AppColors.white,
        ),
      ),
      appBarBackgroundColor: AppColors.backgroundPrimary,
      backgroundColor: AppColors.backgroundPrimary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: showEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/no-transaction-result.svg',
                    ),
                    const SizedBox(height: 40.0),
                    const Text(
                      '전송 내역이 없습니다.',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                        color: Color(0xFF84819D),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    const Text(
                      '팬시 월렛의 지갑서비스를 이용해보세요.',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        color: Color(0xFF84819D),
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  const SizedBox(height: 24.0),
                  // const TransactionSortDropdown(),
                  _buildDropdown(context),
                  const SizedBox(height: 40),
                  const Row(
                    children: [
                      Text(
                        '2023년 9월',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,
                          color: Color(0xFF523EE8),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          indent: 20.0,
                          color: Color(0xFF84819D),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            ModalService.openBottomSheet(
                              context,
                              useRootNavigator: true,
                              height: 412.0,
                              radius: 40.0,
                              child: _buildDetailModal(context),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/logo/fanc_brand_icon.svg'),
                                const SizedBox(width: 14.0),
                                const Column(
                                  children: [
                                    Text(
                                      '0xC12sd…AF9d2',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 4.0),
                                    Text.rich(
                                      TextSpan(
                                        text: '받기',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.0,
                                          color: Color(0xFF34B27C),
                                        ),
                                        children: [
                                          TextSpan(
                                            text: ' ∙ ',
                                            style: TextStyle(
                                              color: Color(0xFF84819D),
                                            ),
                                          ),
                                          TextSpan(
                                            text: '2023.09.01 15:07',
                                            style: TextStyle(
                                              color: Color(0xFF84819D),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '0.4561 FANC',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 4.0),
                                      Text(
                                        '5,400원',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.0,
                                          color: Color(0xFF84819D),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildDetailModal(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 50.0,
        horizontal: 32.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '보내기',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15.0,
              color: AppColors.textPrimary,
            ),
          ),
          const Text(
            '팬시 (FANC)',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 25.0,
              color: AppColors.textBlack,
            ),
          ),
          const Text(
            '2022.11.19 16:00',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15.0,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 32.0),
          const Wrap(
            runSpacing: 10.0,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '보낸 수량',
                    style: TextStyle(
                      fontWeight: AppFonts.fontWeight400,
                      fontSize: AppFonts.fontSize15,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  Text(
                    '-153.02',
                    style: TextStyle(
                      fontWeight: AppFonts.fontWeight500,
                      fontSize: AppFonts.fontSize15,
                      color: AppColors.textBlack,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '받는 주소',
                    style: TextStyle(
                      fontWeight: AppFonts.fontWeight400,
                      fontSize: AppFonts.fontSize15,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  Text(
                    '0x379is…qu4we1g',
                    style: TextStyle(
                      fontWeight: AppFonts.fontWeight500,
                      fontSize: AppFonts.fontSize15,
                      color: AppColors.textBlack,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '네트워크 수수료',
                    style: TextStyle(
                      fontWeight: AppFonts.fontWeight400,
                      fontSize: AppFonts.fontSize15,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  Text(
                    '0.01 ETH',
                    style: TextStyle(
                      fontWeight: AppFonts.fontWeight500,
                      fontSize: AppFonts.fontSize15,
                      color: AppColors.textBlack,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '상태',
                    style: TextStyle(
                      fontWeight: AppFonts.fontWeight400,
                      fontSize: AppFonts.fontSize15,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  Text(
                    '완료',
                    style: TextStyle(
                      fontWeight: AppFonts.fontWeight500,
                      fontSize: AppFonts.fontSize15,
                      color: AppColors.textBlack,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32.0),
          BuildSubmit(
            context,
            customWidget: ElevatedButton(
              // onPressed: () {
              //   ModalService.openGeneralDialog(
              //     context,
              //     child: _buildQRModal(context),
              //   );
              // },
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                  color: AppColors.borderPrimary,
                ),
                minimumSize: const Size.fromHeight(56.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(52.0),
                ),
                backgroundColor: const Color(0xFFF2F1F8),
              ),
              child: const Text(
                '트랜잭션 탐색기에서 보기',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xFF160D59),
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
          value: 'default',
          selectedItemBuilder: (context) {
            return const [
              Center(
                child: Text(
                  '전체 자산',
                  style: TextStyle(
                    fontWeight: AppFonts.fontWeight400,
                    fontSize: AppFonts.fontSize15,
                    color: Color(0xFFB2E5F5),
                  ),
                ),
              ),
            ];
          },
          dropdownColor: const Color(0xFF160D59),
          items: const [
            DropdownMenuItem(
              value: 'default',
              child: Text(
                '전체 자산',
                style: TextStyle(
                  fontWeight: AppFonts.fontWeight400,
                  fontSize: AppFonts.fontSize15,
                  color: Color(0xFFB2E5F5),
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'ethereum',
              child: Text(
                '이더리움',
                style: TextStyle(
                  fontWeight: AppFonts.fontWeight400,
                  fontSize: AppFonts.fontSize15,
                  color: Color(0xFFB2E5F5),
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'fanc',
              child: Text(
                '팬시',
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
    );
  }
}

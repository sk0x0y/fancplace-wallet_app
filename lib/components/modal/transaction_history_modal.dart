import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/interface/service/router_service.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class TransactionHistoryModal extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const TransactionHistoryModal({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const bool showEmpty = false;

    return DefaultLayout(
      leader: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          RouterService.instance.router.pop();
        },
      ),
      customTitleWidget: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 18.0,
          color: Colors.white,
        ),
      ),
      appBarBackgroundColor: const Color(0xFF0A043C),
      backgroundColor: const Color(0xFF0A043C),
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
                          onTap: onTap,
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
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
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
                  fontWeight: FontWeight.w400,
                  fontSize: 15.0,
                  color: Color(0xFFB2E5F5),
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'ethereum',
              child: Text(
                '이더리움',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.0,
                  color: Color(0xFFB2E5F5),
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'fanc',
              child: Text(
                '팬시',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.0,
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

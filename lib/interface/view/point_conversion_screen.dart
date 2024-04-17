import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/constant/theme/theme_resources.dart';
import 'package:wallet_app/interface/service/router_service.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class PointConversionScreen extends StatelessWidget {
  const PointConversionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      leader: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.white),
        onPressed: () {
          RouterService.instance.router.push('/select-language');
        },
      ),
      customTitleWidget: const Text(
        '포인트 전환',
        style: TextStyle(
          fontWeight: AppFonts.fontWeight900,
          fontSize: AppFonts.fontSize18,
          color: AppColors.white,
        ),
      ),
      appBarBackgroundColor: AppColors.backgroundPrimary,
      backgroundColor: AppColors.backgroundPrimary,
      child: Padding(
        padding: const EdgeInsets.only(top: 34.0, left: 24.0, right: 24.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: AppColors.brandPrimary),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 24.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8.0,
                      children: [
                        SvgPicture.asset('assets/brand_icon.svg'),
                        SvgPicture.asset('assets/brand_text.svg'),
                      ],
                    ),
                    const SizedBox(height: 14.0),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        '13,039 P',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontWeight: AppFonts.fontWeight700,
                          fontSize: AppFonts.fontSize24,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    Flex(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          child: Center(
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 10.0,
                              children: [
                                SvgPicture.asset(
                                    'assets/point_conversion_history_icon.svg'),
                                const Text(
                                  '전환 내역',
                                  style: TextStyle(
                                    fontWeight: AppFonts.fontWeight400,
                                    fontSize: AppFonts.fontSize14,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 10.0,
                              children: [
                                SvgPicture.asset(
                                    'assets/reward_history_icon.svg'),
                                const Text(
                                  '전환 내역',
                                  style: TextStyle(
                                    fontWeight: AppFonts.fontWeight400,
                                    fontSize: AppFonts.fontSize14,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            Flexible(
              child: Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: Theme.of(context)
                      .colorScheme
                      .copyWith(surfaceVariant: Colors.transparent),
                ),
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      const TabBar(
                        labelStyle: TextStyle(
                          fontWeight: AppFonts.fontWeight700,
                          fontSize: AppFonts.fontSize15,
                          color: Colors.white,
                        ),
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                              width: 4.0, color: AppColors.brandPrimary),
                          borderRadius: BorderRadius.zero,
                        ),
                        unselectedLabelColor: Color(0xFF84819D),
                        tabs: [
                          Tab(text: '내보내기', height: 50),
                          Tab(text: '가져오기', height: 50),
                        ],
                      ),
                      const SizedBox(height: 24.0),
                      Expanded(
                        child: TabBarView(
                          children: [
                            ListView.builder(
                              key: const PageStorageKey("POINT_EXPORT"),
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        RouterService.instance.router
                                            .push('/linking-account');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF110A4D),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        padding: const EdgeInsets.all(16.0),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Wrap(
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.center,
                                              spacing: 8.0,
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/celebe_brand_icon.svg',
                                                  width: 40.0,
                                                  height: 40.0,
                                                ),
                                                const Text(
                                                  "셀러비 포인트",
                                                  style: TextStyle(
                                                    fontWeight:
                                                        AppFonts.fontWeight500,
                                                    fontSize:
                                                        AppFonts.fontSize14,
                                                    color: AppColors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Wrap(
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.center,
                                              spacing: 10.0,
                                              children: [
                                                Text(
                                                  "1,400 P",
                                                  style: TextStyle(
                                                    fontWeight:
                                                        AppFonts.fontWeight500,
                                                    fontSize:
                                                        AppFonts.fontSize16,
                                                    color: AppColors.white,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Color(0xFF84819D),
                                                  size: 12.0,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16.0)
                                  ],
                                );
                              },
                            ),
                            ListView.builder(
                              key: const PageStorageKey("POINT_IMPORT"),
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF110A4D),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      padding: const EdgeInsets.all(16.0),
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Wrap(
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            spacing: 8.0,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/fanc_brand_icon.svg',
                                                width: 40.0,
                                                height: 40.0,
                                              ),
                                              const Text(
                                                "FANC",
                                                style: TextStyle(
                                                  fontWeight:
                                                      AppFonts.fontWeight500,
                                                  fontSize: AppFonts.fontSize14,
                                                  color: AppColors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Wrap(
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            spacing: 10.0,
                                            children: [
                                              Text(
                                                "1,400 FANC",
                                                style: TextStyle(
                                                  fontWeight:
                                                      AppFonts.fontWeight500,
                                                  fontSize: AppFonts.fontSize16,
                                                  color: AppColors.white,
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                color: Color(0xFF84819D),
                                                size: 12.0,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 16.0)
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

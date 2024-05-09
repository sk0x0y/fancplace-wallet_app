import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/constant/theme/theme_resources.dart';
import 'package:wallet_app/interface/service/router_service.dart';
import 'package:wallet_app/interface/view/assets/point_conversion_screen.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class WalletScreen extends StatelessWidget {
  final listIndex = 0;
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      leader: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.white),
        onPressed: () {
          RouterService.instance.router.go('/assets/point/conversion');
        },
      ),
      customTitleWidget: const Text(
        '내 지갑',
        style: TextStyle(
          fontWeight: AppFonts.fontWeight900,
          fontSize: AppFonts.fontSize18,
          color: AppColors.white,
        ),
      ),
      appBarBackgroundColor: AppColors.backgroundPrimary,
      backgroundColor: AppColors.backgroundPrimary,
      child: Padding(
        padding: const EdgeInsets.only(top: 34.0),
        child: Column(
          children: [
            buildBannerCarouselSlider(),
            const SizedBox(height: 30.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/cs/announce-icon.svg'),
                  const SizedBox(width: 16.0),
                  const Text(
                    '공지사항입니다. 공지를 확인해라.',
                    style: TextStyle(
                      fontWeight: AppFonts.fontWeight400,
                      fontSize: AppFonts.fontSize15,
                      color: AppColors.white,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  const Text(
                    '22.11.10',
                    style: TextStyle(
                      fontWeight: AppFonts.fontWeight400,
                      fontSize: AppFonts.fontSize13,
                      color: Color(0xFF84819D),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: Color(0xFF08032E), thickness: 16.0),
            buildTabBar(context),
          ],
        ),
      ),
    );
  }

  Widget buildTabBar(BuildContext context) {
    return Flexible(
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
                  borderSide:
                      BorderSide(width: 4.0, color: AppColors.brandPrimary),
                  borderRadius: BorderRadius.zero,
                ),
                unselectedLabelColor: Color(0xFF84819D),
                tabs: [
                  Tab(text: '가상자산', height: 50),
                  Tab(text: 'NFT', height: 50),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '보유자산',
                      style: TextStyle(
                        fontWeight: AppFonts.fontWeight400,
                        fontSize: AppFonts.fontSize15,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(width: 14.0),
                    Switch(
                      value: true,
                      onChanged: (value) {},
                      activeColor: AppColors.brandPrimary,
                      activeTrackColor: AppColors.brandPrimary.withOpacity(0.5),
                    ),
                    const Expanded(child: SizedBox()),
                    IconButton(
                      icon: const Icon(
                        Icons.refresh_outlined,
                        color: AppColors.textSecondary,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView.builder(
                      key: const PageStorageKey("WALLET_ASSET"),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: GestureDetector(
                                onTap: () {
                                  RouterService.instance.router
                                      .push('/wallet/transaction-history');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF110A4D),
                                    borderRadius: BorderRadius.circular(15.0),
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
                                            'assets/logo/fanc_brand_icon.svg',
                                            width: 40.0,
                                            height: 40.0,
                                          ),
                                          const Text(
                                            "셀러비 포인트",
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
                                            "1,400 P",
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
                              ),
                            ),
                            const SizedBox(height: 16.0)
                          ],
                        );
                      },
                    ),
                    listIndex != 0
                        ? ListView.builder(
                            key: const PageStorageKey("WALLET_NFT"),
                            itemCount: 0,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        RouterService.instance.router
                                            .push('/assets/point/exchange');
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
                                                  'assets/logo/fanc_brand_icon.svg',
                                                  width: 40.0,
                                                  height: 40.0,
                                                ),
                                                const Text(
                                                  "FANC",
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
                                                  "1,400 FANC",
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
                                  ),
                                  const SizedBox(height: 16.0)
                                ],
                              );
                            },
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  'assets/carousel/no_any_assets.svg'),
                              const SizedBox(height: 40.0),
                              const Text(
                                "NFT를 보유하고 있지 않습니다.",
                                style: TextStyle(
                                  fontWeight: AppFonts.fontWeight500,
                                  fontSize: AppFonts.fontSize18,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              const SizedBox(height: 12.0),
                              const Text(
                                "NFT를 구매하거나 보유하고 계신지 확인해주세요.",
                                style: TextStyle(
                                  fontWeight: AppFonts.fontWeight400,
                                  fontSize: AppFonts.fontSize14,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  CarouselSlider buildBannerCarouselSlider() {
    return CarouselSlider(
      items: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.asset(
            'assets/carousel/damdam.png',
            fit: BoxFit.cover,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.network(
            'https://placehold.co/345x150/${AppColors.backgroundTertiary.value.toRadixString(16).padLeft(2, '0').toString().substring(2)}/black/png?text=Hello+World!&font=source-sans-pro',
            fit: BoxFit.cover,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.network(
            'https://placehold.co/345x150/${AppColors.buttonPrimary.value.toRadixString(16).padLeft(2, '0').toString().substring(2)}/black/png?text=Test Slide\nImage 3&font=source-sans-pro',
            fit: BoxFit.cover,
          ),
        ),
      ],
      options: CarouselOptions(
        height: 150.0,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        animateToClosest: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(milliseconds: 3750),
        autoPlayAnimationDuration: const Duration(milliseconds: 750),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeFactor: 0.2,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

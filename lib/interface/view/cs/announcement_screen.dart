import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/components/buildInput.dart';
import 'package:wallet_app/constant/theme/theme_resources.dart';
import 'package:wallet_app/interface/service/router_service.dart';
import 'package:wallet_app/interface/view/cs/announce_detail_page.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class AnnouncementScreen extends StatelessWidget {
  const AnnouncementScreen({super.key});

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
        '소식 및 공지사항',
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
            _buildBannerCarouselSlider(),
            const SizedBox(height: 30.0),
            _buildAnnounces(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAnnounces(BuildContext context) {
    const bool showEmpty = false;

    return Flexible(
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 42.0,
                left: 24.0,
                right: 24.0,
                bottom: 24.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '최신 공지사항',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,
                      color: AppColors.textBlack,
                    ),
                  ),
                  Text(
                    '총 164개 글',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13.0,
                      color: Color(0xFF0A043C),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                bottom: 12.0,
              ),
              child: BuildInput(
                context,
                labelText: '',
                inputWidget: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      icon: SvgPicture.asset('assets/search_icon.svg'),
                      onPressed: () {},
                    ),
                    filled: true,
                    fillColor: AppColors.backgroundSecondary,
                    hintText: '검색어를 입력하세요',
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
            ),
            showEmpty
                ? Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/no-search-result.svg'),
                        const SizedBox(height: 40.0),
                        const Text(
                          '일치하는 내용이 없습니다.',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                            color: Color(0xFF84819D),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          '검색어를 확인하거나 다른 검색어로 검색해 보세요.',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            color: Color(0xFF84819D),
                          ),
                        ),
                      ],
                    ),
                  )
                : Flexible(
                    child: ListView.builder(
                      key: const PageStorageKey("ANNOUNCEMENT_LIST"),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                print('Announce Detail Page');
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AnnounceDetailPage(),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              'assets/announce_post_thumbnail.png',
                                            ),
                                            const SizedBox(width: 16.0),
                                            const Flexible(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '2022-11-23',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12.0,
                                                      color: Color(0xFF585DF9),
                                                    ),
                                                  ),
                                                  SizedBox(height: 6.0),
                                                  Text(
                                                    '빤시왈렛 점검 일정 안내',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16.0,
                                                      color: Color(0xFF16183B),
                                                    ),
                                                  ),
                                                  SizedBox(height: 6.0),
                                                  Text(
                                                    '모든 국민은 법률이 정하는 바에 의하여 공무담임권을가진다. 국가안전보장에 관련되는 대외정책·군사정책과 국내정책의 수립에 관하여 국무회의의 심의에 앞서 대통령의 자문에 응하기 위하여 국가안전보장회의를 둔다.',
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14.0,
                                                      color: Color(0xFF84819D),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Wrap(
                                      //   crossAxisAlignment: WrapCrossAlignment.center,
                                      //   spacing: 10.0,
                                      //   children: [
                                      //     CircleAvatar(
                                      //       backgroundColor: AppColors.backgroundPrimary,
                                      //       child: SvgPicture.asset(
                                      //         'assets/wallet/history-deposit.svg',
                                      //       ),
                                      //     ),
                                      //     const Wrap(
                                      //       direction: Axis.vertical,
                                      //       spacing: 4.0,
                                      //       children: [
                                      //         Text(
                                      //           "0xC12sd…AF9d2",
                                      //           style: TextStyle(
                                      //             fontWeight: FontWeight.w500,
                                      //             fontSize: 15.0,
                                      //             color: AppColors.textBlack,
                                      //           ),
                                      //         ),
                                      //         Text(
                                      //           "받기 ∙ 09-01 14:03",
                                      //           style: TextStyle(
                                      //             fontWeight: FontWeight.w400,
                                      //             fontSize: 14.0,
                                      //             color: AppColors.textSecondary,
                                      //           ),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ],
                                      // ),
                                      // const Wrap(
                                      //   direction: Axis.vertical,
                                      //   crossAxisAlignment: WrapCrossAlignment.end,
                                      //   spacing: 4.0,
                                      //   children: [
                                      //     Text(
                                      //       "0.4561",
                                      //       style: TextStyle(
                                      //         fontWeight: FontWeight.w700,
                                      //         fontSize: 15.0,
                                      //         color: AppColors.textBlack,
                                      //       ),
                                      //     ),
                                      //     Text(
                                      //       "1,400원",
                                      //       style: TextStyle(
                                      //         fontWeight: FontWeight.w500,
                                      //         fontSize: 14.0,
                                      //         color: AppColors.textSecondary,
                                      //       ),
                                      //     ),
                                      //   ],
                                      // )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  CarouselSlider _buildBannerCarouselSlider() {
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

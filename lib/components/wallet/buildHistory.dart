import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/constant/theme/theme_resources.dart';
import 'package:wallet_app/interface/service/router_service.dart';

class BuildHistory extends StatefulWidget {
  final VoidCallback? onTap;
  const BuildHistory({super.key, this.onTap});

  @override
  State<BuildHistory> createState() => _BuildHistoryState();
}

class _BuildHistoryState extends State<BuildHistory>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: Theme.of(context)
              .colorScheme
              .copyWith(surfaceVariant: Colors.transparent),
        ),
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              labelStyle: const TextStyle(
                fontWeight: AppFonts.fontWeight700,
                fontSize: AppFonts.fontSize15,
                color: Colors.white,
              ),
              indicator: const UnderlineTabIndicator(
                borderSide:
                    BorderSide(width: 4.0, color: AppColors.brandPrimary),
                borderRadius: BorderRadius.zero,
              ),
              unselectedLabelColor: const Color(0xFF84819D),
              tabs: const [
                Tab(text: '지갑내역', height: 50),
                Tab(text: '전환내역', height: 50),
              ],
            ),
            Flexible(
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      key: const PageStorageKey("WALLET_HISTORY"),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            if (index == 0)
                              const Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 42.0,
                                      left: 24.0,
                                      bottom: 24.0,
                                    ),
                                    child: Text(
                                      '거래 내역',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18.0,
                                        color: AppColors.textBlack,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: widget.onTap,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        spacing: 10.0,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                AppColors.backgroundPrimary,
                                            child: SvgPicture.asset(
                                              'assets/wallet/history-deposit.svg',
                                            ),
                                          ),
                                          const Wrap(
                                            direction: Axis.vertical,
                                            spacing: 4.0,
                                            children: [
                                              Text(
                                                "0xC12sd…AF9d2",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15.0,
                                                  color: AppColors.textBlack,
                                                ),
                                              ),
                                              Text(
                                                "받기 ∙ 09-01 14:03",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14.0,
                                                  color:
                                                      AppColors.textSecondary,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Wrap(
                                        direction: Axis.vertical,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.end,
                                        spacing: 4.0,
                                        children: [
                                          Text(
                                            "0.4561",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15.0,
                                              color: AppColors.textBlack,
                                            ),
                                          ),
                                          Text(
                                            "1,400원",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.0,
                                              color: AppColors.textSecondary,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: widget.onTap,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        spacing: 10.0,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                AppColors.brandPrimary,
                                            child: SvgPicture.asset(
                                              'assets/wallet/history-withdrawal.svg',
                                            ),
                                          ),
                                          const Wrap(
                                            direction: Axis.vertical,
                                            spacing: 4.0,
                                            children: [
                                              Text(
                                                "0xC12sd…AF9d2",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15.0,
                                                  color: AppColors.textBlack,
                                                ),
                                              ),
                                              Text(
                                                "보내기 ∙ 09-01 14:03",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14.0,
                                                  color:
                                                      AppColors.textSecondary,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Wrap(
                                        direction: Axis.vertical,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.end,
                                        spacing: 4.0,
                                        children: [
                                          Text(
                                            "-0.4561",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15.0,
                                              color: AppColors.textBlack,
                                            ),
                                          ),
                                          Text(
                                            "1,340원",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.0,
                                              color: AppColors.textSecondary,
                                            ),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/no-result.svg'),
                        const SizedBox(height: 40.0),
                        const Text(
                          "거래 내역이 없습니다.",
                          style: TextStyle(
                            fontWeight: AppFonts.fontWeight500,
                            fontSize: AppFonts.fontSize18,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        const Text(
                          "팬시 월렛의 지갑서비스를 이용해보세요.",
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
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/components/buildPointCard.dart';
import 'package:wallet_app/components/buildSubmit.dart';
import 'package:wallet_app/interface/view/verify_page.dart';
import 'package:wallet_app/interface/service/modal_service.dart';
import 'package:wallet_app/constant/theme/theme_resources.dart';
import 'package:wallet_app/interface/service/router_service.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class RedeemingPointScreen extends StatelessWidget {
  const RedeemingPointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      leader: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.white),
        onPressed: () {
          RouterService.instance.router.push('/linking-account');
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildHero(),
            ColoredBox(
              color: AppColors.white.withOpacity(0.07),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 40.0,
                  horizontal: 24.0,
                ),
                child: Wrap(
                  runSpacing: 23.0 / 13.0,
                  children: [
                    buildGuildLine(),
                    const SizedBox(height: 60.0),
                    BuildSubmit(
                      context,
                      buttonBackgroundColor: AppColors.buttonPrimary,
                      buttonText: '전환하기',
                      buttonHandler: () {
                        ModalService.openBottomSheet(
                          context,
                          radius: 40.0,
                          child: buildExchangeBottomSheet(context),
                        );
                      },
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

  Widget buildExchangeResult(BuildContext context) {
    return DefaultLayout(
      leader: const SizedBox(),
      appBarBackgroundColor: AppColors.backgroundPrimary,
      backgroundColor: AppColors.backgroundPrimary,
      customTitleWidget: const Text(
        '포인트 전환',
        style: TextStyle(
          fontWeight: AppFonts.fontWeight900,
          fontSize: AppFonts.fontSize18,
          color: AppColors.white,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: AppColors.white,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 40.0,
                      horizontal: 24.0,
                    ),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/transfer.svg',
                          width: 55.0,
                          height: 55.0,
                        ),
                        const SizedBox(height: 24.0),
                        const Text(
                          '전환 완료',
                          style: TextStyle(
                            fontWeight: AppFonts.fontWeight700,
                            fontSize: AppFonts.fontSize24,
                            color: AppColors.textBlack,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        const Text(
                          '자산 전환이 성공적으로 완료되었습니다.',
                          style: TextStyle(
                            fontWeight: AppFonts.fontWeight400,
                            fontSize: AppFonts.fontSize14,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 40.0, bottom: 30.0),
                          child: DottedLine(
                            dashLength: 4.0,
                            dashColor: Color.fromRGBO(132, 129, 157, 0.5),
                            lineThickness: 2.0,
                            dashRadius: 0.0,
                            dashGapLength: 8.0,
                            direction: Axis.horizontal,
                            lineLength: double.infinity,
                          ),
                        ),
                        const Wrap(
                          runSpacing: 10.0,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'From',
                                  style: TextStyle(
                                    fontWeight: AppFonts.fontWeight400,
                                    fontSize: AppFonts.fontSize15,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                Text(
                                  '24000 FANCP',
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
                                  'To',
                                  style: TextStyle(
                                    fontWeight: AppFonts.fontWeight400,
                                    fontSize: AppFonts.fontSize15,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                Text(
                                  '717 FANC',
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
                                  '차감 방식',
                                  style: TextStyle(
                                    fontWeight: AppFonts.fontWeight400,
                                    fontSize: AppFonts.fontSize15,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                Text(
                                  '이더리움 지급 방식',
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
                                  '수수료',
                                  style: TextStyle(
                                    fontWeight: AppFonts.fontWeight400,
                                    fontSize: AppFonts.fontSize15,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                Text(
                                  '50 FANCP',
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            BuildSubmit(
              context,
              radius: 52.0,
              buttonBackgroundColor: AppColors.buttonPrimary,
              buttonText: '완료',
              buttonHandler: () {
                // RouterService.instance.router.go('/point-conversion');
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildVerifyAuthenticationCode(BuildContext context) {
    return DefaultLayout(
      backgroundColor: AppColors.backgroundPrimary,
      child: VerifyPage(
        title: '인증 코드',
        message: '가입된 이메일로 인증번호를 전송하였습니다.\n전환을 완료하기 위해 인증이 필요합니다.',
        childWidgets: [
          const SizedBox(height: 90.0),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10.0,
            children: [
              const Text(
                '인증 이메일을 받지 못하셨나요?',
                style: TextStyle(
                  fontWeight: AppFonts.fontWeight400,
                  fontSize: AppFonts.fontSize14,
                  color: AppColors.textSecondary,
                ),
              ),
              TextButton(
                onPressed: () {
                  ModalService.openGeneralDialog(
                    context,
                    usePreventPop: true,
                    child: buildExchangeResult(context),
                  );
                },
                child: const Text(
                  '인증 메일 재전송',
                  style: TextStyle(
                    fontWeight: AppFonts.fontWeight400,
                    fontSize: AppFonts.fontSize14,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildExchangeBottomSheet(BuildContext context) {
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
            '수수료 차감 방식 선택',
            style: TextStyle(
              fontWeight: AppFonts.fontWeight700,
              fontSize: AppFonts.fontSize24,
              color: AppColors.textBlack,
            ),
          ),
          const SizedBox(height: 32.0),
          Wrap(
            runSpacing: 12.0,
            children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.buttonPrimary,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.backgroundSecondary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Wrap(
                      direction: Axis.vertical,
                      spacing: 10.0,
                      children: [
                        Text(
                          '포인트 전환만 하겠습니다.',
                          style: TextStyle(
                            fontWeight: AppFonts.fontWeight500,
                            fontSize: AppFonts.fontSize16,
                            color: AppColors.textBlack,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            text: '24,000 P > ',
                            style: TextStyle(
                              fontWeight: AppFonts.fontWeight500,
                              fontSize: AppFonts.fontSize15,
                              color: AppColors.textSecondary,
                            ),
                            children: [
                              TextSpan(
                                text: '717 FANC',
                                style: TextStyle(
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 30.0,
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
                        fillColor: MaterialStateProperty.resolveWith((states) {
                          if (!states.contains(MaterialState.selected)) {
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
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.backgroundSecondary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 10.0,
                      children: [
                        Container(
                          constraints: const BoxConstraints(
                            maxWidth: 300.0,
                          ),
                          child: const Text(
                            '포인트를 전환하고 ETH를 지급 받겠습니다.',
                            style: TextStyle(
                              fontWeight: AppFonts.fontWeight500,
                              fontSize: AppFonts.fontSize16,
                              color: AppColors.textBlack,
                            ),
                          ),
                        ),
                        const Text.rich(
                          TextSpan(
                            text: '24,000 P > ',
                            style: TextStyle(
                              fontWeight: AppFonts.fontWeight500,
                              fontSize: AppFonts.fontSize15,
                              color: AppColors.textSecondary,
                            ),
                            children: [
                              TextSpan(
                                text: '717 FANC',
                                style: TextStyle(
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 30.0,
                      child: Checkbox(
                        value: false,
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
                        fillColor: MaterialStateProperty.resolveWith((states) {
                          if (!states.contains(MaterialState.selected)) {
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
              const Text(
                '* ETH는 FANC를 외부 지갑으로 전송 시 사용됩니다.',
                style: TextStyle(
                  fontWeight: AppFonts.fontWeight400,
                  fontSize: AppFonts.fontSize13,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32.0),
          BuildSubmit(
            context,
            radius: 10.0,
            buttonText: '확인',
            buttonHandler: () {
              ModalService.openGeneralDialog(
                context,
                child: buildVerifyAuthenticationCode(context),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildGuildLine() {
    return const Wrap(
      runSpacing: 23.0 / 13.0,
      children: [
        Text.rich(
          TextSpan(
            text: '포인트 전환 유의사항\n\n',
            style: TextStyle(
              fontWeight: AppFonts.fontWeight500,
              fontSize: AppFonts.fontSize16,
              color: AppColors.textSecondary,
            ),
            children: [
              TextSpan(
                text: '• 전환 비율은 실시간으로 변동될 수 있습니다.',
                style: TextStyle(
                  fontWeight: AppFonts.fontWeight400,
                  fontSize: AppFonts.fontSize13,
                ),
              ),
            ],
          ),
        ),
        Text.rich(
          TextSpan(
            text: '• ',
            style: TextStyle(
              fontWeight: AppFonts.fontWeight400,
              fontSize: AppFonts.fontSize13,
              color: AppColors.textSecondary,
            ),
            children: [TextSpan(text: '제휴사 정책에 따라 서비스 이용이 제한될 수 있습니다.')],
          ),
        ),
        Text.rich(
          TextSpan(
            text: '• ',
            style: TextStyle(
              fontWeight: AppFonts.fontWeight400,
              fontSize: AppFonts.fontSize13,
              color: AppColors.textSecondary,
            ),
            children: [
              TextSpan(
                text: '전환 비율은 실시간으로 변동될 수 있습니다.',
                style: TextStyle(color: Color(0xFFDB2B1D)),
              ),
            ],
          ),
        ),
        Text.rich(
          TextSpan(
            text: '• ',
            style: TextStyle(
              fontWeight: AppFonts.fontWeight400,
              fontSize: AppFonts.fontSize13,
              color: AppColors.textSecondary,
            ),
            children: [
              TextSpan(text: '전환된 포인트는 현금영수증 발행이 불가능합니다.'),
            ],
          ),
        ),
        SizedBox(height: 60.0),
      ],
    );
  }

  Widget buildHero() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 32.0,
        bottom: 40.0,
        left: 24.0,
        right: 24.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text.rich(
            TextSpan(
              text: '팬시 포인트(FANCP)를\n',
              style: TextStyle(
                fontWeight: AppFonts.fontWeight500,
                fontSize: AppFonts.fontSize20,
                color: AppColors.white,
              ),
              children: [
                TextSpan(
                  text: '팬시(FANC)',
                  style: TextStyle(color: AppColors.textPrimary),
                ),
                TextSpan(text: '로 전환합니다.'),
              ],
            ),
          ),
          const SizedBox(height: 24.0),
          BuildPointCard(
            borderRadius: 30.0,
            backgroundColor: AppColors.white,
            actionBackgroundColor: const Color(0xFFF2F1F8),
            label: const Text(
              '전환 요청 포인트',
              style: TextStyle(
                fontWeight: AppFonts.fontWeight400,
                fontSize: AppFonts.fontSize15,
                color: AppColors.textSecondary,
              ),
            ),
            currency: TextFormField(
              decoration: const InputDecoration(
                hintText: '0',
                hintStyle: TextStyle(
                  fontWeight: AppFonts.fontWeight500,
                  fontSize: AppFonts.fontSize16,
                  color: AppColors.textPrimary,
                ),
                border: InputBorder.none,
              ),
              style: const TextStyle(
                fontWeight: AppFonts.fontWeight500,
                fontSize: AppFonts.fontSize16,
                color: AppColors.textPrimary,
              ),
            ),
            actions: const [
              Expanded(
                child: Center(
                  child: Text(
                    '입력 초기화',
                    style: TextStyle(
                      fontWeight: AppFonts.fontWeight400,
                      fontSize: AppFonts.fontSize14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    '전체 수량',
                    style: TextStyle(
                      fontWeight: AppFonts.fontWeight400,
                      fontSize: AppFonts.fontSize14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 34.0),
          Wrap(
            runSpacing: 20.0,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10.0,
                    children: [
                      SvgPicture.asset(
                        'assets/brand_icon.svg',
                        width: 30.0,
                        height: 30.0,
                      ),
                      const Text(
                        '팬시 포인트',
                        style: TextStyle(
                          fontWeight: AppFonts.fontWeight500,
                          fontSize: AppFonts.fontSize16,
                          color: AppColors.white,
                        ),
                      )
                    ],
                  ),
                  const Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 12.0,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.end,
                        spacing: 2.0,
                        children: [
                          Text(
                            '-24,000 P',
                            style: TextStyle(
                              fontWeight: AppFonts.fontWeight500,
                              fontSize: AppFonts.fontSize16,
                              color: AppColors.white,
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              text: '보유: ',
                              style: TextStyle(
                                fontWeight: AppFonts.fontWeight400,
                                fontSize: AppFonts.fontSize14,
                                color: AppColors.textSecondary,
                              ),
                              children: [TextSpan(text: '24,000 P')],
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.refresh_outlined,
                        size: 30.0,
                        color: AppColors.textSecondary,
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset(
                  'assets/exchange_point_arrow_down.svg',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10.0,
                    children: [
                      SvgPicture.asset(
                        'assets/fanc_brand_icon.svg',
                        width: 30.0,
                        height: 30.0,
                      ),
                      const Text(
                        '팬시',
                        style: TextStyle(
                          fontWeight: AppFonts.fontWeight500,
                          fontSize: AppFonts.fontSize16,
                          color: AppColors.white,
                        ),
                      )
                    ],
                  ),
                  const Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 12.0,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.end,
                        spacing: 2.0,
                        children: [
                          Text(
                            '+717 FANC',
                            style: TextStyle(
                              fontWeight: AppFonts.fontWeight500,
                              fontSize: AppFonts.fontSize16,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              text: '보유: ',
                              style: TextStyle(
                                fontWeight: AppFonts.fontWeight400,
                                fontSize: AppFonts.fontSize14,
                                color: AppColors.textSecondary,
                              ),
                              children: [TextSpan(text: '205.4531 FANC')],
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.refresh,
                        size: 30.0,
                        color: AppColors.textSecondary,
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(
                height: 20.0,
                thickness: 0.5,
                color: Color.fromRGBO(132, 129, 157, 0.5),
              ),
              const Wrap(
                runSpacing: 10.0,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '• 최소 전환 포인트',
                        style: TextStyle(
                          fontWeight: AppFonts.fontWeight400,
                          fontSize: AppFonts.fontSize14,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      Text(
                        '12,783 P',
                        style: TextStyle(
                          fontWeight: AppFonts.fontWeight400,
                          fontSize: AppFonts.fontSize14,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '• 전환 비율',
                        style: TextStyle(
                          fontWeight: AppFonts.fontWeight400,
                          fontSize: AppFonts.fontSize14,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          text: '39 : 1 (FANCP ',
                          style: TextStyle(
                            fontWeight: AppFonts.fontWeight400,
                            fontSize: AppFonts.fontSize14,
                            color: AppColors.textSecondary,
                          ),
                          children: [
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Icon(
                                Icons.sync_alt,
                                size: 20.0,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            TextSpan(text: ' FANC)'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

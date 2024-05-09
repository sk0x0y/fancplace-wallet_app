import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/components/buildInput.dart';
import 'package:wallet_app/components/buildPointCard.dart';
import 'package:wallet_app/components/buildSubmit.dart';
import 'package:wallet_app/components/modal/qr_scan_modal.dart';
import 'package:wallet_app/components/wallet/buildHistory.dart';
import 'package:wallet_app/constant/theme/theme_resources.dart';
import 'package:wallet_app/interface/service/modal_service.dart';
import 'package:wallet_app/interface/service/router_service.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      leader: const BackButton(color: AppColors.white),
      customTitleWidget: const Text(
        '팬시 (FANC)',
        style: TextStyle(
          fontWeight: AppFonts.fontWeight900,
          fontSize: AppFonts.fontSize18,
          color: AppColors.white,
        ),
      ),
      appBarBackgroundColor: AppColors.backgroundPrimary,
      backgroundColor: AppColors.backgroundPrimary,
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 34.0),
            _buildBalance(),
            const SizedBox(height: 32.0),
            _buildActions(
              context,
              onTap: () {
                ModalService.openBottomSheet(
                  context,
                  useRootNavigator: true,
                  height: 412.0,
                  radius: 40.0,
                  child: _buildDetailModal(context),
                );
              },
            ),
            const SizedBox(height: 62.0),
            _buildHistory(context),
          ],
        ),
      ),
    );
  }

  void _buildConversionModal(BuildContext context) {}

  Widget _buildDepositModal(BuildContext context) {
    return DefaultLayout(
      leader: const BackButton(color: AppColors.white),
      appBarBackgroundColor: AppColors.backgroundPrimary,
      backgroundColor: AppColors.backgroundPrimary,
      customTitleWidget: const Text(
        '팬시 (FANC)',
        style: TextStyle(
          fontWeight: AppFonts.fontWeight900,
          fontSize: AppFonts.fontSize18,
          color: AppColors.white,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Balance : 130.9027 FANC',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 13.0,
                color: Color(0xFFB2E5F5),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '나의 QR 코드',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  const Text(
                    '입금 전용 주소입니다.\n아래의 주소로 FANC을(를) 전송해주세요.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.0,
                      color: Color(0xFF84819D),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Container(
                    width: 310.0,
                    height: 310.0,
                    padding: const EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundSecondary,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: SvgPicture.asset(
                      'assets/qrcode.svg',
                      width: 200.0,
                      height: 200.0,
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  const Text(
                    '0x379isdv0qu4rfsv9ujwtregriop1jkl43rweg',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0,
                      color: Color(0xFFD7CFE3),
                    ),
                  ),
                  const SizedBox(height: 72.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: BuildSubmit(
                          context,
                          radius: 10.0,
                          buttonBackgroundColor:
                              const Color.fromRGBO(132, 129, 157, 0.2),
                          customButtonChild: const Wrap(
                            spacing: 10.0,
                            children: [
                              Icon(Icons.copy, color: Colors.white),
                              Text(
                                '복사하기',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: BuildSubmit(
                          context,
                          radius: 10.0,
                          buttonBackgroundColor:
                              const Color.fromRGBO(82, 62, 232, 0.2),
                          customButtonChild: const Wrap(
                            spacing: 10.0,
                            children: [
                              Icon(Icons.share, color: Colors.white),
                              Text(
                                '공유하기',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
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
    );
  }

  Widget _buildWithdrawalResult(BuildContext context) {
    return DefaultLayout(
      leader: const SizedBox(),
      appBarBackgroundColor: AppColors.backgroundPrimary,
      backgroundColor: AppColors.backgroundPrimary,
      customTitleWidget: const Text(
        'FANC',
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
                          'assets/transfer-result.svg',
                          width: 55.0,
                          height: 55.0,
                        ),
                        const SizedBox(height: 24.0),
                        const Text(
                          '전송 완료',
                          style: TextStyle(
                            fontWeight: AppFonts.fontWeight700,
                            fontSize: AppFonts.fontSize24,
                            color: AppColors.textBlack,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        const Text(
                          '전송 요청이 완료되었습니다.\n네트워크 상태에 따라 시간이 소요될 수 있습니다.',
                          textAlign: TextAlign.center,
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
                                  'To',
                                  style: TextStyle(
                                    fontWeight: AppFonts.fontWeight400,
                                    fontSize: AppFonts.fontSize15,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                Text(
                                  '0x379isdv...uegriop1j',
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
                                  '수량',
                                  style: TextStyle(
                                    fontWeight: AppFonts.fontWeight400,
                                    fontSize: AppFonts.fontSize15,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                Text(
                                  '240.15 FANC',
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
                                  '가격',
                                  style: TextStyle(
                                    fontWeight: AppFonts.fontWeight400,
                                    fontSize: AppFonts.fontSize15,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                Text(
                                  '40원 / FANC',
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
                                  '50 FANC',
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
                Navigator.of(context, rootNavigator: true)
                    .popUntil((route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWithdrawalConfirmModal(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 64.0,
        horizontal: 24.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '204.14 FANC를\n전송하시겠습니까?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25.0,
              color: AppColors.textBlack,
            ),
          ),
          const SizedBox(height: 40.0),
          const Text.rich(
            TextSpan(
              text: '받는 주소 : ',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15.0,
                color: AppColors.textSecondary,
              ),
              children: [
                TextSpan(
                  text: '0x379isdv0q...wtregriop1j',
                ),
              ],
            ),
          ),
          const SizedBox(height: 6.0),
          const Text.rich(
            TextSpan(
              text: '수수료 : ',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15.0,
                color: AppColors.textSecondary,
              ),
              children: [
                TextSpan(
                  text: '10 FANC',
                ),
              ],
            ),
          ),
          const SizedBox(height: 80.0),
          Row(
            children: [
              Expanded(
                child: BuildSubmit(
                  context,
                  buttonHandler: () {
                    RouterService.instance.router.pop();
                  },
                  radius: 10.0,
                  buttonBackgroundColor: const Color(0xFFE0E0E2),
                  buttonTextColor: const Color(0xFF84819D),
                  buttonText: '취소',
                ),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: BuildSubmit(
                  context,
                  buttonHandler: () {
                    ModalService.openPinCodeAuthenticationModal(
                      context,
                      onCompletedHandler: (pin) {
                        ModalService.openGeneralDialog(
                          context,
                          child: _buildWithdrawalResult(context),
                        );
                      },
                    );
                  },
                  radius: 10.0,
                  buttonBackgroundColor: const Color(0xFF0A043C),
                  buttonText: '전송하기',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWithdrawalModal(BuildContext context) {
    return DefaultLayout(
      leader: const BackButton(color: AppColors.white),
      appBarBackgroundColor: AppColors.backgroundPrimary,
      backgroundColor: AppColors.backgroundPrimary,
      customTitleWidget: const Text(
        '팬시 (FANC)',
        style: TextStyle(
          fontWeight: AppFonts.fontWeight900,
          fontSize: AppFonts.fontSize18,
          color: AppColors.white,
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            bottom: 90.0,
            left: 24.0,
            right: 24.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Balance : 130.9027 FANC',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13.0,
                      color: Color(0xFFB2E5F5),
                    ),
                  ),
                  const SizedBox(height: 48.0),
                  BuildPointCard(
                    borderRadius: 30.0,
                    backgroundColor: AppColors.white,
                    actionBackgroundColor: const Color(0xFFF2F1F8),
                    label: const Text(
                      '수량',
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
                            '10%',
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
                            '25%',
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
                            '50%',
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
                            '최대',
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
                  const SizedBox(height: 24.0),
                  Container(
                    height: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: BuildInput(
                        context,
                        labelText: '',
                        inputWidget: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: '전송 받을 지갑 주소',
                                    hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.0,
                                      color: Color(0xFF84819D),
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.0,
                                    color: AppColors.textBlack,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  ModalService.openGeneralDialog(
                                    context,
                                    child: QRScanModal(context),
                                    // child: Text('CameraViewModal'),
                                  );
                                },
                                icon: const Icon(Icons.qr_code_scanner),
                                color: AppColors.brandPrimary,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 290.0),
              BuildSubmit(
                context,
                buttonHandler: () {
                  ModalService.openBottomSheet(
                    context,
                    useRootNavigator: true,
                    radius: 40.0,
                    child: _buildWithdrawalConfirmModal(context),
                  );
                },
                buttonBackgroundColor: AppColors.brandPrimary,
                buttonText: '다음',
              ),
            ],
          ),
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

  Widget _buildHistory(BuildContext context) {
    return BuildHistory(
      onTap: () {
        ModalService.openBottomSheet(
          context,
          useRootNavigator: true,
          height: 412.0,
          radius: 40.0,
          child: _buildDetailModal(context),
        );
      },
    );
  }

  Widget _buildActions(
    BuildContext context, {
    required VoidCallback onTap,
  }) {
    return Wrap(
      spacing: 30.0,
      children: [
        GestureDetector(
          onTap: () {
            ModalService.openGeneralDialog(
              context,
              child: _buildWithdrawalModal(context),
            );
          },
          child: Wrap(
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10.0,
            children: [
              SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircleAvatar(
                  backgroundColor: AppColors.brandPrimary,
                  child: SvgPicture.asset(
                    'assets/wallet/withdrawal.svg',
                  ),
                ),
              ),
              const Text(
                '보내기',
                style: TextStyle(
                  fontWeight: AppFonts.fontWeight400,
                  fontSize: AppFonts.fontSize15,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            ModalService.openGeneralDialog(
              context,
              child: _buildDepositModal(context),
            );
          },
          child: Wrap(
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10.0,
            children: [
              SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircleAvatar(
                  backgroundColor: AppColors.brandPrimary,
                  child: SvgPicture.asset(
                    'assets/wallet/deposit.svg',
                  ),
                ),
              ),
              const Text(
                '받기',
                style: TextStyle(
                  fontWeight: AppFonts.fontWeight400,
                  fontSize: AppFonts.fontSize15,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
        Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10.0,
          children: [
            SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircleAvatar(
                backgroundColor: AppColors.brandPrimary,
                child: SvgPicture.asset(
                  'assets/wallet/conversion.svg',
                ),
              ),
            ),
            const Text(
              '전환하기',
              style: TextStyle(
                fontWeight: AppFonts.fontWeight400,
                fontSize: AppFonts.fontSize15,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBalance() {
    return const Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          'Balance',
          style: TextStyle(
            fontWeight: AppFonts.fontWeight500,
            fontSize: AppFonts.fontSize13,
            color: Color(0xFFB2E5F5),
          ),
        ),
        Text(
          '130.9027',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 30.0,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}

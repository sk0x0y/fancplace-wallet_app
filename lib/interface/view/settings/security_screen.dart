import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/components/buildInput.dart';
import 'package:wallet_app/components/buildSubmit.dart';
import 'package:wallet_app/interface/service/modal_service.dart';
import 'package:wallet_app/interface/service/router_service.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

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
        '보안',
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
            Wrap(
              runSpacing: 16.0,
              children: [
                _buildSecurityItem(
                  title: 'PIN 번호 등록',
                  useAction: true,
                ),
                _buildSecurityItem(
                  onTap: () {
                    ModalService.openPinCodeAuthenticationModal(
                      context,
                      leaderColor: const Color(0xFF0A043C),
                      appBarBackgroundColor: Colors.white,
                      backgroundColor: Colors.white,
                      keyPadTextColor: const Color(0xFF0A043C),
                      title: 'PIN 번호 변경',
                      labelWidget: const Column(
                        children: [
                          Text(
                            'PIN 번호 입력',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20.0,
                              color: Color(0xFF0A043C),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            '현재 사용중인 PIN 번호를 입력해주세요.',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.0,
                              color: Color(0xFF84819D),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  title: 'PIN 번호 변경',
                  useAction: true,
                ),
                _buildSecurityItem(
                  title: 'PIN 번호 찾기',
                  useAction: true,
                ),
                _buildSecurityItem(
                  title: '개인 키 확인',
                  useAction: true,
                ),
                _buildSecurityItem(
                  onTap: () {
                    ModalService.openGeneralDialog(
                      context,
                      child: DefaultLayout(
                        customTitleWidget: const Text(
                          '개인 키 등록',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0,
                            color: Color(0xFF0A043C),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32.0,
                            vertical: 42.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '개인 키\n등록하기',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 45.0,
                                  color: Color(0xFF0A043C),
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color:
                                      const Color.fromRGBO(219, 43, 29, 0.07),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 4.0),
                                        child: SvgPicture.asset(
                                          'assets/intro/caution.svg',
                                          width: 20.0,
                                          height: 20.0,
                                        ),
                                      ),
                                      const SizedBox(width: 12.0),
                                      const Expanded(
                                        child: Text(
                                          '개인 키는 다른 사람에게 공개하지 마세요. 개인 키를 가지고 있는 경우, 누구든 fanC Wallet 내에 존재하는 개인 자산을 통제할 수 있으며, 다른 곳에 전송할 수도 있습니다.',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.0,
                                            color: Color(0xFFDB2B1D),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 26.0),
                              BuildInput(
                                context,
                                labelText: '',
                                inputWidget: TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color(0xFFF2F1F8),
                                    hintText: '개인 키 입력',
                                    hintStyle: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0,
                                      color: Color(0xFF99989A),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 1.0,
                                        color: Color(0xFF523EE8),
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              BuildSubmit(
                                context,
                                buttonText: '확인',
                                buttonHandler: () {
                                  ModalService.openBottomSheet(
                                    context,
                                    useRootNavigator: true,
                                    radius: 40.0,
                                    child: const Padding(
                                      padding: EdgeInsets.all(40.0),
                                      child: Text(
                                        '바꾸지 마세요',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 32.0,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                actionWidgets: [
                                  TextButton(
                                    onPressed: () {
                                      ModalService.openBottomSheet(
                                        context,
                                        useRootNavigator: true,
                                        radius: 40.0,
                                        child: const Padding(
                                          padding: EdgeInsets.all(40.0),
                                          child: Text(
                                            '탈퇴하세요',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 32.0,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      '비밀번호를 잊으셨나요?',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Color(0xFF523EE8),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 100.0),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  title: '개인 키 등록',
                  useAction: true,
                ),
                _buildSecurityItem(
                  onTap: () {
                    ModalService.openRecoverPrivateKeyModal(context);
                  },
                  title: '개인 키 복구',
                  useAction: true,
                ),
                _buildSecurityItem(
                  title: '지갑 재발급',
                  useAction: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityItem({
    VoidCallback? onTap,
    required String title,
    bool useAction = false,
    String? actionText,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: const Color(0xFFE0E0E2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17.0,
                color: Color(0xFF0A043C),
              ),
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

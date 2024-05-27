import 'package:flutter/material.dart';
import 'package:wallet_app/components/buildInput.dart';
import 'package:wallet_app/components/buildSubmit.dart';
import 'package:wallet_app/interface/service/modal_service.dart';
import 'package:wallet_app/interface/service/router_service.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

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
        '비밀번호 변경',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 18.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 40.0),
        child: Column(
          children: [
            Wrap(
              runSpacing: 32.0,
              children: [
                BuildInput(
                  context,
                  labelText: '현재 비밀번호',
                  inputWidget: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFF2F1F8),
                      hintText: '비밀번호를 입력하세요',
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        color: Color(0xFF99989A),
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
                          color: Color(0xFF523EE8),
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                BuildInput(
                  context,
                  labelText: '새 비밀번호',
                  inputWidget: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.visibility_outlined,
                          color: Color(0xFF84819D),
                        ),
                        onPressed: () {},
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF2F1F8),
                      hintText: '신규 비밀번호를 입력하세요',
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        color: Color(0xFF99989A),
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
                          color: Color(0xFF523EE8),
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                BuildInput(
                  context,
                  labelText: '새 비밀번호 확인',
                  inputWidget: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.visibility_outlined,
                          color: Color(0xFF84819D),
                        ),
                        onPressed: () {},
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF2F1F8),
                      hintText: '비밀번호를 입력하세요',
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        color: Color(0xFF99989A),
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
                          color: Color(0xFF523EE8),
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 80.0),
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
          ],
        ),
      ),
    );
  }
}

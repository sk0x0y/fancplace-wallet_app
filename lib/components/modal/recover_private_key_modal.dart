import 'package:flutter/material.dart';
import 'package:wallet_app/interface/service/router_service.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class RecoverPrivateKeyModal extends StatelessWidget {
  const RecoverPrivateKeyModal({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      customTitleWidget: const Text(
        '개인 키 복구',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 18.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Wrap(
              direction: Axis.vertical,
              runSpacing: -4.0,
              children: [
                Text(
                  '복구 구문으로\n개인 키 확인',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 45.0,
                    color: Color(0xFF0A043C),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            const Text(
              '가입 시 이메일로 전송된 복구 구문을 순서대로 입력하세요. 구문 전체를 복사해서 첫 번째 입력 칸에 붙여넣으면 구문이 각 입력칸에 나뉘어 입력됩니다.',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
                color: Color(0xFF84819D),
              ),
            ),
            const SizedBox(height: 24.0),
            Flexible(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 8,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 18.0,
                  mainAxisSpacing: 18.0,
                  // NOTE: https://github.com/flutter/flutter/issues/55290
                  mainAxisExtent: 56.0,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xFFF2F1F8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Text(
                            '${(index + 1).toString()}. ',
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              color: Color(0xFF84819D),
                            ),
                          ),
                          const Text(
                            'Word',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              color: Color(0xFF523EE8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 56.0,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(52.0),
                        ),
                        backgroundColor: const Color(0xFFE0E0E2),
                      ),
                      child: const Text(
                        '입력 초기화',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                          color: Color(0xFF0A043C),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: SizedBox(
                    height: 56.0,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(52.0),
                        ),
                        backgroundColor: const Color(0xFF0A043C),
                      ),
                      child: TextButton(
                        onPressed: () {
                          RouterService.instance.router
                              .go('/assets/point/conversion');
                        },
                        child: const Text(
                          '확인',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

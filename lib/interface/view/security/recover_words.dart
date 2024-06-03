import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/constant/theme/theme_resources.dart';
import 'package:wallet_app/interface/service/router_service.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class RecoverWords extends StatelessWidget {
  const RecoverWords({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Wrap(
              direction: Axis.vertical,
              runSpacing: -4.0,
              children: [
                Text(
                  '개인키 복구를 위한',
                  style: TextStyle(
                    fontWeight: AppFonts.fontWeight400,
                    fontSize: AppFonts.fontSize18,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  '복구 구문 발급',
                  style: TextStyle(
                    fontWeight: AppFonts.fontWeight700,
                    fontSize: AppFonts.fontSize45,
                    color: AppColors.textBlack,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            const Text(
              '복구 구문이 생성되었습니다. 안정하게 보관해주세요.',
              style: TextStyle(
                fontWeight: AppFonts.fontWeight400,
                fontSize: AppFonts.fontSize14,
                color: Color(0xFF84819D),
              ),
            ),
            const SizedBox(height: 24.0),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color.fromRGBO(219, 43, 29, 0.07),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: SvgPicture.asset(
                        'assets/intro/caution.svg',
                        width: 20.0,
                        height: 20.0,
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    const Expanded(
                      child: Text(
                        'fanC wallet은 사용자의 복구 구문을 별도로 보관하지 않습니다. 복구 구문을 개인 메모장이나 종이, 클라우드 등 다양한 장소에 백업해 지갑을 보호하세요.',
                        style: TextStyle(
                          fontWeight: AppFonts.fontWeight400,
                          fontSize: AppFonts.fontSize14,
                          color: Color(0xFFDB2B1D),
                        ),
                      ),
                    )
                  ],
                ),
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
                      color: AppColors.backgroundSecondary,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Text(
                            '${(index + 1).toString()}. ',
                            style: const TextStyle(
                              fontWeight: AppFonts.fontWeight400,
                              fontSize: AppFonts.fontSize16,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const Text(
                            'Word',
                            style: TextStyle(
                              fontWeight: AppFonts.fontWeight400,
                              fontSize: AppFonts.fontSize16,
                              color: AppColors.textPrimary,
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
                        '복사하기',
                        style: TextStyle(
                          fontWeight: AppFonts.fontWeight500,
                          fontSize: AppFonts.fontSize15,
                          color: AppColors.textBlack,
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
                        backgroundColor: AppColors.backgroundPrimary,
                      ),
                      child: TextButton(
                        onPressed: () {
                          RouterService.instance.router.go('/exchange');
                        },
                        child: const Text(
                          '확인',
                          style: TextStyle(
                            fontWeight: AppFonts.fontWeight500,
                            fontSize: AppFonts.fontSize15,
                            color: AppColors.white,
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

import 'package:flutter/material.dart';
import 'package:wallet_app/interface/service/modal_service.dart';
import 'package:wallet_app/interface/service/router_service.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

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
        '이용약관 및 정책',
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
                _buildPolicyItem(
                  onTap: () {
                    ModalService.openGeneralDialog(
                      context,
                      child: const DefaultLayout(
                        customTitleWidget: Text(
                          '이용약관 및 정책',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.0,
                            vertical: 60.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '팬시 월렛 서비스 이용 약관',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25.0,
                                  color: Color(0xFF0A043C),
                                ),
                              ),
                              SizedBox(height: 16.0),
                              Text(
                                '업데이트 날짜: 2023.09.01',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.0,
                                  color: Color(0xFF84819D),
                                ),
                              ),
                              SizedBox(height: 36.0),
                              Text.rich(
                                TextSpan(
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color(0xFF0A043C),
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          'Class aptent taciti (torquent)\n\n',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(text: '''
sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam fermentum rhoncus lectus. Nam ut turpis sagittis, tincidunt dolor et, interdum libero. Praesent feugiat condimentum odio, nec egestas nulla congue vel. Duis commodo quam at ipsum egestas finibus. Fusce porta euismod varius. Mauris non purus dui. In congue, ante ac mollis vulputate, justo lectus ultrices massa, eget posuere neque enim eu quam. In ac dui ut orci accumsan ultrices. Ut rutrum commodo tempus. Sed non ultrices nunc, eget varius ante. Sed consequat nisl eu egestas fermentum. Duis cursus augue ac dui pulvinar, eu placerat est vestibulum.

Aenean mollis, dolor vel commodo eleifend, lacus nibh consequat turpis, nec condimentum turpis arcu vel nunc. Morbi porttitor enim vitae risus dapibus, id consectetur odio sollicitudin. Pellentesque fermentum tortor quis quam aliquam mattis. Vestibulum vitae urna massa. Vestibulum et orci fermentum, aliquet magna eget, aliquam nibh. In bibendum, arcu ut molestie maximus, massa nisi suscipit elit, sit amet gravida nisi mi at ipsum. Vivamus vehicula, nisi et porta mattis, erat mauris fermentum ex, et efficitur metus sapien non lacus. Vestibulum et molestie.

In bibendum, arcu ut molestie maximus, massa nisi suscipit elit, sit amet gravida nisi mi at ipsum. Vivamus vehicula, nisi et porta mattis, erat mauris fermentum ex, et efficitur metus sapien non lacus. Vestibulum et molestie.
                                    ''')
                                  ],
                                ),
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  title: '개인정보 보호정책',
                  useAction: true,
                ),
                _buildPolicyItem(
                  onTap: () {
                    ModalService.openGeneralDialog(
                      context,
                      child: const DefaultLayout(
                        customTitleWidget: Text(
                          '서비스 이용 약관',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.0,
                            vertical: 60.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '팬시 월렛 서비스 이용 약관',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25.0,
                                  color: Color(0xFF0A043C),
                                ),
                              ),
                              SizedBox(height: 16.0),
                              Text(
                                '업데이트 날짜: 2023.09.01',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.0,
                                  color: Color(0xFF84819D),
                                ),
                              ),
                              SizedBox(height: 36.0),
                              Text.rich(
                                TextSpan(
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color(0xFF0A043C),
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          'Class aptent taciti (torquent)\n\n',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(text: '''
sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam fermentum rhoncus lectus. Nam ut turpis sagittis, tincidunt dolor et, interdum libero. Praesent feugiat condimentum odio, nec egestas nulla congue vel. Duis commodo quam at ipsum egestas finibus. Fusce porta euismod varius. Mauris non purus dui. In congue, ante ac mollis vulputate, justo lectus ultrices massa, eget posuere neque enim eu quam. In ac dui ut orci accumsan ultrices. Ut rutrum commodo tempus. Sed non ultrices nunc, eget varius ante. Sed consequat nisl eu egestas fermentum. Duis cursus augue ac dui pulvinar, eu placerat est vestibulum.

Aenean mollis, dolor vel commodo eleifend, lacus nibh consequat turpis, nec condimentum turpis arcu vel nunc. Morbi porttitor enim vitae risus dapibus, id consectetur odio sollicitudin. Pellentesque fermentum tortor quis quam aliquam mattis. Vestibulum vitae urna massa. Vestibulum et orci fermentum, aliquet magna eget, aliquam nibh. In bibendum, arcu ut molestie maximus, massa nisi suscipit elit, sit amet gravida nisi mi at ipsum. Vivamus vehicula, nisi et porta mattis, erat mauris fermentum ex, et efficitur metus sapien non lacus. Vestibulum et molestie.

In bibendum, arcu ut molestie maximus, massa nisi suscipit elit, sit amet gravida nisi mi at ipsum. Vivamus vehicula, nisi et porta mattis, erat mauris fermentum ex, et efficitur metus sapien non lacus. Vestibulum et molestie.
                                    ''')
                                  ],
                                ),
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  title: '서비스 이용 약관',
                  useAction: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPolicyItem({
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

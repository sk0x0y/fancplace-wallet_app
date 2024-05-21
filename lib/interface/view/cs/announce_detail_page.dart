import 'package:flutter/material.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AnnounceDetailPage extends StatefulWidget {
  const AnnounceDetailPage({super.key});

  @override
  State<AnnounceDetailPage> createState() => _AnnounceDetailPageState();
}

class _AnnounceDetailPageState extends State<AnnounceDetailPage> {
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();

    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://www.naver.com'));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      customTitleWidget: const Text(
        '소식 및 공지사항',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 18.0,
        ),
      ),
      child: WebViewWidget(
        controller: _webViewController,
      ),
    );
  }
}

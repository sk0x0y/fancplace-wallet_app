import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class BuildWidgetFromHtml extends StatelessWidget {
  final String htmlContent;
  const BuildWidgetFromHtml({
    super.key,
    required this.htmlContent,
  });

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      htmlContent,
      customWidgetBuilder: (element) {
        // 이미지 태그인 경우
        if (element.localName == 'img') {
          final src = element.attributes['src'];
          return Image.network(
            src!,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          );
        } else {
          // 아닌 경우 좌우 padding
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: HtmlWidget(
              element.outerHtml,
            ),
          );
        }
      },
    );
  }
}

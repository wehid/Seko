import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'youtube_video_item.dart';

class HtmlView extends StatelessWidget {
  final String htmlCode;

  HtmlView(this.htmlCode);

  @override
  Widget build(BuildContext context) {

    return Html(
      data: htmlCode,
      customRender: {
        "iframe": (RenderContext ctx, Widget child) {
          String youtubeUrl = ctx.tree.element.attributes['src'];
          print(youtubeUrl);
          return YoutubeVideoItem(youtubeUrl);
        }
      },
      onLinkTap: (url, _, __, ___) {
        print(url);
        launch(url);
      },
    );
  }
}

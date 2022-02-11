import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'youtube_video_item.dart';
import '../PdfView/pdf_view.dart';

class HtmlView extends StatelessWidget {
  final String htmlCode;

  HtmlView(this.htmlCode);

  String _getFileExtension(String fileName) {
    return fileName.split('.').last;
  }

  bool _isUrlIsPdf(String urlLink) {
    bool isPdf = _getFileExtension(urlLink) == "pdf";
    print(isPdf);
    return isPdf;
  }

  bool _isUrlIsComplete(String url) {
    url.toLowerCase();
    return url.startsWith("http");
  }

  String _completeTheUrl(String url) {
    if (!_isUrlIsComplete(url)) {
      url = "https://szm.one${url}";
    }

    return url;
  }

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
        _isUrlIsPdf(url)
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PdfView(
                    _completeTheUrl(url),
                  ),
                ),
              )
            : launch(url);
      },
    );
  }
}

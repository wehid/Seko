import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

import '../../constants.dart';
import '../../GlobalWidgets/image_with_progress.dart';
import '../../Models/ObjectModels/book.dart';

class TextBookDetails extends StatelessWidget {
  final Book textBook;

  TextBookDetails(this.textBook);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("کتێب / تێکست"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Hero(
              tag: textBook.id + textBook.name,
              child: ImageWithProgress(textBook.smallImagePath),
            ),
          ),
          Expanded(
            flex: 7,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    textBook.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Html(data: textBook.brief),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "بەستەری دەرەکی",
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 17),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(textBook.link);
                            },
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "دابەزێنە",
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(textBook.filePath);
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

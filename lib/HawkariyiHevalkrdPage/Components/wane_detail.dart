import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Models/ObjectModels/wane.dart';
import '../../Models/ProviderModel/banki_wane_provider.dart';
import '../../constants.dart';

class WaneDetail extends StatelessWidget {
  static const routeName = '/wane-detail';

  Widget itemRow(String title, String description, bool isLink) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Expanded(
            child: isLink
                ? RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: description,
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(description);
                            },
                        ),
                      ]
                    )
                  )
                : Text(description),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Wane wane = Provider.of<BankiWaneProvider>(context).selectedWane;
    //todo:delete print
    print(wane.introduction);

    return Scaffold(
      appBar: customAppBar('بانکی وانە'),
      body: Column(
        children: [
          itemRow("بابەت: ", wane.title, false),
          itemRow("ناوی پۆلێن: ", wane.uploadGroupName, false),
          itemRow("لینک: ", wane.link, true),
          itemRow("ئادرەسی ڤیدیۆ: ", wane.videoUrl, true),
          itemRow("کورتە: ", wane.introduction, false),
          itemRow("ناوەڕۆک: ", wane.contents, false),
        ],
      ),
    );
  }
}

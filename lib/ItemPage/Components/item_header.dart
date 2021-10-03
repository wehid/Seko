import 'package:flutter/material.dart';

import '../../Models/ObjectModels/item.dart';

class ItemHeader extends StatelessWidget {
final Item item;

ItemHeader(this.item);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (item.picturePath.isNotEmpty)
            Container(
              width: 100,
              height: 100,
              color: Colors.orangeAccent,
              child: Image.network(
                item.picturePath,
                fit: BoxFit.fill,
                //show progress bar for image loading
                loadingBuilder:
                    (BuildContext context, Widget child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Stack(
                    children: [
                      Center(
                        child: Text(
                            '${loadingProgress.expectedTotalBytes != null ? ((loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes) * 100).toStringAsFixed(0) : null} %'),
                      ),
                      Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                              : null,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text(
                item.title,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

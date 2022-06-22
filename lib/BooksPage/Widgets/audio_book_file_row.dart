import 'package:flutter/material.dart';

import '../../Models/ObjectModels/audio_book_files.dart';

class AudioBookFilesRow extends StatelessWidget {
  final AudioBookFiles audioFiles;
  final int index;

  AudioBookFilesRow(this.audioFiles, this.index);

  Widget download() {
    return Row(
      children: [
        Text("داگرتن",
            style: _myStyle().copyWith(fontWeight: FontWeight.normal)),
        Icon(
          Icons.file_download_outlined,
          color: Colors.red,
        ),
      ],
    );
  }

  Widget lessening() {
    return Row(
      children: [
        Text("گوێگرتن",
            style: _myStyle().copyWith(fontWeight: FontWeight.normal)),
        Icon(
          Icons.headphones_rounded,
          color: Colors.blueAccent,
        ),
      ],
    );
  }

  TextStyle _myStyle() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: 18,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: Row(
        children: [
          Text(
            "${index + 1} - ${audioFiles.name}",
            style: _myStyle(),
          ),
          const Spacer(),
          download(),
          const Spacer(),
          lessening(),
        ],
      ),
    );
  }
}

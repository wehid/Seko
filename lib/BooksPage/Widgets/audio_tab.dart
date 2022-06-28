import 'package:flutter/material.dart';

import 'audio_book_file_row.dart';
import '../../GlobalWidgets/sound_player.dart';
import '../../Models/ObjectModels/audio_book_files.dart';


// TODO: this widget has a bug. just in load or first audio url that set to
// sound player, can played.

class AudioTab extends StatefulWidget {
  final List<AudioBookFiles> audioFiles;
  AudioTab(this.audioFiles);

  @override
  _AudioTabState createState() => _AudioTabState();
}

class _AudioTabState extends State<AudioTab> {
  static const FIRST_INDEX = 0;
  int _selectedIndex = FIRST_INDEX;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
            border: Border.all(),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              Text(
                widget.audioFiles[_selectedIndex].name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SoundPlayer(widget.audioFiles[_selectedIndex].filePath),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: widget.audioFiles.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: AudioBookFilesRow(
                    widget.audioFiles[index],
                    index,
                  ),
                );
              }),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SoundPlayer extends StatefulWidget {
  final String audioURL;

  SoundPlayer(this.audioURL);

  @override
  State<SoundPlayer> createState() => _SoundPlayerState();
}

class _SoundPlayerState extends State<SoundPlayer> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _audioPlayer.setUrl(widget.audioURL);

    // Listten to state: play, puse, stop
    _audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        _isPlaying = event == PlayerState.PLAYING;
      });
    });

    // listten to audio duration
    _audioPlayer.onDurationChanged.listen((audioDuration) {
      setState(() {
        duration = audioDuration;
      });
    });

    // listten to audio position
    _audioPlayer.onAudioPositionChanged.listen((audioPosition) {
      setState(() {
        position = audioPosition;
      });
    });
    super.initState();
  }

  Widget playButton() {
    return IconButton(
      icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
      iconSize: 35,
      onPressed: () async {
        if (_isPlaying) {
          await _audioPlayer.pause();
        } else {
          await _audioPlayer.resume();
        }
      },
    );
  }

  Widget showTime(Duration time) {
    String standardTime = time.toString().split(".").first;
    return Text(standardTime);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Slider(
          min: 0,
          max: duration.inSeconds.toDouble(),
          value: position.inSeconds.toDouble(),
          onChanged: (value) async {
            final position = Duration(seconds: value.toInt());
            await _audioPlayer.seek(position);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              showTime(position),
              playButton(),
              showTime((duration - position)),
            ],
          ),
        )
      ],
    );
  }
}

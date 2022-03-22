import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'controls_overlay_widget.dart';

class VideoWidget extends StatefulWidget {
  String url;

  VideoWidget({Key? key, required this.url}) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;
  bool startedPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url,
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Future<bool> started() async {
    await _controller.initialize();
    await _controller.play();
    startedPlaying = true;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: started(),
        builder: (context, snap) {
          if (snap.hasData) {
            return Stack(alignment: Alignment.bottomCenter, children: [
              SizedBox.expand(
                  child: FittedBox(
                      fit: BoxFit.contain,
                      child: SizedBox(
                          width: _controller.value.size.width,
                          height: _controller.value.size.height,
                          child: VideoPlayer(_controller)))),
              ControlsOverlay(controller: _controller),
              VideoProgressIndicator(_controller, allowScrubbing: false, padding: const EdgeInsets.only(bottom: 16),),
            ]);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

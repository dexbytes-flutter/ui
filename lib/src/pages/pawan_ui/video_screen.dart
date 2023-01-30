import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'lottie_screen.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  // video controller
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset('assets/videos/laptop_video.mp4');
  bool isVideoEnd = false;

  @override
  void initState() {
    _videoPlayerController
      ..initialize().then((_) {
        setState(() {});
      })
      ..setVolume(0.0);
    // Function for play video
    _playVideo();
    super.initState();
  }

  void _playVideo() {
    // play video
    _videoPlayerController.play();
    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.isInitialized &&
          _videoPlayerController.value.isPlaying) {
        if (!isVideoEnd &&
            _videoPlayerController.value.position >
                const Duration(hours: 0, minutes: 0, seconds: 9)) {
          isVideoEnd = true;
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LottieScreen()));
        }
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: _videoPlayerController.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController),
                )
              : const SizedBox()),
    );
  }
}

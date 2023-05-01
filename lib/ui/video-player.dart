import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      'https://cdn.muse.ai/u/Bhkfhyt/b47a65b9351e38e6eb86780b09f3e9f9b8e9d795f1af5111f2f34a7f31f9e157/data?v=23:1682933375',
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use
            // the data it provides to limit the aspect ratio of the video.
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              // Use the VideoPlayer widget to display the video.
              child: VideoPlayer(_controller),
            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown.
          setState(() {
            // If the video is playing, pause it.
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // If the video is paused, play it.
              _controller.play();
            }
          });
        },
        // Display the correct icon depending on the state of the player.
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}

class VideoPlayerExample extends StatefulWidget {
  const VideoPlayerExample({Key? key}) : super(key: key);

  @override
  State<VideoPlayerExample> createState() => _VideoPlayerExampleState();
}

class _VideoPlayerExampleState extends State<VideoPlayerExample> {
  late VideoPlayerController controller;
  // String videoUrl =
  //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';
  // Future<ClosedCaptionFile> _loadCaptions() async {
  //   final String fileContents = await DefaultAssetBundle.of(context)
  //       .loadString('assets/bumble_bee_captions.vtt');
  //   return WebVTTCaptionFile(
  //       fileContents); // For vtt files, use WebVTTCaptionFile
  // }

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(
      'https://cdn.muse.ai/u/hpp6aih/36c1e1ccdcb640ccf0cf5ad07f526b016785590b178f8a1cb4bfeb210ca47059/data?v=25:1682940996',
      // 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      // closedCaptionFile: _loadCaptions(),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    controller.addListener(() {
      setState(() {});
    });
    controller.setLooping(true);
    controller.initialize();
  }
  // @override
  // void initState() {
  //   super.initState();
  //   controller = VideoPlayerController.network(videoUrl);
  //
  //   controller.addListener(() {
  //     setState(() {});
  //   });
  //   controller.setLooping(true);
  //   controller.play();
  // }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(controller),
                  ClosedCaption(text: controller.value.caption.text),
                  // _ControlsOverlay(controller: controller),
                  // VideoProgressIndicator(controller, allowScrubbing: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    //   Scaffold(
    //   body: Center(
    //     child: InkWell(
    //       onTap: () {
    //         if (controller.value.isPlaying) {
    //           controller.pause();
    //         } else {
    //           controller.play();
    //         }
    //       },
    //       child: AspectRatio(
    //         aspectRatio: controller.value.aspectRatio,
    //         child: VideoPlayer(controller),
    //       ),
    //     ),
    //   ),
    // );
  }
}

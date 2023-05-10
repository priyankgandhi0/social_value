import 'dart:async';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';
import 'package:video_player/video_player.dart';

import '../dashboard_screen/dashboard_contorller.dart';

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({
    Key? key,
  }) : super(key: key);

  // final String image;
  // final String? url;
  final dynamic data = Get.arguments;

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final DashboardController ctrl = Get.put(DashboardController());
  // late VideoPlayerController controller;
  // late Future<void> initializeVideoPlayerFuture;
  // bool visible = false;
  // @override
  // void initState() {
  //   super.initState();
  //   controller = VideoPlayerController.network(widget.data["url"]);
  //   controller.initialize().then((_) {
  //     controller.setLooping(true);
  //     Timer(const Duration(milliseconds: 100), () {
  //       setState(() {
  //         controller.play();
  //         visible = true;
  //       });
  //     });
  //   });
  //   initializeVideoPlayerFuture = controller.initialize();
  // }
  //
  // @override
  // void dispose() {
  //   controller.dispose();
  //   // chewieController.dispose();
  //   super.dispose();
  // }
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(widget.data["url"]),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<DashboardController>(
          initState: (state) {},
          builder: (ctrl) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  250.0.addHSpace(),
                  Container(
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    height: 200,
                    width: double.infinity,
                    color: Colors.transparent,
                    child: FlickVideoPlayer(
                      flickManager: flickManager,
                      flickVideoWithControls: FlickVideoWithControls(
                        videoFit: BoxFit.fitHeight,
                        controls: FlickPortraitControls(
                          progressBarSettings: FlickProgressBarSettings(
                            playedColor: Colors.red,
                            handleRadius: 5,
                            bufferedColor: Colors.white,
                            handleColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 0),
                          ),
                        ),
                        iconThemeData: const IconThemeData(color: Colors.black),
                        textStyle: const TextStyle(color: Colors.black),
                      ),
                    ),
                    // child: Stack(
                    //   children: [
                    //     FutureBuilder(
                    //       future: initializeVideoPlayerFuture,
                    //       builder: (context, snapshot) {
                    //         if (snapshot.connectionState ==
                    //             ConnectionState.done) {
                    //           return Stack(
                    //             children: [
                    //               AspectRatio(
                    //                 aspectRatio: controller.value.aspectRatio,
                    //                 child: VideoPlayer(controller),
                    //               ),
                    //               Align(
                    //                 alignment: const Alignment(1.1, 1),
                    //                 child: VideoProgressIndicator(
                    //                   controller,
                    //                   allowScrubbing: true,
                    //                   colors: const VideoProgressColors(
                    //                     backgroundColor: Colors.white,
                    //                     // bufferedColor: Colors.yellow,
                    //                     playedColor: Colors.red,
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           );
                    //         } else {
                    //           return const Center(
                    //             child: CircularProgressIndicator(),
                    //           );
                    //         }
                    //       },
                    //     ),
                    //     Center(
                    //       child: IconButton(
                    //           onPressed: () {
                    //             setState(() {
                    //               if (controller.value.isPlaying) {
                    //                 controller.pause();
                    //               } else {
                    //                 controller.play();
                    //               }
                    //             });
                    //           },
                    //           icon: controller.value.isPlaying
                    //               ? const Icon(
                    //                   Icons.pause,
                    //                   color: Colors.black,
                    //                 )
                    //               : const Icon(Icons.play_arrow_rounded,
                    //                   color: Colors.black)),
                    //     )
                    //   ],
                    // )
                  ),
                ],
              ),
            );
          }),
    );
  }
}

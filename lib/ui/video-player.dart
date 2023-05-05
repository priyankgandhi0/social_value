import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';
import 'package:video_player/video_player.dart';

import 'main/dashboard_screen/dashboard_contorller.dart';

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
  late VideoPlayerController controller;
  // late ChewieController chewieController;
  late Future<void> initializeVideoPlayerFuture;
  bool visible = false;
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.data["url"]);
    // ..initialize().then((_) => setState(() {}));
    // ..addListener(() {})
    // ..setLooping(false);
    controller.initialize().then((_) {
      controller.setLooping(true);
      Timer(const Duration(milliseconds: 100), () {
        setState(() {
          controller.play();
          visible = true;
        });
      });
    });
    initializeVideoPlayerFuture = controller.initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    // chewieController.dispose();
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
                      child: Stack(
                        children: [
                          FutureBuilder(
                            future: initializeVideoPlayerFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return AspectRatio(
                                  aspectRatio: controller.value.aspectRatio,
                                  child: VideoPlayer(controller),
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                          Center(
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (controller.value.isPlaying) {
                                      controller.pause();
                                    } else {
                                      controller.play();
                                    }
                                  });
                                },
                                icon: controller.value.isPlaying
                                    ? const Icon(
                                        Icons.pause,
                                        color: Colors.black,
                                      )
                                    : const Icon(Icons.play_arrow_rounded,
                                        color: Colors.black)),
                          )
                        ],
                      )
                      // FutureBuilder(
                      //   future: initializeVideoPlayerFuture,
                      //   builder: (context, snapshot) {
                      //     if (snapshot.connectionState == ConnectionState.done) {
                      //       return Chewie(
                      //         key: PageStorageKey(widget.data[0]["url"]),
                      //         controller: ChewieController(
                      //           videoPlayerController: controller,
                      //           aspectRatio: 1.7 / 1,
                      //           autoInitialize: true,
                      //           looping: false,
                      //           autoPlay: false,
                      //           errorBuilder: (context, errorMessage) {
                      //             return Center(
                      //               child: Text(
                      //                 errorMessage,
                      //                 style: const TextStyle(color: Colors.white),
                      //               ),
                      //             );
                      //           },
                      //         ),
                      //       );
                      //     } else {
                      //       return const Center(
                      //         child: CircularProgressIndicator(),
                      //       );
                      //     }
                      //   },
                      // ),
                      ),
                ],
              ),
            );
          }),
    );
  }
}

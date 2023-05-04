import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';
import 'package:video_player/video_player.dart';

import 'main/dashboard_screen/dashboard_contorller.dart';

class VideoPlayer extends StatefulWidget {
  VideoPlayer({
    Key? key,
  }) : super(key: key);

  // final String image;
  // final String? url;
  dynamic data = Get.arguments;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  final DashboardController ctrl = Get.put(DashboardController());
  late VideoPlayerController controller;
  late ChewieController chewieController;
  late Future<void> initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.network(widget.data[0]["url"])
      ..initialize().then((_) => setState(() {}))
      ..addListener(() {})
      ..setLooping(true);

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
      body: GetBuilder<DashboardController>(initState: (state) {
        // Future.delayed(Duration.zero)
        //     .then((value) => ctrl.getVideoUrl(widget.videoId!));
      }, builder: (ctrl) {
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
              150.0.addHSpace(),
              Container(
                margin: const EdgeInsets.only(right: 10, left: 10),
                height: 300,
                width: double.infinity,
                color: Colors.transparent,
                child: FutureBuilder(
                  future: initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Chewie(
                          key: PageStorageKey(widget.data[0]["url"]),
                          controller: ChewieController(
                            videoPlayerController: controller,
                            aspectRatio: 1.7 / 1,
                            autoInitialize: true,
                            looping: false,
                            autoPlay: false,
                            // errorBuilder: (context, errorMessage) {
                            //   return Center(
                            //     child: Text(
                            //       errorMessage,
                            //       style: const TextStyle(color: Colors.white),
                            //     ),
                            //   );
                            // },
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../api/api_extension.dart';
import '../../../models/dashboard_video_model.dart';
import '../../../network/dashboard_repo.dart';
import '../../../theme/app_helpers.dart';
import 'package:http/http.dart' as http;

class DashboardController extends GetxController {
  RxBool isLoading = false.obs;
  List<VideoData> getVideo = [];

  getVideos(String ids) async {
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading.value = true;
    dynamic result;
    result = await DashboardRepo.instance.getVideos(ids: ids);
    try {
      print("data123${json.decode(result)}");
      var data = videoDataFromJson(result);

      getVideo = data;
      await setVideoUrls();
      print("data----${getVideo[0].videoUrl}");
    } catch (e) {
      print(e);
      showAppSnackBar(errorText);
    }
    isLoading.value = false;
    update();
  }

  Future setVideoUrls() async {
    for (int i = 0; i < getVideo.length; i++) {
      getVideo[i].videoUrl = await getVideoUrl(getVideo[i].museVideoId);
    }
  }

  Future<String> getVideoUrl(
    String videoId,
  ) async {
    const apiKey =
        "64mRkQ1EZ1w0hv0ecvLZqcER63d035bc"; // Replace with your Muse.ai API key
    final apiUrl = 'https://muse.ai/api/files/videos/$videoId';
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      String videoUrl = json['url'];
      print("videoUrl----$videoUrl");
      return videoUrl;
    } else {
      throw Exception('Failed to get video URL');
    }
  }
}

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import '../../../api/api_extension.dart';
import '../../../models/dashboard_video_model.dart';
import '../../../network/dashboard_repo.dart';
import '../../../theme/app_helpers.dart';
import 'package:http/http.dart' as http;

class DashboardController extends GetxController {
  RxBool isLoading = false.obs;
  bool isLoadingVideo = false;
  List<VideoData> getVideo = [];

  getVideos(String ids) async {
    // if (getVideo.isNotEmpty) return;
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading.value = true;
    isLoadingVideo = true;
    dynamic result;
    result = await DashboardRepo.instance.getVideos(
      ids: ids,
    );
    try {
      var data = videoDataFromJson(result);
      getVideo = data;
      await setVideoUrls();
    } catch (e) {
      log(e.toString());
      showAppSnackBar(errorText);
    }
    isLoadingVideo = false;
    isLoading.value = false;
    update();
  }

  Future setVideoUrls() async {
    for (int i = 0; i < getVideo.length; i++) {
      getVideo[i].videoUrl = await getVideoUrl(getVideo[i].museVideoId);
      getVideo[i].thumbnail =
          await getThumbnail(getVideo[i].videoUrl, getVideo[i].id);
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

      return videoUrl;
    } else {
      throw Exception('Failed to get video URL');
    }
  }
}

Future<String?> _findLocalPath() async {
  String? externalStorageDirPath;
  if (Platform.isAndroid) {
    try {
      final directory = await getExternalStorageDirectory();
      externalStorageDirPath = directory?.path;
    } catch (e) {
      final directory = await getExternalStorageDirectory();
      externalStorageDirPath = directory?.path;
    }
  } else if (Platform.isIOS) {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      try {
        // final directory = await getApplicationDocumentsDirectory();
        // externalStorageDirPath = directory.path;
        externalStorageDirPath =
            (await getApplicationDocumentsDirectory()).absolute.path;
        print("==$externalStorageDirPath");
      } catch (e) {
        // final directory = await getApplicationDocumentsDirectory();
        // externalStorageDirPath = directory.path;
        externalStorageDirPath =
            (await getApplicationDocumentsDirectory()).absolute.path;
        print(e);
      }
    } else {
      print("==not have permission");
    }
  }
  return externalStorageDirPath;
}

Future<String?> _prepareSaveDir(String id) async {
  String fileName = "/SocialValue$id";
  String path = (await _findLocalPath())!;
  path = path + fileName;
  final savedDir = Directory(path);
  final hasExisted = savedDir.existsSync();
  if (!hasExisted) {
    await savedDir.create();
  }
  return File(path).path;
}

Future getThumbnail(String videoUrl, String id) async {
  return await VideoThumbnail.thumbnailFile(
    video: videoUrl,
    thumbnailPath: (await _prepareSaveDir(id)),
    imageFormat: ImageFormat.JPEG,
    maxHeight: 100,
    quality: 100,
    maxWidth: 150,
  );
}

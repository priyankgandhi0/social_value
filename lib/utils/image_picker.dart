import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class PickFile {
  void openImageChooser(
      {required BuildContext context, required Function onImageChose}) {
    Platform.isIOS
        ? showModalBottomSheet(
            context: context,
            builder: (context) {
              return SafeArea(
                child: Wrap(
                  children: [
                    ListTile(
                      title: const Text("Gallery"),
                      leading: const Icon(Icons.photo_library),
                      onTap: () {
                        imageFormGallery(
                            context: context, onImageChose: onImageChose);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: const Text("Camera"),
                      leading: const Icon(Icons.photo_camera),
                      onTap: () {
                        imageFromCamera(
                            context: context, onImageChose: onImageChose);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            },
          )
        : showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                title: const Text("Select Image"),
                children: [
                  ListTile(
                    title: const Text("Photo Library"),
                    leading: const Icon(Icons.photo_library),
                    onTap: () {
                      imageFormGallery(
                          context: context, onImageChose: onImageChose);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text("Camera"),
                    leading: const Icon(Icons.photo_camera),
                    onTap: () {
                      imageFromCamera(
                          context: context, onImageChose: onImageChose);
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
  }

  void imageFormGallery(
      {required BuildContext context, required Function onImageChose}) async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      final pickedFile = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowCompression: true,
      );
      if (pickedFile != null) {
        // controller.addImage(File(pickedFile.files.single.path!));
        onImageChose(File(pickedFile.files.single.path!));
        if (kDebugMode) {
          print(pickedFile.files.single.path);
        }
      }
      return;
    } else if (status.isDenied) {
      Get.showSnackbar(
        GetSnackBar(
            message: "Without this permission app can not change  picture.",
            mainButton: Platform.isIOS
                ? SnackBarAction(
                    label: "Settings",
                    // textColor: Theme.of(context).accentColor,
                    onPressed: () {
                      openAppSettings();
                    },
                  )
                : null,
            duration: const Duration(seconds: 3)),
      );
      return;
    } else if (status.isPermanentlyDenied) {
      Get.showSnackbar(
        GetSnackBar(
          message:
              "To access this feature please grant permission from settings.",
          mainButton: SnackBarAction(
            label: "Settings",
            textColor: Colors.amber,
            onPressed: () {
              openAppSettings();
            },
          ),
          duration: const Duration(seconds: 3),
        ),
      );
      return;
    }
  }

  void imageFromCamera(
      {required BuildContext context, required Function onImageChose}) async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 50,

      );
      if (pickedFile != null) {
        // controller.addImage(File(pickedFile.path));
        onImageChose(File(pickedFile.path));
      }
      return;
    } else if (status.isDenied) {
      Get.showSnackbar(
        GetSnackBar(
            message:
                "Without this permission app can not change profile picture.",
            mainButton: Platform.isIOS
                ? SnackBarAction(
                    label: "Settings",
                    // textColor: Theme.of(context).accentColor,
                    onPressed: () {
                      openAppSettings();
                    },
                  )
                : SnackBarAction(
                    label: "Settings",
                    // textColor: Theme.of(context).accentColor,
                    onPressed: () {
                      openAppSettings();
                    },
                  ),
            duration: const Duration(seconds: 3)),
      );
      return;
    }  else if (status.isPermanentlyDenied) {
      Get.showSnackbar(
        GetSnackBar(
          message:
          "To access this feature please grant permission from settings.",
          mainButton: SnackBarAction(
            label: "Settings",
            textColor: Colors.amber,
            onPressed: () {
              openAppSettings();
            },
          ),
          duration: const Duration(seconds: 3),
        ),
      );
      return;
    }
  }

  void pickFileFormStorage(
      {required BuildContext context, required Function onFileChose}) async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      final pickedFile = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['doc', 'pdf'],
      );
      if (pickedFile != null) {
        // controller.addImage(File(pickedFile.files.single.path!));
        onFileChose(File(pickedFile.files.single.path!));
        if (kDebugMode) {
          print(pickedFile.files.single.path);
        }
      }
      return;
    } else if (status.isDenied) {
      Get.showSnackbar(
        GetSnackBar(
            message: "Without this permission app can not change  picture.",
            mainButton: Platform.isIOS
                ? SnackBarAction(
                    label: "Settings",
                    // textColor: Theme.of(context).accentColor,
                    onPressed: () {
                      openAppSettings();
                    },
                  )
                : null,
            duration: const Duration(seconds: 3)),
      );
      return;
    } else if (status.isPermanentlyDenied) {
      Get.showSnackbar(
        GetSnackBar(
          message:
              "To access this feature please grant permission from settings.",
          mainButton: SnackBarAction(
            label: "Settings",
            textColor: Colors.amber,
            onPressed: () {
              openAppSettings();
            },
          ),
          duration: const Duration(seconds: 3),
        ),
      );
      return;
    }
  }
}

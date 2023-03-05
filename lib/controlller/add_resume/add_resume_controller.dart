import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddResumeController extends GetxController {
  Rx<TextEditingController> name = TextEditingController(text: "").obs;
  Rx<TextEditingController> email = TextEditingController(text: "").obs;
  Rx<TextEditingController> mobileNumber = TextEditingController(text: "").obs;
  Rx<TextEditingController> address = TextEditingController(text: "").obs;
  Rx<TextEditingController> role = TextEditingController(text: "").obs;
  Rx<TextEditingController> summary = TextEditingController(text: "").obs;

  RxString nameError = "".obs;
  RxString emailError = "".obs;
  RxString mobileNumberError = "".obs;
  RxString addressError = "".obs;
  RxString roleError = "".obs;
  RxString summaryError = "".obs;

  Rx<File> profileImage = File("").obs;
  // Future picImage(bool fromGallery) async {
  //   XFile? pickedFile;
  //   try {
  //     pickedFile = await ImagePicker().pickImage(
  //       source: fromGallery ? ImageSource.gallery : ImageSource.camera,
  //       maxHeight: 500,
  //       maxWidth: 500,
  //     );
  //   } catch (e) {
  //     log(e.toString());
  //   }
  //   if (pickedFile != null) {
  //     CroppedFile? croppedFile = await ImageCropper().cropImage(
  //         sourcePath: pickedFile.path,
  //         aspectRatio: const CropAspectRatio(ratioX: 300, ratioY: 300),
  //         compressQuality: 50,
  //         uiSettings: [
  //           AndroidUiSettings(
  //             toolbarTitle: "edit".tr,
  //             statusBarColor: Colors.black,
  //             toolbarColor: Colors.blue,
  //             toolbarWidgetColor: Colors.white,
  //             initAspectRatio: CropAspectRatioPreset.square,
  //             lockAspectRatio: true,
  //           ),
  //           IOSUiSettings(
  //             title: "edit".tr,
  //           ),
  //         ]);
  //     if (croppedFile != null) {
  //       profileImage.value = File(croppedFile.path);
  //     }
  //   } else {
  //     return;
  //   }
  // }
}

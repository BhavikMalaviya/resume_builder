import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:resume_builder/model/resume_model.dart';
import 'package:resume_builder/network/network_info.dart';
import 'package:resume_builder/utils/globle.dart';
import 'package:resume_builder/utils/overlay_loading.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  List<ResumeModel> listOfResumes = <ResumeModel>[].obs;
  RxBool connection = false.obs;

  @override
  void onInit() {
    getResumeAPI();
    super.onInit();
  }

  Future<void> getResumeAPI() async {
    connection.value =
        await NetworkInfo(connectivity: Connectivity()).isConnected();
    if (connection.value) {
      listOfResumes.clear();

      try {
        isLoading.value = true;
        QuerySnapshot<Map<String, dynamic>> data =
            await FirebaseFirestore.instance.collection("resume").get();

        for (var e in data.docs) {
          listOfResumes.add(ResumeModel.fromJson(e.data()));
        }
        isLoading.value = false;
      } catch (e) {
        log(e.toString());
      }
    } else {
      toast("Oops! No internet conncetion");
    }
  }

  deleteResume(String id, index) async {
    LoadingOverlay.of(Get.context!).show();
    await FirebaseFirestore.instance.collection("resume").doc(id).delete();
    listOfResumes.removeAt(index);
    Get.back();
    LoadingOverlay.of(Get.context!).hide();
  }
}

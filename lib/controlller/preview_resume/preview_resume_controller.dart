import 'package:get/get.dart';
import 'package:resume_builder/model/resume_model.dart';

class PreviewResumeController extends GetxController {
  ResumeModel? resumeModel;
  @override
  void onInit() {
    resumeModel = Get.arguments;
    super.onInit();
  }
}

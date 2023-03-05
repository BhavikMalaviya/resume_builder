import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_builder/controlller/preview_resume/preview_resume_controller.dart';

class PreviewResumeScreen extends StatelessWidget {
  PreviewResumeScreen({super.key});
  final PreviewResumeController _con = Get.put(PreviewResumeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [],
      ),
    );
  }
}

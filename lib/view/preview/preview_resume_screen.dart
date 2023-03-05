import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_builder/controlller/preview_resume/preview_resume_controller.dart';
import 'package:resume_builder/utils/app_colors.dart';
import 'package:resume_builder/utils/sizebox.dart';

class PreviewResumeScreen extends StatelessWidget {
  PreviewResumeScreen({super.key});
  final PreviewResumeController _con = Get.put(PreviewResumeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: const Text("Preview"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    _con.resumeModel?.profile ?? "",
                  ),
                ),
              ),
              wSizedBox10,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        _con.resumeModel?.firstName ?? "",
                        style: const TextStyle(fontSize: 24),
                      ),
                      wSizedBox10,
                      Text(
                        _con.resumeModel?.lastName ?? "",
                        style: const TextStyle(fontSize: 24),
                      )
                    ],
                  ),
                  Text(
                    _con.resumeModel?.email ?? "",
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    _con.resumeModel?.mobile ?? "",
                    style: const TextStyle(fontSize: 18),
                  )
                ],
              )
            ],
          ),
          hSizedBox30,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Objective",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      _con.resumeModel?.objective ?? "",
                      style: const TextStyle(fontSize: 18),
                    ),
                    hSizedBox36,
                    const Text(
                      "SKILLS",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    ...List.generate(
                      _con.resumeModel?.skills.length ?? 0,
                      (index) => Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        width: double.infinity,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.greyColor.withOpacity(0.2),
                        ),
                        child: Text(_con.resumeModel?.skills[index] ?? ''),
                      ),
                    ),
                  ],
                ),
              ),
              wSizedBox10,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Education",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    ...List.generate(
                      _con.resumeModel?.education.length ?? 0,
                      (index) => Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        width: double.infinity,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.greyColor.withOpacity(0.2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_con.resumeModel?.education[index]
                                    .courseDegree ??
                                ''),
                            Text(_con.resumeModel?.education[index]
                                    .schoolUniversity ??
                                ''),
                            Text(
                                _con.resumeModel?.education[index].gradeScore ??
                                    ''),
                            Text(_con.resumeModel?.education[index].year ?? ''),
                          ],
                        ),
                      ),
                    ),
                    hSizedBox16,
                    const Text(
                      "EXPRIENCE",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    ...List.generate(
                      _con.resumeModel?.experience.length ?? 0,
                      (index) => Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        width: double.infinity,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.greyColor.withOpacity(0.2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_con.resumeModel?.experience[index]
                                    .companyName ??
                                ''),
                            Text(_con.resumeModel?.experience[index].jobTitle ??
                                ''),
                            Text(
                                _con.resumeModel?.experience[index].startDate ??
                                    ''),
                            Text(_con.resumeModel?.experience[index].endDate ??
                                ''),
                          ],
                        ),
                      ),
                    ),
                    const Text(
                      "PROJECT",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    ...List.generate(
                      _con.resumeModel?.project.length ?? 0,
                      (index) => Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        width: double.infinity,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.greyColor.withOpacity(0.2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_con.resumeModel?.project[index].title ?? ''),
                            Text(_con.resumeModel?.project[index].desc ?? ''),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Text(_con.resumeModel?.reference ?? ''),
        ],
      ),
    );
  }
}

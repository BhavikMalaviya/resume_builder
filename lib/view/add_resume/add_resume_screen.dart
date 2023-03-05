import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:resume_builder/controlller/add_resume/add_resume_controller.dart';
import 'package:resume_builder/model/education_model.dart';
import 'package:resume_builder/model/exprience_model.dart';
import 'package:resume_builder/model/project_model.dart';
import 'package:resume_builder/utils/app_colors.dart';
import 'package:resume_builder/utils/globle.dart';
import 'package:resume_builder/utils/sizebox.dart';
import 'package:resume_builder/widgets/app_button.dart';
import 'package:resume_builder/widgets/app_text_field.dart';

class AddResumeScreen extends StatelessWidget {
  AddResumeScreen({Key? key}) : super(key: key);
  final AddResumeController _con = Get.put(AddResumeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: const Text("Add Details"),
      ),
      body: Obx(
        () => ListView(
          padding: const EdgeInsets.all(15),
          children: [
            hSizedBox10,
            Center(
              child: GestureDetector(
                  onTap: () => _con.selectionOfImage(context),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.accentColor.withOpacity(0.2),
                        radius: 70,
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: AppColors.accentColor.withOpacity(0.5),
                        ),
                      ),
                      const CircleAvatar(
                        backgroundColor: AppColors.accentColor,
                        radius: 18,
                        child: Icon(
                          Icons.edit,
                          color: AppColors.whiteColor,
                          size: 18,
                        ),
                      )
                    ],
                  )
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     image: _con.isEdit == true &&
                  //             (_con.profileImage.value.path.isEmpty ||
                  //                 _con.profileImage.value.path.toString() ==
                  //                     "null")
                  //         ? NetworkImage(_con.data.profileUrl ?? "")
                  //         : _con.profileImage.value.path.isEmpty
                  //             ? AssetImage(AppImage.defaultImage)
                  //             : FileImage(_con.profileImage.value)
                  //                 as ImageProvider,
                  //   ),
                  // ),

                  ),
            ),
            hSizedBox30,
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    hintText: "First Name",
                    controller: _con.firstNameController,
                    errorMessage: _con.firstNameError,
                  ),
                ),
                wSizedBox10,
                Expanded(
                  child: AppTextField(
                    hintText: "Last Name",
                    controller: _con.lastNameController,
                    errorMessage: _con.firstNameError,
                  ),
                ),
              ],
            ),
            AppTextField(
              hintText: "Email",
              controller: _con.emailController,
              errorMessage: _con.emailError,
              keyboardType: TextInputType.emailAddress,
            ),
            AppTextField(
              hintText: "Mobile Number",
              controller: _con.mobileNumberController,
              errorMessage: _con.mobileNumberError,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              keyboardType: TextInputType.number,
            ),
            AppTextField(
              hintText: "Objective",
              controller: _con.objectiveController,
              errorMessage: _con.objectiveError,
            ),
            AppTextField(
              hintText: "Reference",
              controller: _con.referenceController,
              errorMessage: _con.refereneError,
            ),
            AppButton(
              buttontext: Row(
                children: [
                  wSizedBox12,
                  const Icon(Icons.add),
                  wSizedBox10,
                  const Text("EDUCATION")
                ],
              ),
              onPressed: () => educationDialog(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                  _con.education.length,
                  (index) => Stack(
                        alignment: Alignment.topRight,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.greyColor.withOpacity(0.2),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_con.education[index].courseDegree),
                                Text(_con.education[index].schoolUniversity),
                                Text(_con.education[index].gradeScore),
                                Text(_con.education[index].year),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () async => _con.education.removeAt(index),
                            child: const CircleAvatar(
                              radius: 14,
                              backgroundColor: AppColors.redColor,
                              child: Icon(
                                Icons.close,
                                color: AppColors.whiteColor,
                                size: 17,
                              ),
                            ),
                          )
                        ],
                      )),
            ),
            AppButton(
              buttontext: Row(
                children: [
                  wSizedBox12,
                  const Icon(Icons.add),
                  wSizedBox10,
                  const Text("EXPRICENCE")
                ],
              ),
              onPressed: () => exprienceDialog(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                  _con.experience.length,
                  (index) => Stack(
                        alignment: Alignment.topRight,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.greyColor.withOpacity(0.2),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_con.experience[index].companyName),
                                Text(_con.experience[index].jobTitle),
                                Text(_con.experience[index].startDate),
                                Text(_con.experience[index].endDate),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () async => _con.experience.removeAt(index),
                            child: const CircleAvatar(
                              radius: 14,
                              backgroundColor: AppColors.redColor,
                              child: Icon(
                                Icons.close,
                                color: AppColors.whiteColor,
                                size: 17,
                              ),
                            ),
                          )
                        ],
                      )),
            ),
            AppButton(
              buttontext: Row(
                children: [
                  wSizedBox12,
                  const Icon(Icons.add),
                  wSizedBox10,
                  const Text("PROJECT")
                ],
              ),
              onPressed: () => projectDialog(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                  _con.project.length,
                  (index) => Stack(
                        alignment: Alignment.topRight,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.greyColor.withOpacity(0.2),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_con.project[index].title),
                                Text(_con.project[index].desc),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () async => _con.project.removeAt(index),
                            child: const CircleAvatar(
                              radius: 14,
                              backgroundColor: AppColors.redColor,
                              child: Icon(
                                Icons.close,
                                color: AppColors.whiteColor,
                                size: 17,
                              ),
                            ),
                          )
                        ],
                      )),
            ),
            AppButton(
              buttontext: Row(
                children: [
                  wSizedBox12,
                  const Icon(Icons.add),
                  wSizedBox10,
                  const Text("SKILLS")
                ],
              ),
              onPressed: () => skillDialog(),
            ),
            Wrap(
              children: List.generate(
                _con.skills.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Chip(
                    label: Text(_con.skills[index]),
                    onDeleted: () => _con.skills.removeAt(index),
                  ),
                ),
              ),
            ),
            AppButton(
              buttontext: "Create",
              height: 50,
              onPressed: () {
                if (_con.validation()) {
                  _con.createResumeAPI(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }

  skillDialog() => Get.dialog(
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextField(
                  hintText: "Skills",
                  controller: _con.skillsController,
                  errorMessage: _con.refereneError,
                ),
                SizedBox(
                  width: 100,
                  child: AppButton(
                    buttontext: "ADD",
                    height: 50,
                    onPressed: () {
                      if (_con.skillsController.text.isNotEmpty) {
                        _con.skills.add(_con.skillsController.text);
                        _con.skillsController.clear();
                        Get.back();
                      } else {
                        toast("Please enter skills");
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );

  exprienceDialog() => Get.dialog(
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextField(
                  hintText: "Company Name",
                  controller: _con.companyNameController,
                  errorMessage: _con.companyNameError,
                ),
                AppTextField(
                  hintText: "Job Title",
                  controller: _con.jobTitleController,
                  errorMessage: _con.jobTitleError,
                ),
                AppTextField(
                  hintText: "Start Date",
                  controller: _con.startDateController,
                  errorMessage: _con.startDateError,
                ),
                AppTextField(
                  hintText: "End Date",
                  controller: _con.endDateController,
                  errorMessage: _con.endDateError,
                ),
                SizedBox(
                  width: 100,
                  child: AppButton(
                    buttontext: "ADD",
                    height: 50,
                    onPressed: () {
                      if (_con.exprienceValidation()) {
                        _con.experience.add(
                          Experience(
                            companyName: _con.companyNameController.text,
                            jobTitle: _con.jobTitleController.text,
                            startDate: _con.startDateController.text,
                            endDate: _con.endDateController.text,
                          ),
                        );
                        _con.companyNameController.clear();
                        _con.jobTitleController.clear();
                        _con.startDateController.clear();
                        _con.endDateController.clear();
                        Get.back();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );

  projectDialog() => Get.dialog(
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextField(
                  hintText: "Title",
                  controller: _con.companyNameController,
                  errorMessage: _con.companyNameError,
                ),
                AppTextField(
                  hintText: "Description",
                  controller: _con.jobTitleController,
                  errorMessage: _con.jobTitleError,
                ),
                SizedBox(
                  width: 100,
                  child: AppButton(
                    buttontext: "ADD",
                    height: 50,
                    onPressed: () {
                      if (_con.projectValidation()) {
                        _con.project.add(
                          Project(
                            desc: _con.descriptionController.text,
                            title: _con.projectTitleController.text,
                          ),
                        );
                        _con.descriptionController.clear();
                        _con.projectTitleController.clear();
                        Get.back();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );

  educationDialog() => Get.dialog(
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextField(
                  hintText: "Course/Degree",
                  controller: _con.courseController,
                  errorMessage: _con.courseError,
                ),
                AppTextField(
                  hintText: "School/University",
                  controller: _con.schoolController,
                  errorMessage: _con.schoolError,
                ),
                AppTextField(
                  hintText: "Grade/Score",
                  controller: _con.gradeController,
                  errorMessage: _con.gradeError,
                ),
                AppTextField(
                  hintText: "Year",
                  controller: _con.yearController,
                  errorMessage: _con.yearError,
                ),
                SizedBox(
                  width: 100,
                  child: AppButton(
                    buttontext: "ADD",
                    height: 50,
                    onPressed: () {
                      if (_con.educationValidation()) {
                        _con.education.add(
                          Education(
                              courseDegree: _con.courseController.text,
                              gradeScore: _con.gradeController.text,
                              schoolUniversity: _con.schoolController.text,
                              year: _con.yearController.text),
                        );
                        _con.courseController.clear();
                        _con.schoolController.clear();
                        _con.gradeController.clear();
                        _con.yearController.clear();
                        Get.back();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

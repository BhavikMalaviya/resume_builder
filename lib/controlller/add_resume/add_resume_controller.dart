import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_builder/model/education_model.dart';
import 'package:resume_builder/model/exprience_model.dart';
import 'package:resume_builder/model/project_model.dart';
import 'package:resume_builder/model/resume_model.dart';
import 'package:resume_builder/utils/app_colors.dart';
import 'package:resume_builder/utils/globle.dart';
import 'package:resume_builder/utils/overlay_loading.dart';
import 'package:resume_builder/utils/sizebox.dart';

class AddResumeController extends GetxController {
  TextEditingController firstNameController = TextEditingController(text: "");
  TextEditingController lastNameController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController mobileNumberController =
      TextEditingController(text: "");
  TextEditingController objectiveController = TextEditingController(text: "");
  TextEditingController referenceController = TextEditingController(text: "");

  TextEditingController skillsController = TextEditingController(text: "");

  TextEditingController companyNameController = TextEditingController(text: "");
  TextEditingController jobTitleController = TextEditingController(text: "");
  TextEditingController startDateController = TextEditingController(text: "");
  TextEditingController endDateController = TextEditingController(text: "");

  TextEditingController courseController = TextEditingController(text: "");
  TextEditingController schoolController = TextEditingController(text: "");
  TextEditingController gradeController = TextEditingController(text: "");
  TextEditingController yearController = TextEditingController(text: "");

  TextEditingController projectTitleController =
      TextEditingController(text: "");
  TextEditingController descriptionController = TextEditingController(text: "");

  RxList<String> skills = <String>[].obs;
  RxList<Experience> experience = <Experience>[].obs;
  RxList<Education> education = <Education>[].obs;
  RxList<Project> project = <Project>[].obs;

  RxString firstNameError = "".obs;
  RxString lastNameError = "".obs;
  RxString emailError = "".obs;
  RxString mobileNumberError = "".obs;
  RxString objectiveError = "".obs;
  RxString refereneError = "".obs;
  RxString companyNameError = "".obs;
  RxString jobTitleError = "".obs;
  RxString startDateError = "".obs;
  RxString endDateError = "".obs;
  RxString courseError = "".obs;
  RxString schoolError = "".obs;
  RxString gradeError = "".obs;
  RxString yearError = "".obs;
  RxString projectTitleError = "".obs;
  RxString descriptionError = "".obs;

  Rx<File> profileImage = File("").obs;

  bool exprienceValidation() {
    RxBool valid = true.obs;
    companyNameError.value = "";
    jobTitleError.value = "";
    startDateError.value = "";
    endDateError.value = "";
    if (companyNameController.value.text.isEmpty) {
      companyNameError.value = "Please enter company name";
      valid.value = false;
    }
    if (jobTitleController.value.text.isEmpty) {
      jobTitleError.value = "Please enter job title";
      valid.value = false;
    }
    if (startDateController.value.text.isEmpty) {
      startDateError.value = "Please select start date";
      valid.value = false;
    }
    if (endDateController.value.text.isEmpty) {
      endDateError.value = "Please select end date";
      valid.value = false;
    }
    return valid.value;
  }

  bool educationValidation() {
    RxBool valid = true.obs;
    courseError.value = "";
    schoolError.value = "";
    gradeError.value = "";
    yearError.value = "";

    if (courseController.value.text.isEmpty) {
      courseError.value = "Please enter course/degree";
      valid.value = false;
    }
    if (schoolController.value.text.isEmpty) {
      schoolError.value = "Please enter school/University";
      valid.value = false;
    }
    if (gradeController.value.text.isEmpty) {
      gradeError.value = "Please select grade/score";

      valid.value = false;
    }
    if (yearController.value.text.isEmpty) {
      yearError.value = "Please select year";
      valid.value = false;
    }
    return valid.value;
  }

  bool projectValidation() {
    RxBool valid = true.obs;
    projectTitleError.value = "";
    descriptionError.value = "";

    if (projectTitleController.value.text.isEmpty) {
      projectTitleError.value = "Please enter project title";
      valid.value = false;
    }
    if (descriptionController.value.text.isEmpty) {
      schoolError.value = "Please enter description";
      valid.value = false;
    }

    return valid.value;
  }

  Future<void> selectionOfImage(context) async {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            hSizedBox10,
            ListTile(
              leading: const Icon(
                Icons.camera,
                color: AppColors.accentColor,
              ),
              title: const Text(
                "Camera",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () async {
                Get.back();
                await pickImage(false);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.image,
                color: AppColors.accentColor,
              ),
              title: const Text(
                "Gallery",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () async {
                Get.back();
                await pickImage(true);
              },
            ),
          ],
        );
      },
    );
  }

  bool validation() {
    RxBool isValid = true.obs;

    if (firstNameController.value.text.isEmpty) {
      firstNameError.value = "Please enter first name";
      isValid.value = false;
    }
    if (lastNameController.value.text.isEmpty) {
      lastNameError.value = "Please enter last name";
      isValid.value = false;
    }

    if (emailController.value.text.isEmpty) {
      emailError.value = "Email field require";
      isValid.value = false;
    } else if (!emailController.value.text.isEmail) {
      emailError.value = "Enter Valid Email";
      isValid.value = false;
    }

    if (mobileNumberController.value.text.isEmpty) {
      mobileNumberError.value = "Mobile Number field require";
      isValid.value = false;
    } else if (mobileNumberController.value.text.length != 10) {
      mobileNumberError.value = "Enter Valid Mobile Number";
      isValid.value = false;
    }

    return isValid.value;
  }

  createResumeAPI(context) async {
    LoadingOverlay.of(context).show();

    String docId = FirebaseFirestore.instance.collection("resume").doc().id;

    Reference ref = FirebaseStorage.instance
        .ref()
        .child("images/${profileImage.value.path}");

    TaskSnapshot uploadTask = await ref.putFile(profileImage.value);

    String downloadURL = await uploadTask.ref.getDownloadURL();

    FirebaseFirestore.instance
        .collection("resume")
        .doc(docId)
        .set(ResumeModel(
          id: docId,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          mobile: mobileNumberController.text,
          profile: downloadURL,
          objective: objectiveController.text,
          project: project,
          education: education,
          experience: experience,
          skills: skills,
        ).toJson())
        .then((value) {
      toast("Resume create successfully");
      Get.back();
      LoadingOverlay.of(context).hide();
    });
  }

  editResumeAPI(context, {required String docId}) async {
    LoadingOverlay.of(context).show();
    String downloadURL = "";
    if (profileImage.value.path.isNotEmpty &&
        profileImage.value.path.toString() != "null") {
      Reference ref = FirebaseStorage.instance
          .ref()
          .child("images/${profileImage.value.path}");

      downloadURL =
          await (await ref.putFile(profileImage.value)).ref.getDownloadURL();
    }

    await FirebaseFirestore.instance.collection("resume").doc(docId).update(
          ResumeModel(
            id: docId,
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            email: emailController.text,
            mobile: mobileNumberController.text,
            profile: profileImage.value.path.isNotEmpty &&
                    profileImage.value.path.toString() != "null"
                ? profileImage.value.path
                : downloadURL,
            objective: objectiveController.text,
            project: project,
            education: education,
            experience: experience,
            skills: skills,
          ).toJson(),
        );
    Get.back();
    toast("Resume update successfully");
    LoadingOverlay.of(context).hide();
  }

  Future<void> pickImage(bool fromGallery) async {
    XFile? pickedFile;
    try {
      pickedFile = await ImagePicker().pickImage(
        source: fromGallery ? ImageSource.gallery : ImageSource.camera,
        maxHeight: 500,
        maxWidth: 500,
      );
    } catch (e) {
      log(e.toString());
    }
    if (pickedFile != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedFile.path,
          aspectRatio: const CropAspectRatio(ratioX: 300, ratioY: 300),
          compressQuality: 50,
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: "edit".tr,
              statusBarColor: Colors.black,
              toolbarColor: Colors.blue,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.square,
              lockAspectRatio: true,
            ),
            IOSUiSettings(
              title: "edit".tr,
            ),
          ]);
      if (croppedFile != null) {
        profileImage.value = File(croppedFile.path);
      }
    } else {
      return;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:resume_builder/controlller/add_resume/add_resume_controller.dart';
import 'package:resume_builder/utils/app_colors.dart';
import 'package:resume_builder/utils/sizebox.dart';
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            hSizedBox10,
            Center(
              child: GestureDetector(
                  onTap: () {
                    // _controller.pickProfileFile(context);
                  },
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.accentColor.withOpacity(0.2),
                        radius: 60,
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
            AppTextField(
              hintText: "Name",
              controller: _con.name.value,
              errorMessage: _con.nameError,
            ),
            AppTextField(
              hintText: "Email",
              controller: _con.email.value,
              errorMessage: _con.emailError,
            ),
            AppTextField(
              hintText: "Mobile Number",
              controller: _con.mobileNumber.value,
              errorMessage: _con.mobileNumberError,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              keyboardType: TextInputType.number,
            ),

            AppTextField(
              hintText: "Addess",
              controller: _con.address.value,
              errorMessage: _con.addressError,
            ),

            AppTextField(
              hintText: "Role",
              controller: _con.role.value,
              errorMessage: _con.roleError,
            ),

            AppTextField(
              multiLine: 5,
              hintText: "Summary",
              controller: _con.summary.value,
              errorMessage: _con.summaryError,
            ),
            hSizedBox36,
            // Obx(
            //   () => AppButton(
            //     loader: _con.isLoading.value,
            //     text: _con.isEdit == true ? "Update" : "Add",
            //     onPressed: () {
            //       _controller.isEdit == true
            //           ? _controller.onEdit()
            //           : _controller.onAdd();
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_builder/controlller/home/home_controller.dart';
import 'package:resume_builder/routes/app_routes.dart';
import 'package:resume_builder/utils/app_colors.dart';

import '../../utils/sizebox.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController _con = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: const Text("Resume"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
            ),
          )
        ],
      ),
      floatingActionButton: SizedBox(
        height: 45,
        width: 45,
        child: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoutes.addResumeScreen);
          },
          backgroundColor: AppColors.accentColor,
          child: const Icon(Icons.add),
        ),
      ),
      body: Obx(
        () => _con.isLoading.value
            ? const Center(child: CircularProgressIndicator.adaptive())
            : _con.listOfResumes.isNotEmpty
                ? const Center(
                    child: Text(
                      "No Resume Available",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(15, 25, 15, 60),
                    itemCount: 10,
                    // itemCount: _con.listOfResumes.length,

                    itemBuilder: (context, index) {
                      // var data = _con.listOfResumes[index];
                      return Stack(
                        alignment: Alignment.topRight,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        // image: DecorationImage(
                                        //   image: data.profileUrl!.isEmpty
                                        //       ? AssetImage(AppImage.defaultImage)
                                        //       : NetworkImage(data.profileUrl!)
                                        //           as ImageProvider,
                                        // ),
                                      ),
                                    ),
                                    wSizedBox10,
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: const [
                                              Text("name "),
                                              Text("name"),
                                            ],
                                          ),
                                          const Text("data.email!"),
                                          const Text(
                                              "data.createAt.toString()"),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        hSizedBox10,
                                        const CircleAvatar(
                                          radius: 15,
                                          backgroundColor:
                                              AppColors.accentColor,
                                          child: Icon(
                                            Icons.edit,
                                            size: 15,
                                            color: AppColors.whiteColor,
                                          ),
                                        ),
                                        hSizedBox10,
                                        const CircleAvatar(
                                          backgroundColor:
                                              AppColors.primaryColor,
                                          radius: 15,
                                          child: Icon(
                                            Icons.visibility,
                                            color: AppColors.whiteColor,
                                            size: 15,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                hSizedBox10,
                              ],
                            ),
                          ),
                          Positioned(
                            top: -10,
                            right: -10,
                            child: GestureDetector(
                              onTap: () async =>
                                  await deleteResumeDialog(context),
                              child: const CircleAvatar(
                                radius: 14,
                                backgroundColor: AppColors.redColor,
                                child: Icon(
                                  Icons.close,
                                  color: AppColors.whiteColor,
                                  size: 17,
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
      ),
    );
  }

  Future<void> deleteResumeDialog(context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: const Text('Delete'),
            content: const Text('Are you sure you want to delete this resume?'),
            actions: [
              TextButton(
                child: const Text(
                  'YES',
                  style: TextStyle(color: AppColors.redColor),
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              TextButton(
                child: const Text(
                  'NO',
                  style: TextStyle(color: AppColors.primaryColor),
                ),
                onPressed: () {
                  Get.back();

                  // FirebaseFirestore.instance
                  //     .collection("resume")
                  //     .doc(data.docId)
                  //     .delete();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

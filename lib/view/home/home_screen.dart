import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_builder/controlller/home/home_controller.dart';
import 'package:resume_builder/routes/app_routes.dart';
import 'package:resume_builder/utils/app_colors.dart';
import 'package:resume_builder/utils/app_loader.dart';

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
            ? const AppLoader()
            : _con.listOfResumes.isEmpty
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
                    itemCount: _con.listOfResumes.length,
                    itemBuilder: (context, index) {
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
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            _con.listOfResumes[index].profile,
                                          ),
                                        ),
                                      ),
                                    ),
                                    wSizedBox10,
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                _con.listOfResumes[index]
                                                    .firstName,
                                              ),
                                              wSizedBox10,
                                              Text(
                                                _con.listOfResumes[index]
                                                    .lastName,
                                              ),
                                            ],
                                          ),
                                          hSizedBox4,
                                          Text(
                                            _con.listOfResumes[index].email,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        hSizedBox10,
                                        GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                              AppRoutes.addResumeScreen,
                                              arguments:
                                                  _con.listOfResumes[index],
                                            );
                                          },
                                          child: const CircleAvatar(
                                            radius: 15,
                                            backgroundColor:
                                                AppColors.accentColor,
                                            child: Icon(
                                              Icons.edit,
                                              size: 15,
                                              color: AppColors.whiteColor,
                                            ),
                                          ),
                                        ),
                                        hSizedBox10,
                                        GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                                AppRoutes.preViewResumeScreen,
                                                arguments:
                                                    _con.listOfResumes[index]);
                                          },
                                          child: const CircleAvatar(
                                            backgroundColor:
                                                AppColors.primaryColor,
                                            radius: 15,
                                            child: Icon(
                                              Icons.visibility,
                                              color: AppColors.whiteColor,
                                              size: 15,
                                            ),
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
                                  await deleteResumeDialog(context, index),
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

  Future<void> deleteResumeDialog(context, index) async {
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
                onPressed: () async {
                  await _con.deleteResume(_con.listOfResumes[index].id, index);
                },
              ),
              TextButton(
                child: const Text(
                  'NO',
                  style: TextStyle(color: AppColors.primaryColor),
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

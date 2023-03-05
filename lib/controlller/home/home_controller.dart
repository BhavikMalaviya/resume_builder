import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  List listOfResumes = [].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> getResumeAPI() async {
    //  try {
    // isLoading.value = true;
    // var data = FirebaseFirestore.instance.collection("resume").snapshots();

    // await data.forEach((element) {
    //   resumeList.clear();
    //   element.docs.asMap().forEach((index, data) {
    //     return resumeList.add(ResumeData(
    //       address: data["address"],
    //       createAt:
    //           DateFormat("dd/MM/yyyy").format(data["create_at"].toDate()),
    //       docId: data["doc_id"],
    //       email: data["email"],
    //       mobileNumber: data["mobile_number"],
    //       name: data["name"],
    //       profileUrl: data["profile_url"],
    //       role: data["role"],
    //       summary: data["summary"],
    //     ));
    //   });
    //   isLoading.value = false;
    // });

    //   isLoading.value = false;
    // } catch (e) {
    //   log(e.toString());
    // }
    // }
// }
  }
}

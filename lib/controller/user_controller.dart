import 'package:amenities_app/constant.dart';
import 'package:get/get.dart';
import '../model/user_model.dart';

class UserController extends GetxController {
  final RxList<UserModel> _allSeller = <UserModel>[].obs;
  List<UserModel> get allSeller => _allSeller;
  void fetchAllSeller() {
    kShowLoading(Get.context!);
    kFireStore
        .collection(kUserCollection)
        .where(kUserType, isEqualTo: 'Seller')
        .snapshots()
        .listen((querySnapshot) {
      _allSeller.assignAll(
          querySnapshot.docs.map((e) => UserModel.fromJson(e.data())).toList());
      Get.back();
      update();
    }, onError: (error) {
      Get.back();
      kShowSnackBar(
          context: Get.context!, message: error.toString(), isSuccess: true);
    });
  }


  @override
  void onReady() {
    super.onReady();
    fetchAllSeller();
  }
}

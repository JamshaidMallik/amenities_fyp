import 'dart:developer';
import 'package:amenities_app/constant.dart';
import 'package:get/get.dart';

import '../model/user_model.dart';
class UserController extends GetxController{
  final RxList<UserModel> _allSeller = <UserModel>[].obs;
  List<UserModel> get allSeller => _allSeller;

void fetchAllSeller(){
  kFireStore.collection(kUserCollection).where(kUserType, isEqualTo: 'Seller').get().then((value) {
    _allSeller.assignAll(value.docs.map((e) => UserModel.fromJson(e.data())).toList());
    log('all_sellers:${value.docs.length}');
    log('all_sellers_name: ${_allSeller.first.fullName}');
  });
}

@override
  void onReady() {
    super.onReady();
    fetchAllSeller();
  }


}
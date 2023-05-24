import 'package:get/get.dart';

import '../constant.dart';
import '../model/product_model.dart';
import '../model/user_model.dart';

class AdminController extends GetxController{
  final RxList<UserModel> _allUsersList = <UserModel>[].obs;
  List<UserModel> get users => _allUsersList;
  RxList<Product> allProductList = RxList<Product>();
  List<Product> products = [];
  RxBool isProductLoading = false.obs;

  void fetchAllUsers() {
    _allUsersList.clear();
    kShowLoading(Get.context!);
    kFireStore
        .collection(kUserCollection)
        .where(kUserType, isNotEqualTo: 'Admin')
        .snapshots()
        .listen((querySnapshot) {
      _allUsersList.assignAll(querySnapshot.docs.map((e) => UserModel.fromJson(e.data())).toList());
      Get.back();
      update();
    }, onError: (error) {
      Get.back();
      kShowSnackBar(
          context: Get.context!, message: error.toString(), isSuccess: true);
    });
  }
  void getProducts() {
    allProductList.clear();
    isProductLoading(true);
    kFireStore
        .collection(kProductCollection)
        .snapshots()
        .listen((snapshot) {
      products.clear();
      for (var doc in snapshot.docs) {
        Product product = Product.fromSnapshot(doc);
        products.add(product);
      }
      allProductList.assignAll(products);
      isProductLoading(false);
      update();
    });
  }
  @override
  void onReady() {
    super.onReady();
    fetchAllUsers();
    getProducts();
  }

}
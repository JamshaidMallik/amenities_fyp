import 'package:cloud_firestore/cloud_firestore.dart';

class MyCartProduct {
  String id;
  String name;
  String quantity;
  String addUserId;
  String productId;
  String productUserId;
  String productImage;
  String createdAt;

  MyCartProduct(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.addUserId,
      required this.productId,
      required this.productUserId,
      required this.productImage,
      required this.createdAt});

  MyCartProduct.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.id,
        name = snapshot['name'],
        quantity = snapshot['quantity'],
        addUserId = snapshot['user_id'],
        productId = snapshot['product_id'],
        productUserId = snapshot['product_user_id'],
        productImage = snapshot['product_image'],
        createdAt = snapshot['created_at'].toDate().toString();
}

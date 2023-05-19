import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String id;
  DateTime createdAt;
  String productName;
  String userId;
  String image;
  String status;

  Product({
    required this.id,
    required this.createdAt,
    required this.productName,
    required this.userId,
    required this.image,
    required this.status,
  });

  Product.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.id,
        createdAt = snapshot['createdAt'].toDate(),
        productName = snapshot['product_name'],
        userId = snapshot['userId'],
        image = snapshot['image'],
        status = snapshot['status'];
}

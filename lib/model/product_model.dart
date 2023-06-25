import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String id;
  DateTime createdAt;
  String productName;
  String price;
  String userId;
  String image;
  String status;
  String size;


  Product({
    required this.id,
    required this.createdAt,
    required this.productName,
    required this.price,
    required this.userId,
    required this.image,
    required this.status,
required this.size,
  });

  Product.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.id,
        createdAt = snapshot['createdAt'].toDate(),
        productName = snapshot['product_name'],
        price = snapshot['product_price'],
        userId = snapshot['userId'],
        image = snapshot['image'],
        status = snapshot['status'],
        size = snapshot['size'];
}

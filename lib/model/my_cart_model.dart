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
  int price;
  int totalPrice;
  bool isSelected;

  MyCartProduct(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.addUserId,
      required this.productId,
      required this.productUserId,
      required this.productImage,
      required this.createdAt,
      required this.price,
      required this.totalPrice,
       this.isSelected = false
      });

      void toggleSelection() {
        isSelected = !isSelected;
      }

  MyCartProduct.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.id,
        name = snapshot['name'],
        quantity = snapshot['quantity'],
        addUserId = snapshot['user_id'],
        productId = snapshot['product_id'],
        productUserId = snapshot['product_user_id'],
        productImage = snapshot['product_image'],
        createdAt = snapshot['created_at'].toDate().toString(),
        price = snapshot['price'],
        totalPrice = snapshot['total_price'],
        isSelected = snapshot['is_selected'];
}

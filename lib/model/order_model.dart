import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String id;
  final String userName;
  final String address;
  final String userEmail;
  final String userPhone;
  final String userId;
  final int orderStatus;
  final String productUserId;
  final List<Map<String, dynamic>> products;

  OrderModel({
    required this.id,
    required this.userName,
    required this.address,
    required this.userEmail,
    required this.userPhone,
    required this.userId,
    required this.orderStatus,
    required this.productUserId,
    required this.products,
  });

  factory OrderModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return OrderModel(
      id: doc.id,
      userName: data['user_name'],
      address: data['address'],
      userEmail: data['user_email'],
      userPhone: data['user_phone'],
      userId: data['user_id'],
      orderStatus: data['order_status'],
      productUserId: data['product_user_id'],
      products: List<Map<String, dynamic>>.from(data['products']),
    );
  }
}
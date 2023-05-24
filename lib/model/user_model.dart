import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? userType;
  final String? userId;
  final String? userImage;
  final String? userPhone;
  final String? fullName;
  final DateTime? createdAt;
  final String? email;

  UserModel({
     this.userType,
     this.userId,
     this.userImage,
     this.userPhone,
     this.fullName,
     this.createdAt,
     this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userType: json['user_type'] ?? '',
      userId: json['user_id'] ?? '',
      userImage: json['user_image'] ?? '',
      userPhone: json['user_phone'] ?? '',
      fullName: json['fullName'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(
          (json['created_at'] as Timestamp).seconds * 1000),
      email: json['email'] ?? '',
    );
  }
}

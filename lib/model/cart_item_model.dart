class CartItem {
  String name;
  String quantity;
  String addUserId;
  String productId;
  String productUserId;
  String productImage;
  CartItem({required this.name, required this.quantity, required this.addUserId, required this.productId, required this.productUserId, required this.productImage});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'quantity': quantity,
      'user_id': addUserId,
      'product_id': productId,
      'created_at': DateTime.now(),
      'product_user_id': productUserId,
      'product_image': productImage,
    };
  }
}
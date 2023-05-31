class CartItem {
  String name;
  String quantity;
  String addUserId;
  String productId;
  String productUserId;
  String productImage;
  int price;
  int totalPrice;
  CartItem({required this.name, required this.quantity, required this.addUserId, required this.productId, required this.productUserId, required this.productImage, required this.price, required this.totalPrice});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'quantity': quantity,
      'user_id': addUserId,
      'product_id': productId,
      'created_at': DateTime.now(),
      'product_user_id': productUserId,
      'product_image': productImage,
      'price': price,
      'total_price': totalPrice,
    };
  }
}
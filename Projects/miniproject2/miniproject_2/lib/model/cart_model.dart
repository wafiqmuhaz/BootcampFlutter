class CartModel {
  int id;
  int userId;
  String date;
  List<Products> products;
  int version;

  CartModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
    required this.version,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    final productsJson = json['products'] as List? ?? [];
    List<Products> productList =
        productsJson.map((data) => Products.fromJson(data)).toList();

    return CartModel(
      id: json['id'] ?? 0,
      userId: json['userId'] ?? 0,
      date: json['date'] ?? '',
      products: productList,
      version: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'date': date,
      'products': products.map((product) => product.toJson()).toList(),
      '__v': version,
    };
  }
}

class Products {
  int productId;
  int quantity;

  Products({required this.productId, required this.quantity});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      productId: json['productId'] ?? 0,
      quantity: json['quantity'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }
}

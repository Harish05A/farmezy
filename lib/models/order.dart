class Order {
  final String id;
  final String farmerId;
  final String corporateBuyerId;
  final String productId;
  final int quantity;
  final double price;
  final DateTime datePlaced;
  final DateTime deadline;

  Order({
    required this.id,
    required this.farmerId,
    required this.corporateBuyerId,
    required this.productId,
    required this.quantity,
    required this.price,
    required this.datePlaced,
    required this.deadline,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      farmerId: json['farmerId'],
      corporateBuyerId: json['corporateBuyerId'],
      productId: json['productId'],
      quantity: json['quantity'],
      price: json['price'],
      datePlaced: DateTime.parse(json['datePlaced']),
      deadline: DateTime.parse(json['deadline']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'farmerId': farmerId,
      'corporateBuyerId': corporateBuyerId,
      'productId': productId,
      'quantity': quantity,
      'price': price,
      'datePlaced': datePlaced.toIso8601String(),
      'deadline': deadline.toIso8601String(),
    };
  }
}

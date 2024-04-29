class OrderModel {
  int id;
  double orderTotal;
  DateTime orderDate;
  String user;
  // PaymentModel payment;
  // List<OrderItemModel> orderItems;

  OrderModel({
    required this.id,
    required this.orderTotal,
    required this.orderDate,
    required this.user,
    // required this.payment,
    // required this.orderItems,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] ?? 0,
      orderTotal:
          json['orderTotal'] != null ? json['orderTotal'].toDouble() : 0.0,
      orderDate: json['orderDate'] != null
          ? DateTime.parse(json['orderDate'])
          : DateTime.now(),
      user: json['user'] ?? '',
      // payment: json['payment'] != null
      //     ? PaymentModel.fromJson(json['payment'])
      //     : PaymentModel(
      //         id: 0,
      //         amount: 0.0,
      //         paymentDate: DateTime.now(),
      //         user: '',
      //         paymentType: '',
      //       ),
      // orderItems: json['orderItems'] != null
      //     ? List<OrderItemModel>.from(
      //         json['orderItems'].map((x) => OrderItemModel.fromJson(x)))
      //     : [],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'orderTotal': orderTotal,
      'orderDate': orderDate.toIso8601String(),
      'user': user,
      // 'payment': payment.toJson(),
      // 'orderItems': orderItems.map((item) => item.toJson()).toList(),
    };
  }
}

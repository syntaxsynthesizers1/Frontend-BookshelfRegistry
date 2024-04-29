import 'package:book_stack/models/book_model.dart';

class PurchaseModel {
  int id;
  String user;
  BookModel book;
  DateTime purchasedAt;

  PurchaseModel({
    required this.id,
    required this.user,
    required this.book,
    required this.purchasedAt,
  });

  factory PurchaseModel.fromJson(Map<String, dynamic> json) {
    return PurchaseModel(
      id: json['id'] ?? 0,
      user: json['user'] ?? '',
      book: json['book'] != null
          ? BookModel.fromJson(json['book'])
          : BookModel(
              id: 0,
              title: '',
              author: '',
              description: '',
              imageUrl: '',
              rating: 0.0,
              color: '',
              duration: '',
              language: '',
              pages: 0,
              bookRating: 0.0,
              authorOnApp: false,
              bookStatus: '',
              bookCategory: '',
              // user: '',
              favourites: [],
              readings: [],
              ratings: [],
              // orderItems: [],
            ),
      purchasedAt: json['purchasedAt'] != null
          ? DateTime.parse(json['purchasedAt'])
          : DateTime.now(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user,
      'book': book.toJson(), // Assuming BookModel has a toJson() method
      'purchasedAt': purchasedAt.toIso8601String(),
    };
  }
}

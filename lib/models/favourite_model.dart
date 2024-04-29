import 'package:book_stack/models/book_model.dart';

class FavouriteModel {
  int id;
  String user;
  BookModel book;
  DateTime addedAt;

  FavouriteModel({
    required this.id,
    required this.user,
    required this.book,
    required this.addedAt,
  });

  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
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
      addedAt: json['addedAt'] != null
          ? DateTime.parse(json['addedAt'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user,
      'book': book.toJson(),
      'addedAt': addedAt.toIso8601String(),
    };
  }
}

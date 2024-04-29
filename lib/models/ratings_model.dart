import 'package:book_stack/models/book_model.dart';

class RatingModel {
  int id;
  int rating;
  String review;
  DateTime ratedAt;
  String user;
  BookModel book;

  RatingModel({
    required this.id,
    required this.rating,
    required this.review,
    required this.ratedAt,
    required this.user,
    required this.book,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      id: json['id'] ?? 0,
      rating: json['rating'] ?? 0,
      review: json['review'] ?? '',
      ratedAt: json['ratedAt'] != null
          ? DateTime.parse(json['ratedAt'])
          : DateTime.now(),
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
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rating': rating,
      'review': review,
      'ratedAt': ratedAt.toIso8601String(),
      'user': user,
      'book': book.toJson(), // Assuming BookModel has a toJson() method
    };
  }
}

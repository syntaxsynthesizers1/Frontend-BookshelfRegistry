import 'package:book_stack/models/book_model.dart';

class ReadingModel {
  int id;
  int pagesCompleted;
  DateTime startedAt;
  DateTime finishedAt;
  bool completed;
  String user;
  BookModel book;

  ReadingModel({
    required this.id,
    required this.pagesCompleted,
    required this.startedAt,
    required this.finishedAt,
    required this.completed,
    required this.user,
    required this.book,
  });

  factory ReadingModel.fromJson(Map<String, dynamic> json) {
    return ReadingModel(
      id: json['id'] ?? 0,
      pagesCompleted: json['pagesCompleted'] ?? 0,
      startedAt: json['startedAt'] != null
          ? DateTime.parse(json['startedAt'])
          : DateTime.now(),
      finishedAt: json['finishedAt'] != null
          ? DateTime.parse(json['finishedAt'])
          : DateTime.now(),
      completed: json['completed'] ?? false,
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
      'pagesCompleted': pagesCompleted,
      'startedAt': startedAt.toIso8601String(),
      'finishedAt': finishedAt.toIso8601String(),
      'completed': completed,
      'user': user,
      'book': book.toJson(), // Assuming BookModel has a toJson() method
    };
  }
}

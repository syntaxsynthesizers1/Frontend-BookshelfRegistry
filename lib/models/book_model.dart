class BookModel {
  int id;
  String title;
  String author;
  String description;
  String imageUrl;
  double rating;
  String color;
  String duration;
  String language;
  int pages;
  double bookRating;
  bool authorOnApp;
  String bookStatus;
  String bookCategory;
  // String user;
  List<String> favourites;
  List<String> readings;
  List<String> ratings;
  // List<OrderItemModel> orderItems;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.color,
    required this.duration,
    required this.language,
    required this.pages,
    required this.bookRating,
    required this.authorOnApp,
    required this.bookStatus,
    required this.bookCategory,
    // required this.user,
    required this.favourites,
    required this.readings,
    required this.ratings,
    // required this.orderItems,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      rating: json['rating'] != null ? json['rating'].toDouble() : 0.0,
      color: json['color'] ?? '',
      duration: json['duration'] ?? '',
      language: json['language'] ?? '',
      pages: json['pages'] ?? 0,
      bookRating:
          json['bookRating'] != null ? json['bookRating'].toDouble() : 0.0,
      authorOnApp: json['authorOnApp'] ?? false,
      bookStatus: json['bookStatus'] ?? '',
      bookCategory: json['bookCategory'] ?? '',
      // user: json['user'] ?? '',
      favourites: json['favourites'] != null
          ? List<String>.from(json['favourites'])
          : [],
      readings:
          json['readings'] != null ? List<String>.from(json['readings']) : [],
      ratings:
          json['ratings'] != null ? List<String>.from(json['ratings']) : [],
      // orderItems: json['orderItems'] != null
      //     ? List<OrderItemModel>.from(
      //         json['orderItems'].map((x) => OrderItemModel.fromJson(x)))
      //     : [],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'description': description,
      'imageUrl': imageUrl,
      'rating': rating,
      'color': color,
      'duration': duration,
      'language': language,
      'pages': pages,
      'bookRating': bookRating,
      'authorOnApp': authorOnApp,
      'bookStatus': bookStatus,
      'bookCategory': bookCategory,
      // 'user': user,
      'favourites': favourites,
      'readings': readings,
      'ratings': ratings,
      // 'orderItems': orderItems.map((item) => item.toJson()).toList(),
    };
  }
}

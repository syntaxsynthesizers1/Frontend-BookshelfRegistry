import 'package:book_stack/models/audit_log_model.dart';
import 'package:book_stack/models/authority_model.dart';
import 'package:book_stack/models/favourite_model.dart';
import 'package:book_stack/models/order_model.dart';
import 'package:book_stack/models/purchase_model.dart';
import 'package:book_stack/models/ratings_model.dart';
import 'package:book_stack/models/reading_model.dart';

class UserModel {
  int id;
  String firstName;
  String lastName;
  String email;
  String password;
  String accountNumber;
  String accountName;
  String bankName;
  double walletBalance;
  String role;
  List<FavouriteModel> favourites;
  List<PurchaseModel> purchases;
  List<ReadingModel> readings;
  List<RatingModel> ratings;
  List<OrderModel> orders;
  List<AuditLogModel> auditLogs;
  bool enabled;
  String username;
  List<AuthorityModel> authorities;
  bool accountNonExpired;
  bool accountNonLocked;
  bool credentialsNonExpired;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.accountNumber,
    required this.accountName,
    required this.bankName,
    required this.walletBalance,
    required this.role,
    required this.favourites,
    required this.purchases,
    required this.readings,
    required this.ratings,
    required this.orders,
    required this.auditLogs,
    required this.enabled,
    required this.username,
    required this.authorities,
    required this.accountNonExpired,
    required this.accountNonLocked,
    required this.credentialsNonExpired,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      accountNumber: json['accountNumber'] ?? '',
      accountName: json['accountName'] ?? '',
      bankName: json['bankName'] ?? '',
      walletBalance: json['walletBalance'] != null
          ? json['walletBalance'].toDouble()
          : 0.0,
      role: json['role'] ?? '',
      favourites: json['favourites'] != null
          ? List<FavouriteModel>.from(
              json['favourites'].map((x) => FavouriteModel.fromJson(x)))
          : [],
      purchases: json['purchases'] != null
          ? List<PurchaseModel>.from(
              json['purchases'].map((x) => PurchaseModel.fromJson(x)))
          : [],
      readings: json['readings'] != null
          ? List<ReadingModel>.from(
              json['readings'].map((x) => ReadingModel.fromJson(x)))
          : [],
      ratings: json['ratings'] != null
          ? List<RatingModel>.from(
              json['ratings'].map((x) => RatingModel.fromJson(x)))
          : [],
      orders: json['orders'] != null
          ? List<OrderModel>.from(
              json['orders'].map((x) => OrderModel.fromJson(x)))
          : [],
      auditLogs: json['auditLogs'] != null
          ? List<AuditLogModel>.from(
              json['auditLogs'].map((x) => AuditLogModel.fromJson(x)))
          : [],
      enabled: json['enabled'] ?? false,
      username: json['username'] ?? '',
      authorities: json['authorities'] != null
          ? List<AuthorityModel>.from(
              json['authorities'].map((x) => AuthorityModel.fromJson(x)))
          : [],
      accountNonExpired: json['accountNonExpired'] ?? false,
      accountNonLocked: json['accountNonLocked'] ?? false,
      credentialsNonExpired: json['credentialsNonExpired'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'accountNumber': accountNumber,
      'accountName': accountName,
      'bankName': bankName,
      'walletBalance': walletBalance,
      'role': role,
      'favourites': favourites.map((fav) => fav.toJson()).toList(),
      'purchases': purchases.map((purchase) => purchase.toJson()).toList(),
      'readings': readings.map((reading) => reading.toJson()).toList(),
      'ratings': ratings.map((rating) => rating.toJson()).toList(),
      'orders': orders.map((order) => order.toJson()).toList(),
      'auditLogs': auditLogs.map((log) => log.toJson()).toList(),
      'enabled': enabled,
      'username': username,
      'authorities':
          authorities.map((authority) => authority.toJson()).toList(),
      'accountNonExpired': accountNonExpired,
      'accountNonLocked': accountNonLocked,
      'credentialsNonExpired': credentialsNonExpired,
    };
  }
}

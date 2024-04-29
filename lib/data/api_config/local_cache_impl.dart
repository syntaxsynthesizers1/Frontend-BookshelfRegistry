import 'dart:convert';
import 'package:book_stack/Constants/custom_string.dart';
import 'package:book_stack/models/book_model.dart';
import 'package:book_stack/models/old_book_model.dart';
import 'package:book_stack/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/secure_storage.dart';
import 'app_logger.dart';
import 'local_cache.dart';

class LocalCacheImpl implements LocalCache {
  static const userToken = 'userTokenId';
  static const user = "currentUser";

  late SecureStorage storage;
  late SharedPreferences sharedPreferences;

  LocalCacheImpl({
    required this.storage,
    required this.sharedPreferences,
  });

  @override
  UserModel getUserData() {
    var res = getFromLocalCache(ConstantString.userData) as String? ?? '{}';

    return UserModel.fromJson(json.decode(res) as Map<String, dynamic>);
  }

  @override
  OldBookModel? getLastRead() {
    var res = getFromLocalCache(ConstantString.lastRead) as String? ?? '';
    if (res.isEmpty) {
      return null;
    } else {
      return OldBookModel.fromJson(json.decode(res) as Map<String, dynamic>);
    }
  }

  @override
  Future<void> cacheUserData({required String value}) async {
    await saveToLocalCache(key: ConstantString.userData, value: value);
  }

  @override
  Future<void> cacheLastRead({required String value}) async {
    await saveToLocalCache(key: ConstantString.lastRead, value: value);
  }

  @override
  Future<void> deleteToken() async {
    try {
      await storage.delete(userToken);
    } catch (e) {
      AppLogger.log(e);
    }
  }

  @override
  Object? getFromLocalCache(String key) {
    try {
      return sharedPreferences.get(key);
    } catch (e) {
      AppLogger.log(e);
    }
    return null;
  }

  @override
  Future<String> getToken() async {
    try {
      return (await storage.read(userToken))!;
    } catch (e) {
      AppLogger.log(e);
      return "";
    }
  }

  @override
  Future<void> removeFromLocalCache(String key) async {
    await sharedPreferences.remove(key);
  }

  @override
  Future<void> saveToken(String token) async {
    try {
      await storage.write(key: userToken, value: token);
    } catch (e) {
      AppLogger.log(e);
    }
  }

  @override
  Future<void> saveToLocalCache({required String key, required value}) async {
    AppLogger.log('Data being saved: key: $key, value: $value');

    if (value is String) {
      await sharedPreferences.setString(key, value);
    }
    if (value is bool) {
      await sharedPreferences.setBool(key, value);
    }
    if (value is int) {
      await sharedPreferences.setInt(key, value);
    }
    if (value is double) {
      await sharedPreferences.setDouble(key, value);
    }
    if (value is List<String>) {
      await sharedPreferences.setStringList(key, value);
    }
    if (value is Map) {
      await sharedPreferences.setString(key, json.encode(value));
    }
  }

  @override
  Future<void> saveBookModels(List<OldBookModel> bookModels) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList =
        bookModels.map((book) => jsonEncode(book.toJson())).toList();
    await prefs.setStringList('bookModels', jsonList);
  }

  @override
  List<OldBookModel> loadBookModels() {
    final jsonList = sharedPreferences.getStringList('bookModels') ?? [];
    if (jsonList.isEmpty) {
      return [];
    } else {
      return jsonList
          .map((json) => OldBookModel.fromJson(jsonDecode(json)))
          .toList();
    }
  }

  // @override
  // Future<void> cacheUserData({required String value}) async {
  //   await saveToLocalCache(key: user, value: value);
  // }

  // @override
  // Future<void> deleteUserData() async {
  //   await removeFromLocalCache(user);
  // }
}

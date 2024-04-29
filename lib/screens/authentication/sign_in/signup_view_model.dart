import 'dart:async';
import 'dart:convert';
import 'package:book_stack/Constants/custom_string.dart';
import 'package:book_stack/data/view_model/base_change_notifier.dart';
import 'package:book_stack/dialogs_and_popups/generic_dialog.dart';
import 'package:book_stack/models/book_model.dart';
import 'package:book_stack/models/old_book_model.dart';
import 'package:book_stack/models/user_model.dart';
import 'package:book_stack/screens/app_view_model.dart';
import 'package:book_stack/screens/dashboard/bottom_navigation_screen.dart';
import 'package:book_stack/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final signupProvider =
    ChangeNotifierProvider.autoDispose<SignupViewModel>((ref) {
  return SignupViewModel.initWhoAmI();
});

class SignupViewModel extends BaseChangeNotifier {
  bool _isloading;
  bool _isimageLoading;
  String authorized = 'Not Authorized';

  SignupViewModel.initWhoAmI()
      : _isloading = false,
        _isimageLoading = false,
        _phoneNumber = "",
        _userId = "",
        _userImageId = 0,
        _userFirstName = "",
        _password = "",
        _email = "";
  SignupViewModel.profile()
      : _phoneNumber = "",
        _userId = "",
        _userImageId = 0,
        _userFirstName = "",
        _email = "",
        _password = "",
        _isimageLoading = false,
        _isloading = false;

  bool get isImageLoading => _isimageLoading;
  bool get isLoading => _isloading;
  String _email, _phoneNumber, _userId, _userFirstName, _password = "";
  final int _userImageId;
  String get email => _email;
  String get phoneNumber => _phoneNumber;
  String get password => _password;
  String get userId => _userId;
  int get userImageId => _userImageId;
  String get userFirstName => _userFirstName;

  set isLoading(bool isloading) {
    _isloading = isloading;
    notifyListeners();
  }

  set isImageLoading(bool isimageLoading) {
    _isimageLoading = isimageLoading;
    notifyListeners();
  }

  Future<void> signIn(
    email,
    password,
  ) async {
    try {
      isLoading = true;
      var bookModels = localCache.loadBookModels();
      if (bookModels.isEmpty) {
        await localCache.saveBookModels(initializeBookModels());
      }
      final res = await userRepository.signIn(
        email,
        password,
      );

      if (res.success) {
        _email = email;
        isLoading = false;

        var token = res.data["token"];
        print("This is token $token");
        localCache.saveToken(token);

        var data = res.data["user"];
        print(1);
        var user = UserModel.fromJson(data);
        print(user);
        localCache.saveToLocalCache(
            key: ConstantString.userData, value: json.encode(user.toJson()));
        print(3);
        print("This is user $user");

        var bookModels = localCache.loadBookModels();
        if (bookModels.isEmpty) {
          await localCache.saveBookModels(initializeBookModels());
        }
        navigationHandler.pushNamed(
          BottomNavigationScreen.routeName,
        );

        // final bookRes = await userRepository.getAllBooks();
        // if (bookRes.success) {
        //   isLoading = false;
        //   var data = res.data;
        //   print(1);
        //   var book = BookModel.fromJson(data);
        //   print(book);
        //   localCache.saveToLocalCache(
        //       key: ConstantString.bookData, value: json.encode(book.toJson()));
        //   print("This is book $book");

        //   navigationHandler.pushNamed(
        //     BottomNavigationScreen.routeName,
        //   );
        // } else {
        //   isLoading = false;
        //   print(res.error);
        //   GenericDialog().showSimplePopup(
        //     // context: context,
        //     type: InfoBoxType.error,
        //     content: "Login failed, try again later",
        //     onOkPressed: () {
        //       navigationHandler.goBack();
        //     },
        //   );
        // }
      } else {
        isLoading = false;
        print(res.error);
        GenericDialog().showSimplePopup(
          // context: context,
          type: InfoBoxType.error,
          content: res.error,
          onOkPressed: () {
            navigationHandler.goBack();
          },
        );
      }
    } catch (e, stacktrace) {
      isLoading = false;
      debugPrint(e.toString());

      log(e.toString());
      log(stacktrace.toString());
    }
  }

  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      isLoading = true;
      final res = await userRepository.signUp(
        firstName,
        lastName,
        email,
        password,
      );

      if (res.success) {
        _email = email;
        isLoading = false;

        var token = res.data["token"];
        print("This is token $token");
        localCache.saveToken(token);

        var data = res.data["user"];
        print(1);
        var user = UserModel.fromJson(data);
        print(user);
        localCache.saveToLocalCache(
            key: ConstantString.userData, value: json.encode(user.toJson()));
        print(3);
        print("This is user $user");

        // var data = RegisterResponseModel.fromJson(res.data);
        // localCache.saveToken(data.jwtToken!.token);
        var bookModels = localCache.loadBookModels();
        if (bookModels.isEmpty) {
          await localCache.saveBookModels(initializeBookModels());
        }
        navigationHandler.pushNamed(
          BottomNavigationScreen.routeName,
        );
      } else {
        isLoading = false;
        print(res.error);
        GenericDialog().showSimplePopup(
          // context: context,
          type: InfoBoxType.error,
          content: res.error,
          onOkPressed: () {
            navigationHandler.goBack();
          },
        );

        // GenericDialog().showSimplePopup(
        //   type: InfoBoxType.warning,
        //   title: ConstantString.apiErrorResponseTitle,
        //   content: res.message,
        // );
      }
    } catch (e, stacktrace) {
      isLoading = false;
      debugPrint(e.toString());

      log(e.toString());
      log(stacktrace.toString());
    }
  }

  Future<void> loadBooks() async {
    try {
      isLoading = true;
      for (var book in initializeBookModels()) {
        final res = await userRepository.addBook(
          title: book.title,
          author: book.author,
          description: book.description,
          imageUrl: book.imageUrl,
          rating: book.rating,
          color: book.color,
          duration: book.duration,
          pages: book.pages,
          status: getStatusName(
              BookStatus.values[book.status]), // Convert index to string
          category: getCategoryNewName(
              BookCategory.values[book.category]), // Convert index to string
        );

        if (res.success) {
          // var data = RegisterResponseModel.fromJson(res.data);
          // localCache.saveToken(data.jwtToken!.token);
          // navigationHandler.pushNamed(
          //   BottomNavigationScreen.routeName,
          // );
        } else {
          throw (Exception(res.error));
          isLoading = false;
          print(res.error);
          GenericDialog().showSimplePopup(
            // context: context,
            type: InfoBoxType.error,
            content: res.error,
            onOkPressed: () {
              navigationHandler.goBack();
            },
          );
        }
      }

      // GenericDialog().showSimplePopup(
      //   type: InfoBoxType.warning,
      //   title: ConstantString.apiErrorResponseTitle,
      //   content: res.message,
      // );
    } catch (e, stacktrace) {
      isLoading = false;
      debugPrint(e.toString());

      log(e.toString());
      log(stacktrace.toString());
    }
  }

  Future<void> cacheLastRead(OldBookModel book) async {
    try {
      localCache.saveToLocalCache(
          key: ConstantString.lastRead, value: json.encode(book.toJson()));
    } catch (e, stacktrace) {
      isLoading = false;
      debugPrint(e.toString());

      log(e.toString());
      log(stacktrace.toString());
    }
  }

  void updateBookPages(
      OldBookModel bookData, int newPage, WidgetRef ref) async {
    print(bookData);
    print(newPage);
    var bookModels = localCache.loadBookModels();
    List<OldBookModel> newBookModels = bookModels.map((data) {
      if (data.title == bookData.title) {
        data.pagesRead =
            newPage; // Update the 'pages' field for the book with the name "Bola"
      }
      return data;
    }).toList();

    await localCache.saveBookModels(newBookModels);
    OldBookModel updatedBook = bookData;
    updatedBook.pagesRead = newPage;
    await cacheLastRead(updatedBook);
    ref.read(bookModelsProvider.notifier).state = localCache.loadBookModels();
    ref.read(lastReadProvider.notifier).state = localCache.getLastRead();

    //  final bookModelsProvider =
    //   StateProvider<List<OldBookModel>>((ref) =>  locator<LocalCache>().loadBookModels());
  }

  void startReading(OldBookModel bookData, WidgetRef ref) async {
    var bookModels = localCache.loadBookModels();
    List<OldBookModel> newBookModels = bookModels.map((data) {
      if (data.title == bookData.title) {
        data.isReading =
            true; // Update the 'pages' field for the book with the name "Bola"
      }
      return data;
    }).toList();

    await localCache.saveBookModels(newBookModels);
    ref.read(bookModelsProvider.notifier).state = localCache.loadBookModels();

    //  final bookModelsProvider =
    //   StateProvider<List<OldBookModel>>((ref) =>  locator<LocalCache>().loadBookModels());
  }

  void startListening(OldBookModel bookData, WidgetRef ref) async {
    var bookModels = localCache.loadBookModels();
    List<OldBookModel> newBookModels = bookModels.map((data) {
      if (data.title == bookData.title) {
        data.isListening =
            true; // Update the 'pages' field for the book with the name "Bola"
      }
      return data;
    }).toList();

    await localCache.saveBookModels(newBookModels);
    ref.read(bookModelsProvider.notifier).state = localCache.loadBookModels();

    //  final bookModelsProvider =
    //   StateProvider<List<OldBookModel>>((ref) =>  locator<LocalCache>().loadBookModels());
  }

  // Future<void> uploadUserInterests(interests, {BuildContext? context}) async {
  //   try {
  //     isLoading = true;
  //     final res = await userRepository.uploadUserInterests(
  //       interests,
  //     );

  //     if (res.success) {
  //       isLoading = false;
  //       navigationHandler.pushNamed(
  //         DashboardScreen.routeName,
  //       );
  //     } else {
  //       isLoading = false;
  //       print(res.errors);
  //       ScaffoldMessenger.of(context!)
  //         ..removeCurrentSnackBar()
  //         ..showSnackBar(SnackBar(
  //           content: Text(res.errors!.join('\n')),
  //           backgroundColor: Colors.red,
  //         ));

  //       // GenericDialog().showSimplePopup(
  //       //   type: InfoBoxType.warning,
  //       //   title: ConstantString.apiErrorResponseTitle,
  //       //   content: res.message,
  //       // );
  //     }
  //   } catch (e, stacktrace) {
  //     isLoading = false;
  //     debugPrint(e.toString());

  //     log(e.toString());
  //     log(stacktrace.toString());
  //   }
  // }
}

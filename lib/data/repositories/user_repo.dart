// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable

import '../../utils/api_endpoints.dart';
import '../api/generic_response.dart';
import '../api_config/api_service.dart';
import '../api_config/local_cache.dart';

abstract class UserRepository {
  Future<GenericResponse> signIn(String email, String password);
  Future<GenericResponse> signUp(
      String firstName, String lastName, String email, String password);

  Future<GenericResponse> getAllBooks();
  Future<GenericResponse> addBook({
    required String title,
    required String author,
    required String description,
    required String imageUrl,
    required double rating,
    required String color,
    required String duration,
    required int pages,
    required String status,
    required String category,
  });

  ////
  Future<GenericResponse> refreshToken(String token, String refreshToken);

  Future<GenericResponse> sendOtp(String mobileNumberDialCode, mobileNumber);
  Future<GenericResponse> uploadPhoneNumber(
      String mobileNumberDialCode, mobileNumber, otp);

  Future<GenericResponse> uploadUserName(String firstName, lastName);
  Future<GenericResponse> uploadDateOfBirth(String dateOfbirth);
  Future<GenericResponse> uploadGender(String gender);
  Future<GenericResponse> uploadUserImage(String name, contentType, base64);
  Future<GenericResponse> deleteUserImage(int imageId);
  Future<GenericResponse> uploadUserInterests(String interests);

  //MATCHES
  Future<GenericResponse> getUsersForMatching(int pageNumber, int pageSize);

  Future<GenericResponse> prelaunch();
  Future<GenericResponse> getContactInfo();
}

class UserRepositoryImpl extends ApiService implements UserRepository {
  late LocalCache cache;

  UserRepositoryImpl({
    required this.cache,
  }) : super();

  @override
  Future<GenericResponse> signIn(String email, String password) async {
    var requestData = {"email": email, "password": password};
    var res =
        await post(ApiEndpoints.signIn, data: requestData, useToken: false);
    return GenericResponse.fromJson(res);
  }

  /////////

  @override
  Future<GenericResponse> getContactInfo() async {
    var requestData = {"email": "user1@example.com", "password": "Test123#"};
    var res =
        await post(ApiEndpoints.register, data: requestData, useToken: false);
    return GenericResponse.fromJson(res);
  }

  @override
  Future<GenericResponse> prelaunch() {
    // TODO: implement prelaunch
    throw UnimplementedError();
  }

  @override
  Future<GenericResponse> refreshToken(String token, String refreshToken) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  // @override
  // Future<GenericResponse> signIn(
  //     String username, String password, String messagingToken,
  //     {bool isBiometric = false, deviceInfo}) {
  //   // TODO: implement signIn
  //   throw UnimplementedError();
  // }

  @override
  Future<GenericResponse> signUp(
      String firstName, String lastName, String email, String password) async {
    var requestData = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password
    };
    var res =
        await post(ApiEndpoints.register, data: requestData, useToken: false);
    print(res);
    return GenericResponse.fromJson(res);
  }

  @override
  Future<GenericResponse> sendOtp(
      String mobileNumberDialCode, mobileNumber) async {
    var requestData = {
      "mobileNumberDialCode": mobileNumberDialCode,
      "mobileNumber": mobileNumber
    };
    var res = await patch(ApiEndpoints.uploadMobileNumber,
        data: requestData, useToken: true);
    return GenericResponse.fromJson(res);
  }

  @override
  Future<GenericResponse> uploadPhoneNumber(
      String mobileNumberDialCode, mobileNumber, otp) async {
    var requestData = {
      "mobileNumberDialCode": mobileNumberDialCode,
      "mobileNumber": mobileNumber,
      "otp": otp,
    };
    var res = await patch(ApiEndpoints.uploadMobileNumber,
        data: requestData, useToken: true);
    return GenericResponse.fromJson(res);
  }

  @override
  Future<GenericResponse> uploadUserName(String firstName, lastName) async {
    var requestData = {
      "firstName": firstName,
      "lastName": lastName,
    };
    var res = await patch(ApiEndpoints.uploadUserName,
        data: requestData, useToken: true);
    return GenericResponse.fromJson(res);
  }

  @override
  Future<GenericResponse> uploadDateOfBirth(String dateOfbirth) async {
    var requestData = {
      "dateOfBirth": dateOfbirth,
    };
    var res = await patch(ApiEndpoints.uploadDateOfBirth,
        data: requestData, useToken: true);
    return GenericResponse.fromJson(res);
  }

  @override
  Future<GenericResponse> uploadGender(String gender) async {
    var requestData = {
      "gender": gender,
    };
    var res = await patch(ApiEndpoints.uploadGender,
        data: requestData, useToken: true);
    return GenericResponse.fromJson(res);
  }

  @override
  Future<GenericResponse> uploadUserImage(
      String name, contentType, base64) async {
    var requestData = {
      "name": name,
      "contentType": contentType,
      "base64": base64,
    };
    var res = await patch(ApiEndpoints.uploadUserImage,
        data: requestData, useToken: true);
    return GenericResponse.fromJson(res);
  }

  @override
  Future<GenericResponse> deleteUserImage(int imageId) async {
    var res = await delete(
      "${ApiEndpoints.deleteUserImage}/$imageId",
    );
    return GenericResponse.fromJson(res);
  }

  @override
  Future<GenericResponse> uploadUserInterests(String interests) async {
    var requestData = {
      "interests": interests,
    };
    var res = await patch(ApiEndpoints.uploadUserInterests,
        data: requestData, useToken: true);
    return GenericResponse.fromJson(res);
  }

  @override
  Future<GenericResponse> getUsersForMatching(
      int pageNumber, int pageSize) async {
    var res = await get(
      "${ApiEndpoints.getUsersForMatching}?PageNumber=$pageNumber&PageSize=$pageNumber",
      useToken: true,
    );
    return GenericResponse.fromJson(res);
  }

  @override
  Future<GenericResponse> getAllBooks() async {
    var res = await get(ApiEndpoints.getAllBooks, useToken: true);
    print(res);

    return GenericResponse.fromJson(res);
  }

  @override
  Future<GenericResponse> addBook({
    required String title,
    required String author,
    required String description,
    required String imageUrl,
    required double rating,
    required String color,
    required String duration,
    required int pages,
    required String status,
    required String category,
  }) async {
    print(description);
    var requestData =
        // {
        //   "title": title,
        //   "author": author,
        //   "description": "",
        //   "imageUrl": imageUrl,
        //   "rating": rating,
        //   "color": color,
        //   "duration": duration,
        //   "language": "EN",
        //   "pages": pages,
        //   "authorOnApp": false,
        //   "status": status,
        //   "category": category
        // };
        {
      "title": title,
      "author": author,
      "description": description,
      "imageUrl": imageUrl,
      "rating": rating,
      "color": color,
      "duration": duration,
      "language": "EN",
      "pages": pages,
      "authorOnApp": false,
      "status": status,
      "category": category
    };
    var res =
        await post(ApiEndpoints.getAllBooks, data: requestData, useToken: true);
    print(res);

    return GenericResponse.fromJson(res);
  }
}

String extractFirst100Words(String input) {
  List<String> words = input.split(' ');
  if (words.length > 50) {
    return words.sublist(0, 50).join(' ');
  } else {
    return input;
  }
}

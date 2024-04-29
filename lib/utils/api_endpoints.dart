class ApiEndpoints {
  //UserIdentity
  static const register = "auth/register";
  static const signIn = "auth/authenticate";

  ///Wallet
  static const fundWallet = "wallet/fund";
  static const createWaller = "wallet";

  ///Reading
  static const updateReadingPage = "reading/update-reading-page";
  static const completeBook = "reading/complete-book";
  static const startReading = "reading";
  // static const removeReading =  "reading/remove-reading";
  static const getAllUserReadings = "reading/get-all-user-readings";

  ///Book
  // static const updateBookStatus =  "book/{id}/update-book-status";
  static const getAllBooks = "book";
  static const getBookById = "book/get-book-by-id";
  // static const fundWallet =  ;
  // static const fundWallet =  ;
  // static const fundWallet =  ;
  // static const fundWallet =  ;
  // static const fundWallet =  ;
  ///
  ///
  ///

  static const weatherForcast = "WeatherForecast";
  // static const register = "UserIdentity/create-user";

  static const uploadMobileNumber = "UserIdentity/upload-mobile-number";
  static const uploadUserName = "UserIdentity/upload_user-name";
  static const uploadDateOfBirth = "UserIdentity/upload_user-birthday";
  static const uploadGender = "UserIdentity/upload_user-gender";
  static const uploadUserImage = "UserIdentity/upload-single-user-image";
  static const deleteUserImage = "UserIdentity/delete-user-image";
  static const uploadUserInterests = "UserIdentity/upload_user-interests";

  //MATCHES
  static const getUsersForMatching = "Matches/get-all-users-for-matching";
}

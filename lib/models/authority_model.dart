class AuthorityModel {
  String authority;

  AuthorityModel({
    required this.authority,
  });

  factory AuthorityModel.fromJson(Map<String, dynamic> json) {
    return AuthorityModel(
      authority: json['authority'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
    };
  }
}

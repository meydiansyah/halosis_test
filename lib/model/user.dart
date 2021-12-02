class UserModel {
  String? email;
  String? firstName;
  String? lastName;
  String? imageUrl;

  UserModel({this.email, this.firstName, this.lastName, this.imageUrl});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json['email'] ?? "",
        firstName: json['first_name'] ?? "",
        lastName: json['last_name'] ?? "",
        imageUrl: json['avatar'] ?? "",
      );
}

class User {
  User({
    required this.id,
    required this.firstName,
    required this.profilePicture,
  });

  int id;
  String firstName;
  String profilePicture;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        profilePicture: json["profile_picture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "profile_picture": profilePicture,
      };
}

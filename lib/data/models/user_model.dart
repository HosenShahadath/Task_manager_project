class UserModel {
  late final String id;
  late final String email;
  late final String firstName;
  late final String lastName;
  late final String mobile;
  late final String createdData;
  late final String photo;

  // Named Constructor
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    email = json['email'] ?? '';
    firstName = json['firstName'] ?? '';
    lastName = json['lastName'] ?? '';
    mobile = json['mobile'] ?? '';
    createdData = json['createdData'] ?? '';
    photo = json['photo'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'mobile': mobile,
      'createdData': createdData,
      'photo': photo,
    };
  }

  String get fullName {
    return '$firstName $lastName';
  }
}

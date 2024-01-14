Map<String, dynamic> user = {
  "user_id": 11,
  "name": "Hasan",
  "surname": "Akdemir",
  "email": "mail@gmail.com",
  "phone": "0550 550 50 50",
  "city": "Kayseri"
};

class UserInfoModel {
  int? userId;
  String? name;
  String? surname;
  String? email;
  String? phone;
  String? city;
  UserInfoModel({
    this.userId,
    this.name,
    this.surname,
    this.email,
    this.phone,
    this.city,
  });

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    userId = json["user_id"];
    name = json["name"];
    surname = json["surname"];
    email = json["email"];
    phone = json["phone"];
    city = json["city"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json["user_id"] = userId;
    json["name"] = name;
    json["surname"] = name;
    json["email"] = name;
    json["phone"] = name;
    json["city"] = name;

    return json;
  }
}

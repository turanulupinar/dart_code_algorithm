Map<String, dynamic> user = {
  "user_id": "11",
  "name": "Hasan",
  "surname": "Akdemir",
  "email": "mail@gmail.com",
  "phone": "0550 550 50 50",
  "city": "Kayseri"
};

class UserInfoModel {
  int? id;
  String? name;
  String? surname;
  String? email;
  String? phone;
  String? city;
  UserInfoModel({
    this.id,
    this.name,
    this.surname,
    this.email,
    this.phone,
    this.city,
  });

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    surname = json["surname"];
    email = json["email"];
    phone = json["phone"];
    city = json["city"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json["id"] = id;
    json["name"] = name;
    json["surname"] = name;
    json["email"] = name;
    json["phone"] = name;
    json["city"] = name;

    return json;
  }
}



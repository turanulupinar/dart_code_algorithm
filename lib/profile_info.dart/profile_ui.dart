import 'package:dart_code_algorithms/profile_info.dart/shared_data.dart';
import 'package:dart_code_algorithms/profile_info.dart/user_data.dart';
import 'package:flutter/material.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  void initState() {
    init();
    super.initState();
  }

  UserInfoModel? userModel;
  final SharedPreferancesDataMethods _pref = SharedPreferancesDataMethods();

  init() async {
    userModel = UserInfoModel.fromJson(user);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("profil"),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(userModel?.name ?? "asd"),
            leading: Text(userModel?.userId.toString() ?? "sadas"),
            subtitle: Text(userModel?.surname ?? "asd"),
            trailing: Text(userModel?.city ?? "aasdsd"),
          )
        ],
      ),
    );
  }
}

// -   {     "user_id": "11", “name”: "Hasan”,  “surname”: "Akdemir",   "email": "mail@mail.com", “phone”: "0550 550 50 50",    “city”: "Kayseri”} bu json 
//sharedpreferens yaklaşımı ile “user_info” keyi ile telefon hafızasına kaydedin. 
//Ardından tekrar telefon hafızasından getirerek UserModel objesi oluşturarak objeye bilgileri aktarın.
// Ardından objenin fieldlarını ekrana yazınız.



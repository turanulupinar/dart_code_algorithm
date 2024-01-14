import 'dart:convert';
import 'dart:developer';

import 'package:dart_code_algorithms/profile_info.dart/shared_data.dart';
import 'package:dart_code_algorithms/profile_info.dart/user_data.dart';
import 'package:flutter/material.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  bool? isSaved;

  List<UserInfoModel?>? userModelList;

  final SharedPreferancesDataMethods _pref = SharedPreferancesDataMethods();

  getUserData() async {
    List<String?>? data = await _pref.getUserListData();
    userModelList = data?.map((e) {
      log(e.toString());
      return UserInfoModel.fromJson(jsonDecode(e ?? ""));
    }).toList();

    log(userModelList.toString());

    setState(() {});
  }

  @override
  void initState() {
    getUserData();
    // _pref.deleteUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("profil"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (userModelList?.isEmpty == true)
            const Text(
              "Henüz bir kullanıcı yok!",
              textAlign: TextAlign.center,
            ),
          ...userModelList
                  ?.map((user) => ListTile(
                        title: Text(user?.name ?? "null"),
                        leading: Text(user?.userId.toString() ?? "null"),
                        subtitle: Text(user?.surname ?? "asd"),
                        trailing: Text(user?.city ?? "aasdsd"),
                      ))
                  .toList() ??
              [],
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33),
            child: ElevatedButton.icon(
                onPressed: () async {
//TODO
// Bir pop up veya yeni sayfa açılsın. Ve o sayfada bizim usermodelimize göre bir textformfield alanı
//olsun. girilen bilgilerden sonra listeye bu son girilen kişi eklensin. Sonra popup kapanınca veya
// sayfadan geri gelince güncel veriler getirilsin. Ama bu güncel verilen hemen gelmesin.
// 2 saniye sonra loadingten sonra gelsin

                  setState(() {
                    isSaved = false;
                  });
                  await Future.delayed(const Duration(seconds: 1));

                  List<String> userlist = userModelList
                          ?.map((e) => jsonEncode(e?.toJson()))
                          .toList() ??
                      [];
                  final res = await _pref.saveUserListData(userlist);
                  await getUserData();
                  setState(() {
                    isSaved = res;
                  });
                },
                icon: isSaved == false
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: Center(
                            child: CircularProgressIndicator(
                          color: Colors.purple,
                          strokeWidth: 2,
                        )),
                      )
                    : const Icon(Icons.save),
                label: const Text("Yeni Kullanıcı Kaydet")),
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



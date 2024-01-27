import 'dart:convert';
import 'dart:developer';

import 'package:dart_code_algorithms/profile_info.dart/shared_data.dart';
import 'package:dart_code_algorithms/profile_info.dart/update_user_page.dart';
import 'package:dart_code_algorithms/profile_info.dart/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../custom_widgets/custom_show_dialog.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  
  

  bool? isSaved;

  List<UserInfoModel?>? userModelList;

  final SharedPreferancesDataMethods _pref = SharedPreferancesDataMethods();
 

  Future<List<UserInfoModel?>?> getUserData() async {
    List<String?>? data = await _pref.getUserListData();
    userModelList = data?.map((e) {
      log(e.toString());
      return UserInfoModel.fromJson(jsonDecode(e ?? ""));
    }).toList();
    setState(() {});
    return userModelList;
  }

  String? defaultDropDownMenuItem = "mersin";

  @override
  void initState() {
    getUserData();

    // _pref.deleteUserData();
    super.initState();
  }

  // şimdilik işimize yaramıyor...............

  // Future<List<UserInfoModel?>?> getUserModelData() async {
  //   UserInfoModel userModel = UserInfoModel(
  //       name: nameController.text,
  //       surname: surnameController.text,
  //       userId: int.tryParse(idController.text),
  //       city: cityController.text,
  //       email: mailController.text,
  //       phone: phoneController.text);

  //   // String newUser = jsonEncode(userModel.toJson());
  //   userModelList?.add(userModel);
  //   List<String> newUserList = userModelList
  //           ?.map((userModel) => jsonEncode(userModel?.toJson()))
  //           .toList() ??
  //       [];

  //   await _pref.saveUserListData(newUserList);
  //   return userModelList;
  // }

  Future<List<UserInfoModel?>?> saveUserModelData() async {
    List<String> newUserList = userModelList
            ?.map((userModel) => jsonEncode(userModel?.toJson()))
            .toList() ??
        [];
    await _pref.saveUserListData(newUserList);
    return userModelList;
  }

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: const Text("profil"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
          await getUserData();
        },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: scrollController,
          children: [
            if (userModelList?.isEmpty == true)
              const Text(
                "Henüz bir kullanıcı yok!",
                textAlign: TextAlign.center,
              ),
            ...List.generate(userModelList?.length ?? 0, (index) {
              final  item = userModelList?[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    dense: true,
                    tileColor: index.isEven
                        ? Colors.grey.shade300
                        : Colors.grey.shade100,
                    title: Text("${item?.name} ${item?.surname}"),
                    leading: Text(item?.userId.toString() ?? "null"),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email: ${item?.surname}"),
                        Text("Tel: ${item?.phone}"),
                        Text("Şehir:${item?.city}"),
                      ],
                    ),
                    trailing: SizedBox(
                      width: 150,
                      height: 40,
                      child: Row(
                        children: [
                          TextButton(
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Güncelle",
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                            onPressed: () async {
                              if (userModelList?[index] != null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UpdateUserPage(
                                      
                                              username:
                                                  item?.surname.toString(),
                                              name: item?.name.toString(),
                                              id: int.tryParse(
                                                  item?.userId.toString() ??
                                                      ""),
                                              email: item?.email.toString(),
                                              phone: item?.phone.toString(),
                                              city: item?.city.toString(),
                                            )));
                              }

                              // userModelList?[index] = UserInfoModel(
                              //     name: nameController.text,
                              //     surname: surnameController.text,
                              //     city: cityController.text,
                              //     email: mailController.text,
                              //     phone: phoneController.text,
                              //     userId: int.tryParse(idController.text));

                              // setState(() {});
                              // saveUserModelData();

                              // ------------------------------

                              // if (userModelList?[index] != null) {
                              //   final updatedUser = await MyUserAddDialog()
                              //       .showMyUpdateUserDialog(
                              //           context, userModelList![index]!);
                              //   log(updatedUser.toString());

                              //   userModelList![index] = updatedUser;
                              //   await saveUserModelData();
                              //   setState(() {});
                              //   log(updatedUser.toString());
                              // }
                            },
                          ),
                          TextButton(
                            child: const Text(
                              "Sil",
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () async {
                              userModelList?.remove(item);
                              await saveUserModelData();
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    )),
              );
            }).toList(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33),
              child: ElevatedButton.icon(
                  onPressed: () async {
                    userModelList =
                        await MyUserAddDialog().showMyUserAddDialog(context) ??
                            userModelList;
                    setState(() {});
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
      ),
    );
  }
}

List<Map<int, String>> city = [
  {01: "adana"},
  {02: "ankara"},
  {03: "mersin"},
  {04: "elazığ"},
  {05: "adıyaman"},
  {06: "konya"}
];

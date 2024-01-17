import 'dart:convert';
import 'dart:developer';

import 'package:dart_code_algorithms/profile_info.dart/shared_data.dart';
import 'package:dart_code_algorithms/profile_info.dart/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  TextEditingController cityController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
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

    // userModelList?.addAll();

    setState(() {});
  }

  @override
  void initState() {
    getUserData();
    // _pref.deleteUserData();
    super.initState();
  }

  Future getUserModelData() async {
    UserInfoModel userModel = UserInfoModel(
        name: nameController.text,
        surname: surnameController.text,
        userId: int.tryParse(idController.text),
        city: cityController.text,
        email: mailController.text,
        phone: phoneController.text);

    String userdata = jsonEncode(userModel);
    List<String> heksamodal =
        userModelList?.map((e) => e?.toJson().toString() ?? "").toList() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
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
                  ?.map((e) => ListTile(
                        title: Text(e?.name ?? "null"),
                        leading: Text(e?.userId.toString() ?? "null"),
                        subtitle: Text(e?.surname ?? "null"),
                        trailing: Text(e?.city ?? "null"),
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
                  showDialog(
                      barrierColor: Colors.purple,
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("kullanıcı ekle"),
                          content: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.6,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  CustomTextFormField(
                                    keywordtype: TextInputType.number,
                                    title: "Numara",
                                    textController: idController,
                                  ),
                                  CustomTextFormField(
                                    // val: (nameVal) {
                                    //   if (nameVal?.isEmpty == true) {
                                    //     "boş değer girmeyin";
                                    //   }
                                    //   return null;
                                    // },
                                    title: "adı",
                                    textController: nameController,
                                  ),
                                  CustomTextFormField(
                                    title: "Soyadı",
                                    textController: surnameController,
                                    val: (surVal) {
                                      if (surVal?.isEmpty == true) {
                                        "boş değer girmeyin";
                                      }
                                      return null;
                                    },
                                  ),
                                  CustomTextFormField(
                                    title: "e posta",
                                    // val: (mailVal) {
                                    //   if (mailVal?.contains("@") == false ||
                                    //       mailVal?.contains(".com") == false) {
                                    //     return "E-Mail adresinizi kontrol edin";
                                    //   }
                                    //   return null;
                                    // },
                                    textController: mailController,
                                  ),
                                  CustomTextFormField(
                                    helperText: "550 555 5555",
                                    title: "telefon",
                                    // val: (phoneVal) {
                                    //   if (phoneVal?.split("").length != 10) {
                                    //     return "telefon numarasını kontrol edin";
                                    //   }
                                    //   return null;
                                    // },
                                    textController: phoneController,
                                  ),
                                  CustomTextFormField(
                                    title: "şehir",
                                    textController: cityController,
                                    // val: (cityVal) {
                                    //   if (city.contains(cityController.text
                                    //           .toLowerCase()) ==
                                    //       false) {
                                    //     return "şehir adını doğru giriniz";
                                    //   }
                                    //   return null;
                                    // },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton.icon(
                                      onPressed: () async {
                                        if (_formKey.currentState?.validate() ==
                                            false) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content: Text('hata')),
                                          );
                                          return;
                                        } else {
                                          log("asdasd");
                                          getUserModelData();
                                        }

                                        setState(() {});
                                      },
                                      icon: const Icon(
                                          Icons.account_circle_rounded),
                                      label: const Text("kaydet"))
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                  setState(() {});

                  // setState(() {
                  //   isSaved = false;
                  // });
                  // await Future.delayed(const Duration(seconds: 1));

                  // List<String> userlist = userModelList
                  //         ?.map((e) => jsonEncode(e?.toJson()))
                  //         .toList() ??
                  //     [];
                  // final res = await _pref.saveUserListData(userlist);
                  // await getUserData();
                  // setState(() {
                  //   isSaved = res;
                  // });
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

// TODO
// Bir pop up veya yeni sayfa açılsın. Ve o sayfada bizim usermodelimize göre bir textformfield alanı
//olsun. girilen bilgilerden sonra listeye bu son girilen kişi eklensin. Sonra popup kapanınca veya
// sayfadan geri gelince güncel veriler getirilsin. Ama bu güncel verilen hemen gelmesin.
// 2 saniye sonra loadingten sonra gelsin

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.title,
      this.val,
      this.textController,
      this.maxLenght,
      this.keywordtype,
      this.helperText});
  final String title;
  final String? Function(String?)? val;
  final TextEditingController? textController;
  final int? maxLenght;
  final String? helperText;
  final TextInputType? keywordtype;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLenght,
      controller: textController,
      decoration: InputDecoration(hintText: title, helperText: helperText),
      validator: val,
      keyboardType: keywordtype,
    );
  }
}

List<String> city = [
  "adana",
  "ankara",
  "mersin",
  "elazığ",
  "adıyaman",
  "konya"
];

import 'dart:convert';
import 'dart:developer';

import 'package:dart_code_algorithms/profile_info.dart/profile_ui.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../profile_info.dart/shared_data.dart';
import '../profile_info.dart/user_data.dart';
import 'custom_dropdown_menu.dart';
import 'custom_text_form_field.dart';

class MyUserAddDialog {
  final SharedPreferancesDataMethods _pref = SharedPreferancesDataMethods();

  Future<List<UserInfoModel?>?> showMyUserAddDialog(
      BuildContext context) async {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    List<UserInfoModel?>? userModelList = [];
    TextEditingController idController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController surnameController = TextEditingController();
    TextEditingController mailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    String? selectedCity;
    Future<List<UserInfoModel?>?> saveUserModelData() async {
      UserInfoModel userModel = UserInfoModel(
          name: nameController.text,
          surname: surnameController.text,
          userId: int.tryParse(idController.text),
          city: selectedCity,
          email: mailController.text,
          phone: phoneController.text);

      userModelList?.add(userModel);
      List<String> newUserList = userModelList
              ?.map((userModel) => jsonEncode(userModel?.toJson()))
              .toList() ??
          [];
      await _pref.saveUserListData(newUserList);
      return userModelList;
    }

    Future<List<UserInfoModel?>?> getUserData() async {
      List<String?>? data = await _pref.getUserListData();
      userModelList = data?.map((e) {
        log(e.toString());
        return UserInfoModel.fromJson(jsonDecode(e ?? ""));
      }).toList();

      return userModelList;
    }

    return await showDialog<List<UserInfoModel?>?>(
        barrierDismissible: true,
        barrierColor: const Color.fromARGB(136, 63, 62, 62),
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("kullanıcı ekle"),
            content: SizedBox(
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTextFormField(
                        keywordtype: TextInputType.number,
                        title: "Numara",
                        textController: idController,
                      ),
                      CustomTextFormField(
                        val: (nameVal) {
                          if (nameVal?.isEmpty == true) {
                            "boş değer girmeyin";
                          }
                          return null;
                        },
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
                        val: (mailVal) {
                          if (mailVal?.contains("@") == false ||
                              mailVal?.contains(".com") == false) {
                            return "E-Mail adresinizi kontrol edin";
                          }
                          return null;
                        },
                        textController: mailController,
                      ),
                      CustomTextFormField(
                        helperText: "550 555 5555",
                        title: "telefon",
                        val: (phoneVal) {
                          if (phoneVal?.split("").length != 10) {
                            return "telefon numarasını kontrol edin";
                          }
                          return null;
                        },
                        textController: phoneController,
                      ),
                      Row(
                        children: [
                          Text(selectedCity ?? "Şehir Seçiniz"),
                          const SizedBox(
                            width: 4,
                          ),
                          CustomDropDownMenu(
                              dropDownVal: selectedCity,
                              onChanged: (val) {
                                selectedCity = val;
                              },
                              items: const [
                                "Ankara",
                                "İstanbul",
                                "Mersin",
                                "Muğla"
                              ])
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton.icon(
                          onPressed: () async {
                            if (formKey.currentState?.validate() == false ||
                                selectedCity == "") {
                              await Fluttertoast.showToast(
                                  msg: "Boş değer girmeyin",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              return;
                            }
                            await getUserData();
                            final List<UserInfoModel?>? checkList =
                                userModelList
                                    ?.where((element) =>
                                        element?.name?.toLowerCase() ==
                                            nameController.text.toLowerCase() &&
                                        element?.surname?.toLowerCase() ==
                                            surnameController.text
                                                .toLowerCase())
                                    .toList();

                            if (checkList?.isNotEmpty == true) {
                              await Fluttertoast.showToast(
                                  msg: "Bu isimde kayıtlı kişi zaten var!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              return;
                            }
                            await saveUserModelData()
                                .then((value) => Navigator.pop(context, value));
                          },
                          icon: const Icon(Icons.account_circle_rounded),
                          label: const Text("kaydet"))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Future<UserInfoModel?> showMyUpdateUserDialog(
      BuildContext context, UserInfoModel model) async {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    TextEditingController idController =
        TextEditingController(text: model.userId.toString());
    TextEditingController nameController =
        TextEditingController(text: model.name);
    TextEditingController surnameController =
        TextEditingController(text: model.surname);
    TextEditingController mailController =
        TextEditingController(text: model.email);
    TextEditingController phoneController =
        TextEditingController(text: model.phone);
    String? selectedCity = model.city;

    return await showDialog<UserInfoModel?>(
        barrierDismissible: true,
        barrierColor: const Color.fromARGB(136, 63, 62, 62),
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("kullanıcıyı Güncelle"),
            content: SizedBox(
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTextFormField(
                        keywordtype: TextInputType.number,
                        title: "Numara",
                        textController: idController,
                      ),
                      CustomTextFormField(
                        val: (nameVal) {
                          if (nameVal?.isEmpty == true) {
                            "boş değer girmeyin";
                          }
                          return null;
                        },
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
                        val: (mailVal) {
                          if (mailVal?.contains("@") == false ||
                              mailVal?.contains(".com") == false) {
                            return "E-Mail adresinizi kontrol edin";
                          }
                          return null;
                        },
                        textController: mailController,
                      ),
                      CustomTextFormField(
                        helperText: "550 555 5555",
                        title: "telefon",
                        val: (phoneVal) {
                          if (phoneVal?.split("").length != 10) {
                            return "telefon numarasını kontrol edin";
                          }
                          return null;
                        },
                        textController: phoneController,
                      ),
                      Row(
                        children: [
                          Text(selectedCity.toString()),
                          const SizedBox(
                            width: 4,
                          ),
                          CustomDropDownMenu(
                              onChanged: (p0) {
                                selectedCity = p0;
                              },
                              dropDownVal: selectedCity,
                              items: const [
                                "Ankara",
                                "İstanbul",
                                "Mersin",
                                "Muğla"
                              ])
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton.icon(
                          onPressed: () async {
                            if (formKey.currentState?.validate() == false ||
                                selectedCity == "") {
                              await Fluttertoast.showToast(
                                  msg: "Boş değer girmeyin",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              return;
                            }

                            UserInfoModel updatedModel = UserInfoModel(
                                userId: int.tryParse(idController.text),
                                name: nameController.text,
                                surname: surnameController.text,
                                city: selectedCity,
                                phone: phoneController.text,
                                email: mailController.text);
                            Navigator.pop(context, updatedModel);
                          },
                          icon: const Icon(Icons.account_circle_rounded),
                          label: const Text("kaydet"))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

import 'dart:convert';

import 'package:dart_code_algorithms/custom_widgets/custom_dropdown_menu.dart';
import 'package:dart_code_algorithms/custom_widgets/custom_text_form_field.dart';
import 'package:dart_code_algorithms/profile_info.dart/profile_ui.dart';

import 'package:dart_code_algorithms/profile_info.dart/shared_data.dart';
import 'package:dart_code_algorithms/profile_info.dart/user_data.dart';
import 'package:flutter/material.dart';

class UpdateUserPage extends StatefulWidget {
  const UpdateUserPage(
      {super.key,
      this.email,
      this.city,
      this.name,
      this.phone,
      this.username,
      this.id});

  final String? name;
  final String? username;
  final String? city;
  final String? email;
  final String? phone;
  final int? id;

  @override
  State<UpdateUserPage> createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  profileSettingSavePreferances() async {
    List<String?>? decodeList = await pref.getUserListData();
    userModelList = decodeList
        ?.map((e) => UserInfoModel.fromJson(jsonDecode(e ?? "")))
        .toList();

    setState(() {});
  }

  profileSettingGetPreferances() async {
    List<String?>? decodeList = await pref.getUserListData();
    userModelList = decodeList
        ?.map((e) => UserInfoModel.fromJson(jsonDecode(e ?? "")))
        .toList();
    setState(() {});
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<UserInfoModel?>? userModelList;

  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  static UserInfoModel updatemodel = UserInfoModel();
  String? selectedCity = updatemodel.city;

  @override
  void initState() {
    profileSettingGetPreferances();
    setState(() {});
    super.initState();
  }

  SharedPreferancesDataMethods pref = SharedPreferancesDataMethods();

  TextStyle fontstyle = const TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kullanıcı Güncelle"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: 200,
                width: 300,
                child: Card(
                  color: const Color.fromARGB(255, 46, 45, 42),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.name.toString(),
                        style: fontstyle,
                      ),
                      Text(widget.username.toString(), style: fontstyle),
                      Text(widget.city.toString(), style: fontstyle),
                      Text(widget.phone.toString(), style: fontstyle),
                      Text(widget.email.toString(), style: fontstyle),
                      Text(widget.id.toString(), style: fontstyle),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(
                    textController: nameController,
                    title: widget.name.toString(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(
                    textController: surnameController,
                    title: widget.username.toString(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(
                    textController: phoneController,
                    title: widget.phone.toString(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(
                    textController: mailController,
                    title: widget.email.toString(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(
                    textController: idController,
                    title: widget.id.toString(),
                    oneEditingComplate: () {
                      // ?????
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("şehir seçiniz"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    CustomDropDownMenu(
                      dropDownVal: selectedCity,
                      onChanged: (val) {
                        selectedCity == val;
                      },
                      items: city.map((e) => e.values).toList(),
                    ),
                  ],
                )
              ],
            ),
            ElevatedButton(
                onPressed: () {
                      UserInfoModel newUpdateModel = UserInfoModel(
                        userId: int.tryParse(idController.text),
                        name: nameController.text,
                        surname: surnameController.text,
                        city: selectedCity,
                        phone: phoneController.text,
                        email: mailController.text);

                  profileSettingSavePreferances();
                  profileSettingGetPreferances();
                  setState(() {});
                },
                child: const Text("güncelle"))
          ],
        ),
      ),
    );
  }
}

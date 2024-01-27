import 'dart:convert';

import 'package:dart_code_algorithms/custom_widgets/custom_dropdown_menu.dart';
import 'package:dart_code_algorithms/custom_widgets/custom_text_form_field.dart';

import 'package:dart_code_algorithms/profile_info.dart/shared_data.dart';
import 'package:dart_code_algorithms/profile_info.dart/user_data.dart';
import 'package:flutter/material.dart';

import 'profile_ui.dart';

class UpdateUserPage extends StatefulWidget {
  const UpdateUserPage({
    super.key,
    required this.userModel,
  });
  final UserInfoModel userModel;

  @override
  State<UpdateUserPage> createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  UserInfoModel model = UserInfoModel();

  SharedPreferancesDataMethods pref = SharedPreferancesDataMethods();

  TextStyle fontstyle = const TextStyle(color: Colors.white);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  late String? selectedCity;

  bool isEdit = false;
  @override
  void initState() {
    model = widget.userModel;

    initData();
    super.initState();
  }

  initData() {
    idController = TextEditingController(text: model.userId.toString());
    nameController = TextEditingController(text: model.name);
    surnameController = TextEditingController(text: model.surname);
    mailController = TextEditingController(text: model.email);
    phoneController = TextEditingController(text: model.phone);
    selectedCity = model.city;
    setState(() {});
  }

  isChanged(val) {
    setState(() {
      isEdit = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: isEdit == false,
      onPopInvoked: (didPop) async {
        if (isEdit == true) {
          await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text("Uyarı!"),
                    content: const Text(
                        "Yaptığınız değişikler algılandı! Kaydetmeden çıkmak istediğinizden emin misiniz?"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: const Text("Evet")),
                      const SizedBox(
                        width: 12,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Hayır")),
                    ],
                  ));
        }
      },
      child: Scaffold(
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
                          model.name.toString(),
                          style: fontstyle,
                        ),
                        Text(model.userId.toString(), style: fontstyle),
                        Text(model.surname.toString(), style: fontstyle),
                        Text(model.city.toString(), style: fontstyle),
                        Text(model.phone.toString(), style: fontstyle),
                        Text(model.email.toString(), style: fontstyle),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                          label: "User ID",
                          textController: idController,
                          title: model.userId.toString(),
                          onChanged: isChanged),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextFormField(
                          label: "Ad",
                          textController: nameController,
                          title: model.name.toString(),
                          onChanged: isChanged),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextFormField(
                          label: "Soyad",
                          textController: surnameController,
                          title: model.surname.toString(),
                          onChanged: isChanged),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextFormField(
                          label: "Telefon",
                          textController: phoneController,
                          title: model.phone.toString(),
                          onChanged: isChanged),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextFormField(
                          label: "Email",
                          textController: mailController,
                          title: model.email.toString(),
                          onChanged: isChanged),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Şehir Seçiniz"),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                          ),
                          CustomDropDownMenu(
                              dropDownVal: selectedCity,
                              onChanged: (val) {
                                selectedCity = val;
                              },
                              items: const ["Ankara", "İstanbul", "İzmir"]),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              if (isEdit == true)
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        model = UserInfoModel(
                            userId: int.tryParse(idController.text),
                            name: nameController.text,
                            surname: surnameController.text,
                            city: selectedCity,
                            phone: phoneController.text,
                            email: mailController.text);

                        Navigator.pop(context, model);
                      },
                      child: const Text("güncelle")),
                ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

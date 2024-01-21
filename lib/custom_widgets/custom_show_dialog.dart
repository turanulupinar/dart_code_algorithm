// import 'package:dart_code_algorithms/custom_widgets/custom_dropdown_menu.dart';
// import 'package:dart_code_algorithms/custom_widgets/custom_text_form_field.dart';
// import 'package:dart_code_algorithms/profile_info.dart/profile_ui.dart';
// import 'package:dart_code_algorithms/profile_info.dart/user_data.dart';
// import 'package:flutter/material.dart';

// void showCustomDailog(BuildContext context) {
//   showDialog<List<UserInfoModel?>?>(
//       barrierDismissible: false,
//       barrierColor: const Color.fromARGB(136, 63, 62, 62),
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text("kullanıcı ekle"),
//           content: SizedBox(
//             child: Form(
//               key: _formKey,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     CustomTextFormField(
//                       keywordtype: TextInputType.number,
//                       title: "Numara",
//                       textController: idController,
//                     ),
//                     CustomTextFormField(
//                       // val: (nameVal) {
//                       //   if (nameVal?.isEmpty == true) {
//                       //     "boş değer girmeyin";
//                       //   }
//                       //   return null;
//                       // },
//                       title: "adı",
//                       textController: nameController,
//                     ),
//                     CustomTextFormField(
//                       title: "Soyadı",
//                       textController: surnameController,
//                       val: (surVal) {
//                         if (surVal?.isEmpty == true) {
//                           "boş değer girmeyin";
//                         }
//                         return null;
//                       },
//                     ),
//                     CustomTextFormField(
//                       title: "e posta",
//                       // val: (mailVal) {
//                       //   if (mailVal?.contains("@") == false ||
//                       //       mailVal?.contains(".com") == false) {
//                       //     return "E-Mail adresinizi kontrol edin";
//                       //   }
//                       //   return null;
//                       // },
//                       textController: mailController,
//                     ),
//                     CustomTextFormField(
//                       helperText: "550 555 5555",
//                       title: "telefon",
//                       // val: (phoneVal) {
//                       //   if (phoneVal?.split("").length != 10) {
//                       //     return "telefon numarasını kontrol edin";
//                       //   }
//                       //   return null;
//                       // },
//                       textController: phoneController,
//                     ),
//                     Row(
//                       children: [
//                         Text(defaultDropDownMenuItem.toString()),
//                         CustomDropDownMenu(
//                           dropDownVal: defaultDropDownMenuItem,
//                           items: city,
//                         )
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     ElevatedButton.icon(
//                         onPressed: () async {
//                           if (nameController.text
//                                   .contains(userModelList.toString()) ==
//                               true) {
//                             return;
//                           }
//                           if (_formKey.currentState?.validate() == false) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(content: Text('hata')),
//                             );
//                             return;
//                           }

//                           return await getUserModelData()
//                               .then((val) => Navigator.pop(context, val));
//                         },
//                         icon: const Icon(Icons.account_circle_rounded),
//                         label: const Text("kaydet"))
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       });
// }

import 'dart:developer';

import 'package:dart_code_algorithms/dart_examples/compact_white_space.dart';
import 'package:dart_code_algorithms/dart_examples/list_squared.dart';
import 'package:dart_code_algorithms/dart_examples/type_map.dart';
import 'package:dart_code_algorithms/dart_examples/words.dart';
import 'package:dart_code_algorithms/profile_info.dart/profile_ui.dart';
import 'package:flutter/material.dart';
import '../extension/extensions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dart Code Algorithm Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> sports = ['kriket', 'futbol', 'tenis', 'beyzbol'];
  var mixList = [1, "a", 2, "b", 3, "c", 4, "d"];
  String? result;
  List<num> items = [5, 5, 5, 5, 5];
  List<dynamic> items2 = [
    "s",
    "b",
    null,
    4,
    null,
    " ",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileInfo()));
              },
              child: const Text("profile"))
        ],
        title: const Text("Code Algorithms"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: onPressed,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    (result ?? "İşlem başlat").toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontSize: 18),
                  ),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onPressed(),
        child: const Icon(Icons.add),
      ),
    );
  }

  onPressed() {
    result = intOutput(mixList, String).toString();
    setState(() {});
  }
}




 


//   onPressed() {
 
//     Student student2;
//     var student = Student(
//         name: "Fahri",
//         surname: "Dursun",
//         classroom: 3,
//         lesson: Lesson("ders yapıldı"));

//      student2 = student..name = "Ahmet";

//     result = name.toString();

//     setState(() {});
//   }
// class Student {
//   String? name;
//   String? surname;
//   int? classroom;
//   Lesson? lesson;
//   Student({this.name, this.surname, this.classroom, this.lesson});

//   @override
//   String toString() {
//     return 'Student(name: $name, surname: $surname, classroom: $classroom, lesson: $lesson)';
//   }
// }

// class Lesson {
//   String? turkce;
//   Lesson(this.turkce);

//   @override
//   String toString() => 'Lesson(turkce: $turkce)';
// }

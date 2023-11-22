import 'dart:developer';

import 'package:dart_code_algorithms/dart_examples/truncate.dart';
import 'package:dart_code_algorithms/dart_examples/union.dart';
import 'package:dart_code_algorithms/dart_examples/words.dart';
import 'package:flutter/material.dart';

import 'package:dart_code_algorithms/dart_examples/all.dart';
import 'package:dart_code_algorithms/dart_examples/all_equal.dart';
import 'package:dart_code_algorithms/dart_examples/avarage.dart';
import 'package:dart_code_algorithms/dart_examples/capitalize.dart';
import 'package:dart_code_algorithms/dart_examples/compact.dart';
import 'package:dart_code_algorithms/dart_examples/digitize.dart';
import 'package:dart_code_algorithms/dart_examples/distinct_items.dart';
import 'package:dart_code_algorithms/dart_examples/everyNth.dart';
import 'package:dart_code_algorithms/dart_examples/have_same_contents.dart';
import 'package:dart_code_algorithms/dart_examples/initial.dart';
import 'package:dart_code_algorithms/dart_examples/intersection.dart';
import 'package:dart_code_algorithms/dart_examples/is_anagram.dart';
import 'package:dart_code_algorithms/dart_examples/is_include_any.dart';
import 'package:dart_code_algorithms/dart_examples/list_head.dart';
import 'package:dart_code_algorithms/dart_examples/map_list.dart';
import 'package:dart_code_algorithms/dart_examples/map_string.dart';
import 'package:dart_code_algorithms/dart_examples/max.dart';
import 'package:dart_code_algorithms/dart_examples/most_frequent.dart';
import 'package:dart_code_algorithms/dart_examples/none.dart';
import 'package:dart_code_algorithms/dart_examples/radsToDegrees.dart';
import 'package:dart_code_algorithms/dart_examples/random_double_in_range.dart';
import 'package:dart_code_algorithms/dart_examples/random_int_in_range.dart';
import 'package:dart_code_algorithms/dart_examples/reversed_string.dart';
import 'package:dart_code_algorithms/dart_examples/slice.dart';
import 'package:dart_code_algorithms/dart_examples/some.dart';
import 'package:dart_code_algorithms/dart_examples/split_lines.dart';
import 'package:dart_code_algorithms/dart_examples/sum.dart';
import 'package:dart_code_algorithms/dart_examples/symetric_list.dart';
import 'package:dart_code_algorithms/dart_examples/tc_verify.dart';

import 'dart_examples/count_item_to_map.dart';
import 'dart_examples/drop_item.dart';
import 'dart_examples/filter_unique_item.dart';
import 'dart_examples/flatten.dart';
import 'dart_examples/group_by.dart';
import 'dart_examples/is_include_all.dart';
import 'dart_examples/last.dart';
import 'dart_examples/mask.dart';
import 'dart_examples/random_listint_in_range.dart';
import 'dart_examples/sample_item_from_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    String sentence =
        "Ben\nher sabah\nkalkar\nve % #  2 adet yüzümü\nyıkarım öncelikle";
    List<String> list = ["Elma", "Armut", "Çilek", "Avakado meyvesi", "Muz"];
    List<String> letters = ["a", "b", "c", "b", "d", "e", "f", "g", "h"];
    List<Map<String, dynamic>> numbers = [
      {"x": 12},
      {"y": 13},
      {"x": 14},
      {"y": 11},
      {"z": 33}
    ];

    List<Map<String, dynamic>> numbers2 = [
      {"x": 2},
      {"y": 3},
      {"x": 4},
      {"y": 12},
      {"z": 16}
    ];

    result = words(sentence.replaceAll("\n", " ")).toString();

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

import 'package:dart_code_algorithms/dart_examples/all.dart';
import 'package:dart_code_algorithms/dart_examples/all_equal.dart';
import 'package:dart_code_algorithms/dart_examples/avarage.dart';
import 'package:dart_code_algorithms/dart_examples/capitalize.dart';
import 'package:dart_code_algorithms/dart_examples/compact.dart';
import 'package:dart_code_algorithms/dart_examples/digitize.dart';
import 'package:dart_code_algorithms/dart_examples/tc_verify.dart';
import 'package:flutter/material.dart';

import 'dart_examples/count_item_to_map.dart';
import 'dart_examples/filter_unique_item.dart';
import 'dart_examples/flatten.dart';
import 'dart_examples/group_by.dart';

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
              child: Text(
                (result ?? "İşlem başlat").toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              onPressed: () {
                List list = ["Elma", "Armut", "Çilek", "Avakado", "Muzo"];

                Map res = groupBy(list,
                    (value) => value.toString().toLowerCase().contains("a"));
                result = res.toString();

                setState(() {});
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          List list = ["a", "b", "d", "a", "c", "a", "a", "b", "d"];

          result = countItemToMap(list).toString();

          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

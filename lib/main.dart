import 'package:dart_code_algorithms/dart_examples/all.dart';
import 'package:dart_code_algorithms/dart_examples/all_equal.dart';
import 'package:dart_code_algorithms/dart_examples/avarage.dart';
import 'package:dart_code_algorithms/dart_examples/capitalize.dart';
import 'package:dart_code_algorithms/dart_examples/compact.dart';
import 'package:dart_code_algorithms/dart_examples/digitize.dart';
import 'package:dart_code_algorithms/dart_examples/tc_verify.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

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
        title: Text(widget.title),
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
                result = compact(items2, param: "b").toString();
                setState(() {});
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int tc = 54877017852;
          result = tcVerfyAlternative(tc);

          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

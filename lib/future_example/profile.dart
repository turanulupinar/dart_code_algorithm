// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dart_code_algorithms/future_example/future_example.dart';
import 'package:flutter/material.dart';

class ProfileDart extends StatefulWidget {
  const ProfileDart({super.key, required this.timeset});
  final int timeset;

  @override
  State<ProfileDart> createState() => _ProfileDartState();
}

class _ProfileDartState extends State<ProfileDart> {
  TotalTimeModel? model;
  @override
  void initState() {
    model = TotalTimeModel(time: model?.time ?? 150);
    super.initState();
  }

  bool messageNotification = true;
  late TextStyle? style =
      Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(backgroundColor: Colors.red, radius: 50),
            const SizedBox(
              height: 20,
            ),
            Text(
              "bilgiler",
              style: style?.copyWith(fontSize: 30),
            ),
            Text(
              "toplam zaman :  ${model?.time}",
              style: style,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "motivasyon mesajı",
                  style: style,
                ),
                Switch(
                    value: messageNotification,
                    onChanged: (val) {
                      messageNotification = val;
                      setState(() {});
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}

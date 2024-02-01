import 'dart:async';

import 'package:flutter/material.dart';

class FutureExamplePage extends StatefulWidget {
  const FutureExamplePage({super.key});

  @override
  State<FutureExamplePage> createState() => _FutureExamplePageState();
}

class _FutureExamplePageState extends State<FutureExamplePage>
    with SingleTickerProviderStateMixin {
  bool paused = false;

  Timer? _timer;
  int second = 0;
  int minute = 0;
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      reverseDuration: const Duration(milliseconds: 200),
      duration: const Duration(milliseconds: 200),
    );

    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);

    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      if (paused == false) {
        setState(() {
          second++;
        });
      }
    });
  }

  startTimer() {
    setState(() {
      paused = !paused;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Zamanlayıcı"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$second. Saniye"),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton.icon(
              label: Text(paused ? "Başlat" : "Durdur"),
              onPressed: () {
                paused ? controller.forward() : controller.reverse();
                startTimer();
              },
              icon: AnimatedIcon(
                  icon: AnimatedIcons.play_pause, progress: animation),
            ),
            const SizedBox(
              width: 50,
            ),
            SliderTheme(
              data: const SliderThemeData(
                trackHeight: 10,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
              ),
              child: Slider(
                activeColor: Colors.red,
                inactiveColor: Colors.black,
                value: second.toDouble(),
                divisions: 200,
                min: 0,
                max: 100,
                onChanged: (double val) async {
                  setState(() {
                    second = val.toInt();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TotalTimeModel {
  int? time;
  TotalTimeModel({
    required this.time,
  });
}

// class CustomSegment extends StatelessWidget {
//   const CustomSegment({super.key, required this.selected});
//   final Set<int> selected;

//   @override
//   Widget build(BuildContext context) {
//     return SegmentedButton(
//         onSelectionChanged: (val) {},
//         segments: [
//           ButtonSegment(value: 15, label: Text("onbeş")),
//           ButtonSegment(value: 30, label: Text("otuz")),
//           ButtonSegment(value: 40, label: Text("kırk"))
//         ],
//         selected: selected);
//   }
// }

//async functions
// Birden fazla yapılan işlemlerde, bu işlemler arasında iş parcacığının tamamlanması diğer işlemlerden farklı
// ise burada async function kullanılır. Yada kısa süre içerisinde gerçekleşmeyen
// zamana ihtiyac duyan işlemlerde yine async functionlar kullanılır

//TODO: ÖDEV
// iki adet zaman değişkeni tanımlayın. Saniye ve dakika değişkenleri.
// saniye 60'a ulaşınca dakika değişkeni 1 artsın. dakika değişkeni 2 dakika olunca
// süreniz doldu diye pop-up cıksın

//  Slider(
//               max: 100,
//               min: 0,
//               value: setTime,
//               onChanged: (val) {
//                 setTime = val;
//                 setState(() {});
//               }),
//           ElevatedButton(onPressed: () {}, child: const Text("saati ayarla")),

// ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                   // TODO: value yi tanımla:
//                                   content: Text(
//                                       "25 dakika doldu. 5 dakika mola verin! sıfırladıktan sonra tekrar başlatabilirsin ")));

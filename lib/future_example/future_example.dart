import 'package:dart_code_algorithms/future_example/profile.dart';
import 'package:flutter/material.dart';

class FutureExamplePage extends StatefulWidget {
  const FutureExamplePage({super.key});

  @override
  State<FutureExamplePage> createState() => _FutureExamplePageState();
}

class _FutureExamplePageState extends State<FutureExamplePage> {
  TotalTimeModel? item;
  @override
  void initState() {
    init();

    super.initState();
  }

  init() async {
    setState(() {
      item = TotalTimeModel(time: minute);
    });
  }

  Color? backgroundColorThenStart = Colors.purple;
  late TextStyle? stil = Theme.of(context)
      .textTheme
      .titleLarge
      ?.copyWith(color: Colors.black, fontSize: 50);

  bool backgroundChange = false;
  int currentNumber = 0;
  int endNumber = 10;
  int second = 0;
  int minute = 0;
  bool isDone = true;
  int succesValue = 0;
  int total = 0;
  bool once = true;

// toplam zaman

  totalTime() {
    setState(() {});
    return minute;
  }

// saniye + dakika
  Future secondFunction() async {
    for (var i = 0; i < 5; i++) {
      setState(() {
        currentNumber++;
        backgroundChange = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      if (i == 4) {
        setState(() {
          currentNumber = 0;
          minute++;
          i++;
        });
        setState(() {});
      }
    }
    return;
  }

// başarı etiketleri metodu

  Future<int> successfullMethods() async {
    if (minute == 3) {
      succesValue++;
      setState(() {});
    }
    if (minute == 5) {
      setState(() {});
      succesValue++;
    }
    if (minute == 8) {
      succesValue++;
    }
    return succesValue;
  }

  // segmented fonksiyon:

  Future stopTimer() async {}
  Future deleteTimer() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          backgroundChange == false ? Colors.white : backgroundColorThenStart,
      appBar: AppBar(
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileDart(
                            timeset: minute,
                          )));
            },
            child: const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              child: Icon(Icons.person),
            ),
          )
        ],
        title: const Text("Zamanlayıcı"),
        backgroundColor:
            backgroundChange == false ? Colors.white : backgroundColorThenStart,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: RichText(
                    text: TextSpan(
                        text: minute.toString(),
                        style: stil,
                        children: [
                  TextSpan(text: ":", style: stil),
                  TextSpan(text: currentNumber.toString(), style: stil)
                ]))),
            Text(item?.time.toString() ?? "null"),
            const SizedBox(
              height: 80,
            ),
            succesValue > 0
                ? SizedBox(
                    height: 200,
                    width: 200,
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(10),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: succesValue,
                      children: [
                        ...List.generate(succesValue, (int index) {
                          return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.teal[100],
                              ),
                              padding: const EdgeInsets.all(8),
                              child: const Image(
                                  image:
                                      AssetImage("assets/image/cactus.png")));
                        })
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
            Text(total.toString()),
            const Spacer(),
            once == true
                ? ElevatedButton.icon(
                    label: const Text("başlat"),
                    onPressed: () async {
                      once = false;
                      for (var i = 0; i < endNumber; i++) {
                        if (minute > 9) {
                          return;
                        }

                        await secondFunction();
                        setState(() {});
                        successfullMethods();
                        total = totalTime();
                        init();
                      }

                      setState(() {});
                    },
                    icon: const Icon(Icons.play_arrow))
                : ElevatedButton(
                    onPressed: () {}, child: const Text("sıfırla")),
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
                value: minute.toDouble(),
                divisions: 200,
                min: 0,
                max: endNumber.toDouble(),
                onChanged: (double val) async {
                  setState(() {
                    minute = val.toInt();
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

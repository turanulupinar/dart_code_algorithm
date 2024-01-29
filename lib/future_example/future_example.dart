import 'package:flutter/material.dart';

class FutureExamplePage extends StatefulWidget {
  const FutureExamplePage({super.key});

  @override
  State<FutureExamplePage> createState() => _FutureExamplePageState();
}

class _FutureExamplePageState extends State<FutureExamplePage> {
  int currentNumber = 0;
  int endNumber = 20;
  bool isDone = true;
  Future<int> countNumbers() async {
    setState(() {
      isDone = false;
    });
    for (int i = 0; i < 25 * 60; i++) {
      setState(() {
        currentNumber++;
      });

      await Future.delayed(const Duration(seconds: 1));
    }
    setState(() {
      isDone = true;
    });
    return currentNumber;
  }

  showMessage(int val) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("25 dakika doldu. 5 dakika mola verin! Değer $val")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Future Example"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Başladığınızdan bu yana $currentNumber saniye geçti..",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton.icon(
                onPressed: () async {
                  await countNumbers();
                  showMessage(currentNumber);
                },
                icon: isDone == true
                    ? const Icon(Icons.punch_clock)
                    : const SizedBox(
                        height: 20,
                        width: 20,
                        child: Center(
                            child: CircularProgressIndicator(
                          strokeWidth: 2,
                        )),
                      ),
                label: const Text("Start"))
          ],
        ),
      ),
    );
  }
}

//async functions
// Birden fazla yapılan işlemlerde, bu işlemler arasında iş parcacığının tamamlanması diğer işlemlerden farklı
// ise burada async function kullanılır. Yada kısa süre içerisinde gerçekleşmeyen
// zamana ihtiyac duyan işlemlerde yine async functionlar kullanılır



//TODO: ÖDEV
// iki adet zaman değişkeni tanımlayın. Saniye ve dakika değişkenleri. 
// saniye 60'a ulaşınca dakika değişkeni 1 artsın. dakika değişkeni 2 dakika olunca
// süreniz doldu diye pop-up cıksın
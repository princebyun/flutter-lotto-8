import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_lotto_8/logic/lotto_logic.dart';
import 'package:flutter_lotto_8/screens/result_screen.dart';

class HomeScrean extends StatefulWidget {
  const HomeScrean({super.key});

  @override
  State<HomeScrean> createState() => _HomeScreanState();
}

class _HomeScreanState extends State<HomeScrean> {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("로또 게임")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '구입금액을 입력하세요.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '1000원 단위 금액만 숫자로 입력하세요.',
              ),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                String input = textController.text;
                if (input.isEmpty) return;

                int money = int.parse(input);

                List<List<int>> myLottoList = buyLotto(money);

                List<int> winnerNumbers = createLotto();
                int bonusNumber;
                do {
                  bonusNumber = Random().nextInt(45) + 1;
                } while (winnerNumbers.contains(bonusNumber));

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      myLottoList: myLottoList,
                      winnerNumbers: winnerNumbers,
                      bonusNumber: bonusNumber,
                    ),
                  ),
                );
              },
              child: Text('구매하기'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

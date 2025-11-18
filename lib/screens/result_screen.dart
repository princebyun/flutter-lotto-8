import 'package:flutter/material.dart';
import 'package:flutter_lotto_8/logic/lotto_logic.dart';
import 'package:flutter_lotto_8/widgets/lotto_ball.dart';

class ResultScreen extends StatelessWidget {
  final List<List<int>> myLottoList;
  final List<int> winnerNumbers;
  final int bonusNumber;

  const ResultScreen({
    super.key,
    required this.myLottoList,
    required this.winnerNumbers,
    required this.bonusNumber,
  });

  @override
  Widget build(BuildContext context) {
    int money = myLottoList.length * 1000;
    int resultMoney = 0;

    for (var lotto in myLottoList) {
      String rank = getWinner(winnerNumbers, bonusNumber, lotto);
      resultMoney += getPrizeAmount(rank);
    }
    double resultRate = (resultMoney / money) * 100;

    return Scaffold(
      appBar: AppBar(title: const Text('구입 결과')),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('당첨번호', style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int number in winnerNumbers) LottoBall(number: number),
                Icon(Icons.add, size: 30),
                LottoBall(number: bonusNumber),
              ],
            ),
            Divider(height: 40, thickness: 1),
            Text('내 구매 내역', style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: myLottoList.length,
                itemBuilder: (context, index) {
                  List<int> lotto = myLottoList[index];

                  String rank = getWinner(winnerNumbers, bonusNumber, lotto);

                  return ListTile(
                    title: Text('${index + 1}번째 장'),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (int number in lotto) ...[
                          LottoBall(number: number),
                          const SizedBox(width: 4),
                        ],
                        const SizedBox(width: 4),
                        Text('$rank입니다.'),
                      ],
                    ),
                  );
                },
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('구매화면으로'),
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

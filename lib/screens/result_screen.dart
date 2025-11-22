import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_lotto_8/logic/WinningInfo.dart';
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
    HashMap<String, int> rankCount = HashMap<String, int>();

    for (var lotto in myLottoList) {
      WinningInfo rank = getWinner(winnerNumbers, bonusNumber, lotto);
      rankCount.update(rank.rank, (value) => value + 1, ifAbsent: () => 0);
      resultMoney += rank.winningMoney;
    }
    double resultRate = money == 0 ? 0 : (resultMoney / money) * 100;

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
            Text('수익률', style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('총 구매금액: ${money}원'),
                Text('총 당첨금: ${resultMoney}원'),
                const SizedBox(height: 5),
                Text(
                  '수익률: ${resultRate.toStringAsFixed(1)}%',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            //---------------------------------------------------------
            Divider(height: 40, thickness: 1),
            Text('당첨정보', style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('1등 : ${rankCount['1등'] ?? 0}번'),
                Text('2등 : ${rankCount['2등'] ?? 0}번'),
                Text('3등 : ${rankCount['3등'] ?? 0}번'),
                Text('4등 : ${rankCount['4등'] ?? 0}번'),
                Text('5등 : ${rankCount['5등'] ?? 0}번'),
                Text('꽝 : ${rankCount['꽝'] ?? 0}번'),
              ],
            ),
            //---------------------------------------------------------
            Divider(height: 40, thickness: 1),
            Text('내 구매 내역', style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: myLottoList.length,
                itemBuilder: (context, index) {
                  List<int> lotto = myLottoList[index];

                  WinningInfo rank = getWinner(
                    winnerNumbers,
                    bonusNumber,
                    lotto,
                  );

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
                        Text('${rank.rank} 입니다.'),
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

import 'package:flutter/material.dart';
import 'package:flutter_lotto_8/widgets/lotto_ball.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                LottoBall(number: 1),
                LottoBall(number: 10),
                LottoBall(number: 20),
                LottoBall(number: 30),
                LottoBall(number: 40),
                LottoBall(number: 45),
                Icon(Icons.add, size: 30),
                LottoBall(number: 7),
              ],
            ),
            Divider(height: 40, thickness: 1),
            Text('내 구매 내역', style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    subtitle: Row(
                      children: [
                        LottoBall(number: 1),
                        SizedBox(width: 5),
                        LottoBall(number: 2),
                        SizedBox(width: 5),
                        LottoBall(number: 3),
                        SizedBox(width: 5),
                        LottoBall(number: 4),
                        SizedBox(width: 5),
                        LottoBall(number: 5),
                        SizedBox(width: 5),
                        LottoBall(number: 6),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

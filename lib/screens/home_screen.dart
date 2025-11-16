import 'package:flutter/material.dart';

class HomeScrean extends StatelessWidget {
  const HomeScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("로또 게임")),
      body: Center(child: Text("로또 게임 구조 잡기")),
    );
  }
}

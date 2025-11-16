import 'package:flutter/material.dart';

class LottoBall extends StatelessWidget {
  final int number;

  const LottoBall({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(child: Text('$number'));
  }
}

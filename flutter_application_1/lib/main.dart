import 'package:flutter/material.dart';
import 'Screen/ListScreen.dart';

void main() async {
  runApp(const Assignment1());
}

class Assignment1 extends StatelessWidget {
  const Assignment1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShoplistScreen(),
    );
  }
}

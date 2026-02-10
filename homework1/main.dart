import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Tutorial';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: _title, home: MyStatelessWidget());
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppBar Tutorial')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('الاسم:زياد سعدون الرشيدي', style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Text('الرقم التدريبي: 445159098', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}

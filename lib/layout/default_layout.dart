import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final String title; // 3가지 파라미터 받을거임
  final Widget body;
  final List<Widget>? actions; //앱바에 오른쪽 끝에 들어가는 값이 될것임

  const DefaultLayout({
    required this.title,
    required this.body,
    this.actions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: body,
      ),
    );
  }
}

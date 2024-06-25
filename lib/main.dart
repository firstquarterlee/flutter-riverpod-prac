import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_prac/screen/home_screen.dart';

void main() {
  runApp(ProviderScope(//프로바이더스코프가 상위에 있어야 상태관리 툴을 쓸 수 있다. 이거 없으면 인식 못함
    child: MaterialApp(
      home: HomeScreen(),
    ),
  ));
}

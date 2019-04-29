import 'package:flutter/material.dart';
import './pages/home_page.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '大乐透查询',
      theme: ThemeData(
        primaryColor: Color(0xffe73030),
      ),
      home: HomePage(),
    );
  }
}
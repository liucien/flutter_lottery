import 'package:flutter/material.dart';
import './mas_all.dart';
import './msg_local.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.orangeAccent,
          title: TabBar(
            tabs: [
              Tab(text: '全国'),
              // Tab(text: '地方'),
            ],
            indicatorColor: Color(0xffe73030),
            isScrollable:true,
          ),
        ),
        body: TabBarView(
          children: [
            AllMsg(),
            LocalMsg(),
          ],
        ),
      ),
    );
  }
}

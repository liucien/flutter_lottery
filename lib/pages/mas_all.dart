import 'package:flutter/material.dart';
import './all/nearest_num.dart';
import './all/past_nums.dart';

class AllMsg extends StatefulWidget {
  @override
  _AllMsgState createState() => _AllMsgState();
}

class _AllMsgState extends State<AllMsg> {
  //黑边
  _divBorder() {
    return Container(
      height: 8,
      color: Colors.black12,
    );
  }

  _imgsWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/images/tb.jpg',
          width: 120,
          height: 120,
        ),
        Image.asset(
          'assets/images/fx.jpg',
          width: 120,
          height: 120,
        ),
        Image.asset(
          'assets/images/wq.jpg',
          width: 120,
          height: 120,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text('开奖时间  每周一、三、六 20：30'),
          ),
          _divBorder(),
          NearestNum(), //最近开奖
          _divBorder(),
          _imgsWidget(),
          _divBorder(),
          PastNums()
        ],
      ),
    );
  }
}

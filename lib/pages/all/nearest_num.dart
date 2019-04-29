import 'package:flutter/material.dart';

class NearestNum extends StatefulWidget {
  NearestNum({Key key}) : super(key: key);

  _NearestNumState createState() => _NearestNumState();
}

class _NearestNumState extends State<NearestNum> {
  List nums;
  @override
  void initState() {
    super.initState();
    nums = ["03", "04", "10", "16", "32", "04", "09"];
  }

  Widget numsList() {
    List<Widget> tiles = [];
    Widget content;
    for (var i = 0; i < nums.length; i++) {
      tiles.add(
        Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: i > 4 ? Colors.blue : Colors.red,
          ),
          child: Text(nums[i].toString(),
              style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
      );
    }
    //箭头
    tiles.add(Container(
      child: Icon(Icons.arrow_drop_down),
    ));
    content = Row(
      children: tiles,
    );
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('第19047期  2019年04月27日'),
          numsList(),
        ],
      ),
    );
  }
}

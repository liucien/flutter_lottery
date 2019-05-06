import 'package:flutter/material.dart';
import '../../common/event_bus.dart';

class NearestNum extends StatefulWidget {
  NearestNum({Key key}) : super(key: key);

  _NearestNumState createState() => _NearestNumState();
}

class _NearestNumState extends State<NearestNum> {
  List nums;
  var lottery;
  @override
  void initState() {
    super.initState();
    eventBus.on<MyEvent>().listen((MyEvent data) {
      var mdata = data.items;
      setState(() {
        nums = mdata['codeNumber'];
        lottery = mdata['lottery'];
      });
    });
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
    return nums == null
        ? Center(child: CircularProgressIndicator())
        : Container(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('第${lottery['term']}期  ${lottery['openTime_fmt']}'),
                numsList(),
              ],
            ),
          );
  }
}

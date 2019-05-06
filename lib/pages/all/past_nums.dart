import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import '../../common/event_bus.dart';

Future httpData() async {
  try {
    Dio dio = new Dio();

    Response response;
    var data = {'_ltype': 4, '_term': 0, '_num': 10};
    response = await dio.post(
      "http://m.lottery.gov.cn/api/mlottery_kj_detail.jspx",
      queryParameters: data,
    );
    return response.data;
  } catch (e) {
    return print(e);
  }
}

class PastNums extends StatefulWidget {
  PastNums({Key key}) : super(key: key);

  _PastNumsState createState() => _PastNumsState();
}

class _PastNumsState extends State<PastNums> {
  List listData;
  List items;
  @override
  void initState() {
    super.initState();

    httpData().then((val) {
      setState(() {
        items = json.decode(val);
        listData = items[0]['mdata'];
        eventBus.fire(new MyEvent(listData[0]));
      });
    });
  }

  Widget dataView(datas) {
    List<Widget> boxList = [];
    Widget content;
    for (int j = 0; j < datas.length; j++) {
      boxList.add(Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 3, color: Colors.black12)),
        ),
        child: Column(
          children: <Widget>[
            Text(
                '第${datas[j]['lottery']['term']}期 ${datas[j]['lottery']['openTime_fmt']}'),
            _numsRander(datas[j]['codeNumber']),
          ],
        ),
      ));
    }

    content = Column(
      children: boxList,
    );

    return content;
  }

  Widget _numsRander(nums) {
    List<Widget> itemData = [];

    for (var i = 0; i < nums.length; i++) {
      itemData.add(Container(
        padding: EdgeInsets.fromLTRB(0, 5, 10, 0),
        child: Text(
          '${nums[i].toString()}',
          style:
              TextStyle(fontSize: 18, color: i > 4 ? Colors.blue : Colors.red),
        ),
      ));
    }

    return Row(
      children: itemData,
    );
  }

  @override
  Widget build(BuildContext context) {
    return listData == null
        ? Center(child: CircularProgressIndicator())
        : Expanded(
            child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, idx) {
                  return dataView(listData);
                }),
          );
  }
}

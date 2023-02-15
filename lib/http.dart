import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpTest extends StatefulWidget {
  const HttpTest({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HttpTest();
}

class _HttpTest extends State<HttpTest> {
  List? data;

  @override
  void initState() {
    super.initState();
    data = new List.empty(growable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Http Test')),
        body: Container(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('API 테스트를 진행하기 위해 버튼을 클릭해주세요'),
              FloatingActionButton(
                child: Text('눌러'),
                onPressed: () {
                  getJSONData();
                },
              ),
              ListView.builder(itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    child: Column(
                        children: [Text(data![index]['title'].toString())]),
                  ),
                );
              }),

            ],
          ),
        )));
  }

  Future<String> getJSONData() async {
    var url =
        'https://492c69c6-661c-47f9-9c96-31bbe0c20109.mock.pstmn.io/test/sst/api';
    var response = await http.get(Uri.parse(url));
    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      List result = dataConvertedToJSON['documents'];
      data!.addAll(result);
    });
    return response.body;
  }
}

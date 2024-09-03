import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String input1 =
      '[{"0":{"id":1,"title":"Gingerbread"},"1":{"id":2,"title":"Jellybean"},"3":{"id":3,"title":"KitKat"}},{"0":{"id":8,"title":"Froyo"},"2":{"id":9,"title":"Éclair"},"3":{"id":10,"title":"Donut"}},[{"id":4,"title":"Lollipop"},{"id":5,"title":"Pie"},{"id":6,"title":"Oreo"},{"id":7,"title":"Nougat"}]]';
  final String input2 =
      '[{"0":{"id":1,"title":"Gingerbread"},"1":{"id":2,"title":"Jellybean"},"3":{"id":3,"title":"KitKat"}},{"0":{"id":8,"title":"Froyo"},"2":{"id":9,"title":"Éclair"},"3":{"id":10,"title":"Donut"}},[{"id":4,"title":"Lollipop"},{"id":5,"title":"Pie"},{"id":6,"title":"Oreo"},{"id":7,"title":"Nougat"}]]';

  List<AndroidVerison> output1 = [];
  List<AndroidVerison> output2 = [];

  // @override
  // void initState() {
  //   super.initState();
  //   output1 = parseJson(input1);
  //   output2 = parseJson(input2);
  // }

  List<AndroidVerison> parseJson(String json) {
    List<AndroidVerison> result = [];
    List<dynamic> data = jsonDecode(json);
    for (var item in data) {
      if (item is Map) {
        item.forEach((key, value) {
          if (value is Map) {
            result.add(AndroidVerison(
                id: value['id'], title: value['title']));
          } else if (value is List) {
            value.forEach((v) {
              if (v is Map) {
                result.add(AndroidVerison(
                    id: v['id'], title: v['title']));
              }
            });
          }
        });
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON Parser'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  output1 = parseJson(input1);
                });
              },
              child: Text('Output-1'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  output2 = parseJson(input2);
                });
              },
              child: Text('Output-2'),
            ),
            SizedBox(height: 20),
            OutputGridView(output: output1),
            OutputGridView(output: output2),
          ],
        ),
      ),
    );
  }
}

class OutputGridView extends StatefulWidget {
  final List<AndroidVerison> output;

  OutputGridView({required this.output});

  @override
  _OutputGridViewState createState() => _OutputGridViewState();
}

class _OutputGridViewState extends State<OutputGridView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 4,
        children: widget.output.map((e) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(e.title!),
                SizedBox(height: 8),
                Text('id: ${e.id}'),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class AndroidVerison {
  AndroidVerison({
    this.id,
    this.title,
  });
  int? id;
  String? title;
}
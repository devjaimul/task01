import 'package:flutter/material.dart';

import '../../models/version_models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final input1 = [
    {
      "0": {"id": 1, "title": "Gingerbread"}
    },
    {
      "1": {"id": 2, "title": "Jellybean"}
    },
    {
      '2': {"title": ""}
    },
    {
      "3": {"id": 3, "title": "KitKat"}
    },
    {
      '4': {"id": 4, "title": "Lollipop"}
    },
    {
      '5': {"id": 4, "title": "Pie"}
    },
    {
      '6': {"id": 4, "title": "Oreo"}
    },
    {
      '7': {"id": 4, "title": "Nougat"}
    },
  ];
  final input2 = [
    {
      "0": {"id": 1, "title": "Gingerbread"}
    },
    {
      "1": {"id": 2, "title": "Jellybean"}
    },
    {
      '2': {"title": ""}
    },
    {
      "3": {"id": 3, "title": "KitKat"}
    },
    {
      '4': {"id": 4, "title": "Froyo"}
    },
    {
      '5': { "title": ""}
    },
    {
      '6': {"id": 4, "title": "Eclair"}
    },
    {
      '7': {"id": 4, "title": "Donut"}
    },
    {
      '8': {"id": 4, "title": "lollipop"}
    },
    {
      '7': {"id": 4, "title": "pie"}
    },
    {
      '7': {"id": 4, "title": "Oreo"}
    },
    {
      '7': {"id": 4, "title": "Nougat"}
    },
  ];

  List<AndroidVerison> parsedList = [];

  void _parseJson(List<dynamic> input) {
    parsedList.clear();
    for (var element in input) {
      if (element is Map) {
        element.forEach((key, value) {
          if (value is Map) {
            parsedList.add(AndroidVerison(
              id: value['id'],
              title: value['title'],
            ));
          } else if (value is List) {
            for (var item in value) {
              if (item is Map) {
                parsedList.add(AndroidVerison(
                  id: item['id'],
                  title: item['title'],
                ));
              }
            }
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    _parseJson([
                      ...input1,
                    ]);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: size*.25,
                        child: Column(
                          children: [
                            Expanded(
                              child: GridView.builder(
                                itemCount: parsedList.length,
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,

                                ),
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                      parsedList[index].title!,
                                    ),
                                    //subtitle: Text('ID: ${parsedList[index].id}'),
                                  );
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close,color: Colors.white,),style: IconButton.styleFrom(backgroundColor: Colors.teal),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal,foregroundColor: Colors.white),
              child: const Text('Parse Input 1'),
            ),
            SizedBox(height: size *0.02),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    _parseJson([
                      ...input2,
                    ]);
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        height: size*.35,
                        child: Column(
                          children: [
                            Expanded(
                              child: GridView.builder(
                                itemCount: parsedList.length,
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4),
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                      parsedList[index].title!,
                                    ),
                                    //subtitle: Text('ID: ${parsedList[index].id}'),
                                  );
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close,color: Colors.white,),style: IconButton.styleFrom(backgroundColor: Colors.teal),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal,foregroundColor: Colors.white),
              child: const Text('Parse Input 2'),
            ),
            SizedBox(height: size*.03),
          ],
        ),
      ),
    );
  }
}
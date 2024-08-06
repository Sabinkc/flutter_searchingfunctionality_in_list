import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    _filteredList = _list;
    super.initState();
  }

  List _list = [
    "ronaldo",
    "messi",
    "neymar junior",
    "bale",
    "benaema",
    "kroos",
    "nodric",
    "zlatan ibrahimovic",
    "courtious",
    "vinicius junior",
    "sabin",
    "nabin",
    "rabin",
  ];

  List _filteredList = [];

  void filterList(String query) {
    _filteredList = _list
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TextField(
            controller: _controller,
            onChanged: (query) {
              setState(() {
                query = _controller.text;
                filterList(query);
              });
            }),
        Expanded(
          child: ListView.builder(
              itemCount: _filteredList.length,
              itemBuilder: ((context, index) => ListTile(
                    title: Text(_filteredList[index]),
                  ))),
        ),
      ],
    ));
  }
}

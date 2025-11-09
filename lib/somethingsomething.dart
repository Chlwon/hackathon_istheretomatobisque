import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<List<String>> _loadAllItems() async {
    final jsonString = await rootBundle.loadString('assets/food.json');
    final Map<String, dynamic> data = jsonDecode(jsonString);
    final List<String> keyDiningHall = data.keys.toList();
    final List<String> items = [];

    for(String key in keyDiningHall) {
      final List<String> time = data[key].toList();
    }

    // Traverse nested maps and lists, collect string items
    void collect(dynamic node) {
      if (node is String) {
        items.add(node);
      } else if (node is List) {
        for (var e in node) collect(e);
      } else if (node is Map) {
        for (var v in node.values) collect(v);
      }
    }

    collect(data);
    return items;
  }

  Future<Map<String, dynamic>> readJson(String toRead) async {
    final String response = await rootBundle.loadString('assets/$toRead');
    final data = await json.decode(response);
    print(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter layout demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(title: const Text(appTitle)),
        body: FutureBuilder<List<String>>(
        future: _loadAllItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final items = snapshot.data ?? <String>[];
          if (items.isEmpty) {
            return const Center(child: Text('No items found'));
          }
          return Column(children:

          [ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(items[index]),
            ),
          )]);
        },
      ),
      )
    );
  }
}


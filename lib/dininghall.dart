import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'tomatobisque.dart';

class ChecklistPage extends StatefulWidget {
  final String diningHall;
  final String mealTime;

  const ChecklistPage({super.key, required this.diningHall, required this.mealTime});

  @override
  State<ChecklistPage> createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  late Future<List<String>> _itemsFuture;
  List<bool> _checked = [];

  @override
  void initState() {
    super.initState();
    _itemsFuture = _loadItems(widget.diningHall, widget.mealTime);
  }

  Future<List<String>> _loadItems(String diningHall, String mealTime) async {
    final jsonString = await rootBundle.loadString('assets/food.json');
    final Map<String, dynamic> data = jsonDecode(jsonString);

    // Get the specific dining hall
    final Map<String, dynamic> hallData = data[diningHall];

    if (hallData == null || hallData[mealTime] == null) {
      return [];
    }

    final Map<String, dynamic> mealData = hallData[mealTime];

    // Collect all items across all categories
    final List<String> items = [];
    mealData.forEach((category, foodList) {
      if (foodList is List) {
        items.addAll(foodList.map((e) => e.toString()));
      }
    });

    // Initialize checked list
    _checked = List<bool>.filled(items.length, false);
    return items;
  }

  int get checkedCount => _checked.where((c) => c).length;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) return;
        final checkedCount = _checked.where((c) => c).length;
      },
      child: Scaffold(
        body: FutureBuilder<List<String>>(
          future: _itemsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            final items = snapshot.data ?? [];
            if (items.isEmpty) {
              return const Center(child: Text('No items found for this meal.'));
            }

            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(items[index]),
                  value: _checked[index],
                  onChanged: (bool? value) {
                    setState(() {
                      _checked[index] = value ?? false;
                    });
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class FrankPage extends StatelessWidget {
  const FrankPage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ChecklistPage(
        diningHall: "franklin",
        mealTime: "lunch",
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: SizedBox(
          height: 60.0,
          width: 60.0,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SquirrelPage(title: 'Squirrel', numDrops:5);
                }));
              },
              child: const Icon(Icons.pets), 
            ),
          )
        )
      )
    );
  }
}

class HampPage extends StatelessWidget {
  const HampPage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ChecklistPage(
        diningHall: "hampshire",
        mealTime: "lunch",
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: SizedBox(
          height: 60.0,
          width: 60.0,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SquirrelPage(title: 'Squirrel', numDrops:5);
                }));
              },
              child: const Icon(Icons.pets), 
            ),
          )
        )
      )
    );
  }
}

class WooPage extends StatelessWidget {
  const WooPage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ChecklistPage(
        diningHall: "worcester",
        mealTime: "lunch",
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: SizedBox(
          height: 60.0,
          width: 60.0,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SquirrelPage(title: 'Squirrel', numDrops:5);
                }));
              },
              child: const Icon(Icons.pets), 
            ),
          )
        )
      )
    );
  }
}

class BerkPage extends StatelessWidget {
  const BerkPage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ChecklistPage(
        diningHall: "berkshire",
        mealTime: "lunch",
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: SizedBox(
          height: 60.0,
          width: 60.0,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SquirrelPage(title: 'Squirrel', numDrops:5);
                }));
              },
              child: const Icon(Icons.pets), 
            ),
          )
        )
      )
    );
  }
}
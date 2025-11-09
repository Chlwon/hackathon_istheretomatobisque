import 'package:flutter/material.dart';
import 'dininghall.dart';
import 'tomatobisque.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});
  final String title;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const FrankPage(title: 'Franklin Dining Commons');
                }));
              },
              onLongPress: () {
                Image.asset('assets/franklin _resized_0.jpg');
              },
              child: const Text('The Goat🐐'),
            ),
            const SizedBox(height: 16),
            
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HampPage(title: 'Hampshire Dining Commons');
                }));
              },
              onLongPress: () {
                Image.asset('assets/Untitled.jpg');
              },
              child: const Text('Juice🧃'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const WooPage(title: 'Worcester Dining Commons');
                }));
              },
              onLongPress: () {
                Image.asset('assets/worcester_commons_new_0.jpg');
              },
              child: const Text('Maggot🐛'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const BerkPage(title: 'Berkshire Dining Commons');
                }));
              },
              onLongPress: () {
                Image.asset('assets/berkshire _resized_0.jpg');
              },
              child: const Text('Rat🐀'),
            ),
            const SizedBox(height: 16),

            //temp loginpage
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const StartPage(title: 'Start Page');
                }));
              },
              child: const Text('start'),
            ),
          ]
        )
      ),

      floatingActionButton: SizedBox(
        height: 100.0,
        width: 100.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const TomatobisquePage(title: 'Tomato Bisque Page');
              }));
            },
          ),
        ),
      ),
    ); 
  }
}
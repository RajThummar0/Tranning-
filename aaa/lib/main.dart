import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatelessWidget {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('MediaQuery'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(250, 110, 85, 85),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Top Text
            const Text(
              'ffffffffffffffffffffff',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            // This pushes container to center
            Expanded(
              child: Center(
                child: Container(
                  color: const Color.fromARGB(250, 12, 73, 18),
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(8),
                  height: height / 2,
                  width: width * 0.8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

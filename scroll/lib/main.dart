import 'package:flutter/material.dart';
void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      highContrastDarkTheme: ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      themeMode: isDark ? ThemeMode.light : ThemeMode.dark,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Theme Switch"),
          actions: [
            IconButton(
              icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
              onPressed: () => setState(() => isDark = !isDark),
            ),
          ],
        ),
        //body: Padding(padding: const EdgeInsets.all(8)),
        body: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
          child: Row(

            children: <Widget>[
              Container(
                height: 300,
                width: 300,
                color: Colors.blue,
                margin: EdgeInsets.only(bottom: 11),
              ),
              Container(
                height: 300,
                width: 300,
                color: Colors.grey,
                margin: EdgeInsets.only(bottom: 11),
              ),
              Container(
                height: 300,
                width: 300,
                color: Colors.redAccent,
                margin: EdgeInsets.only(bottom: 11),
              ),
              Container(
                height: 300,
                width: 300,
                color: Colors.black87,
                margin: EdgeInsets.only(bottom: 11),
              ),
              Container(
                height: 300,
                width: 300,
                color: Colors.teal,
                margin: EdgeInsets.only(bottom: 11),
              ),
              Container(
                height: 300,
                width: 300,
                color: Colors.brown,
                margin: EdgeInsets.only(bottom: 11),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

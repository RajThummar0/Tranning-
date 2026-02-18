import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/SecondPage.dart';

class peli extends StatelessWidget {
  const peli({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('VV'),
        centerTitle: true,
        foregroundColor: Colors.white70,
        backgroundColor: Colors.black87,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          //tooltip: 'go to second screen',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Secondpage()),
            );
          },
        ),
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(child: buildImage(context, 'assets/images/2.jpg')),
                Expanded(child: buildImage(context, 'assets/images/2.jpg')),
                Expanded(child: buildImage(context, 'assets/images/2.jpg')),
              ],
            ),
          ),

          Expanded(
            child: Column(
              children: [
                Expanded(child: buildImage(context, 'assets/images/1.jpeg')),
                Expanded(child: buildImage(context, 'assets/images/1.jpeg')),
                Expanded(child: buildImage(context, 'assets/images/1.jpeg')),
              ],
            ),
          ),
        ],
      ),

      backgroundColor: Color.fromARGB(131, 153, 209, 136),
    );
  }

}
Widget buildImage(BuildContext context, String path) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const Secondpage()),
      );
    },
    child: Image.asset(
      path,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    ),
  );
}

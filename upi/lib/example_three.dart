import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {

  var data;
  Future<void> getUserApi() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if(response.statusCode==200){
      for(Map i in data){
        data = jsonDecode(response.body.toString());
      }
    }else{

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(future: getUserApi(), builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Text('Loading...');
            }else{
              //return ListView.builder(itemBuilder: (context,index))
            }
          }),
        ],
      ),
    );
  }
}

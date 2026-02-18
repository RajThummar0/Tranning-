import 'package:api/api_services.dart';
import 'package:api/single_post_model.dart';
import 'package:flutter/material.dart' ;

class screen_model extends StatefulWidget {
  const screen_model({super.key});

  @override
  State<screen_model> createState() => _screen_modelState();
}

class _screen_modelState extends State<screen_model> {
  bool isReady=false;
  singlepostwithmodel Singlepostmodel= singlepostwithmodel();
  _getsinglepost(){
    isReady=true;
    api_sevices().getsinglepostwithmodel().then((value){
      setState(() {
        Singlepostmodel=value!;
        isReady=false;

      });
    }).onError((error, stackTrace) {
      print(error.toString());
      setState(() {
        isReady=false;
      });
    });


  }

  @override
  void initState(){
    _getsinglepost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API"),
        centerTitle: true,
      ),
      body: isReady==true?
      const Center(child: CircularProgressIndicator(),):

      Column(
        mainAxisAlignment : MainAxisAlignment.center,
        children: [

          Text(Singlepostmodel.userId.toString(),style: const TextStyle(fontSize: 20,color: Colors.black),),
          Text(Singlepostmodel.id.toString(),style: const TextStyle(fontSize: 20,color: Colors.redAccent),),
          Text(Singlepostmodel.title.toString(),style: const TextStyle(fontSize: 20,color: Colors.brown),),
          Text(Singlepostmodel.body.toString(),style: const TextStyle(fontSize: 20,color: Colors.yellow),)
        ],
    )
    );
  }
}

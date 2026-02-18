import 'dart:convert';

import 'package:api/single_post_model.dart';
import 'package:http/http.dart' as http;


class api_sevices{

  Future<singlepostwithmodel?> getsinglepostwithmodel()async{
  try{

    var response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));

    if(response.statusCode==200){
      singlepostwithmodel model=singlepostwithmodel.fromJson(json.decode(response.body));
      return model;
    }
  }
  catch (e){
    print(e.toString());
  }
  return null;
  }

}
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post_model.dart';

class ApiService {
  Future<List<PostModel>> fetchPosts() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );
    if(response.statusCode ==200){
      List data = jsonDecode(response.body);
      return data.map((e)=>PostModel.fromJson(e)).toList();
    }
    else{
      throw Exception('faild to load posts');
    }
  }
}

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:news_apk/NewsModel.dart';

class Newsapp extends StatefulWidget {
  const Newsapp({super.key});

  @override
  State<Newsapp> createState() => _NewsappState();
}


class _NewsappState extends State<Newsapp> {

  Future<NewsModel>fetchNews() async{
    var response = await http.get(Uri.parse('https://newsapi.org/v2/everything?q=tesla&from=2026-01-25&sortBy=publishedAt&apiKey=41b5b673e5b342bf994dca72dc872329'));
    if(response.statusCode==200){
      final result=jsonDecode(response.body);
      return NewsModel.fromJson(result);
    }
    else{
      return NewsModel();
    }
  }
  @override
  void initState(){
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Today's NEWS...!"),
          centerTitle: true,
          backgroundColor: Colors.black54,
          foregroundColor: CupertinoColors.white,
        ),
        body: FutureBuilder(future: fetchNews(), builder: (context, snapshot) {
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            // Adds space around the whole list
            itemCount: snapshot.data!.articles!.length,
            itemBuilder: (context, index) {
              final article = snapshot.data!.articles![index];

              return Card(
                elevation: 15,
                // Adds a subtle shadow
                margin: const EdgeInsets.symmetric(vertical: 8),
                // Spacing between boxes
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      // Rounded corners for image
                      child: Image.network(
                        "${article.urlToImage}",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, size: 50),
                      ),
                    ),
                    title: Text(
                      '${article.title}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '${article.description}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              );
            },
          );
        }
        ),
      ),
    );
  }  }


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

import 'detailnews.dart';
import 'package:flutterexc_api/model/newsmodal.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url =
      'https://newsapi.org/v2/everything?q=kucing&from=2019-25-01&to=2019-06-26&sortBy=publishedAt&apiKey=77ba78b1e80b4916a22c01755966e9b9';

  List data;
  var extractdata;

  Future<String> makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      extractdata = jsonDecode(response.body);
      data = extractdata["articles"];
    });
  }

  @override
  void initState() {
    this.makeRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kumpulan Berita Negara Indonesia'),
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, i) {
          return ListTile(
            onTap: () {
              var nextPage = MaterialPageRoute(
                  builder: (context) => NewsDetails(
                    title: data[i]["title"].toString(),
                    description: data[i]["description"].toString(),
                    image: data[i]["urlToImage"].toString(),
                    content: data[i]["content"].toString(),
                    publishedAt: data[i]["publishedAt"].toString(),
                    author: data[i]["author"].toString(),
                  ));
              Navigator.push(context, nextPage);
            },
            title: Text(data[i]["title"].toString()),
            subtitle: Text(data[i]["publishedAt"]),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(data[i]["urlToImage"] == null
                  ? 'https://uae.microless.com/cdn/no_image.jpg'
                  : data[i]["urlToImage"].toString()),
            ),
          );
        },
      ),
    );
  }
}

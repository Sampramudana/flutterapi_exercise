import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterexc_api/model/newsmodal.dart';

class NewsDetails extends StatefulWidget {
  var title;
  var description;
  var image;
  var content;
  var publishedAt;
  var author;

  NewsDetails({Key key, this.title, this.image, this.content,this.description,this.publishedAt,this.author}) : super(key: key);

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,),
            ),

            Image.network('${widget.image}'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.description,style: TextStyle(),textAlign: TextAlign.justify,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.content,textAlign: TextAlign.justify,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Published At : "+widget.publishedAt,style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Text(widget.author,style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,color: Colors.grey),),
          ],
        ),
      ),
    );
  }
}
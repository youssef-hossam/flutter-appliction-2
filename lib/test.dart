import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {

  Future getData() async{
    var url =Uri("https://jsonplaceholder.typicode.com/posts");
    var response =await http.get (url as Uri);
    var responsebody =convert.jsonDecode(response.body);
    print(response);
    return responsebody;

  }

  Widget build(BuildContext context) {
    return Container(
      child:Scaffold(
        appBar: AppBar(
          title: Text('test'),
        ),
        body:FutureBuilder(future: getData(),
        builder: (BuildContext context ,AsyncSnapshot snapshot){
          if(snapshot.hasData){
             return ListView.builder(itemCount: 2,itemBuilder: (context,i){
               return Container(child: Text(snapshot.data[i]['title']),);
    });}
          else {
            return CircularProgressIndicator();
          }      },
        ),

      ),
    );
  }
}

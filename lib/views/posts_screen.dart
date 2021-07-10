import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:rest_api_jsonholder/models/Postmodel.dart';
import 'package:rest_api_jsonholder/helper/apis.dart';
import 'package:rest_api_jsonholder/controller/controller.dart';


class Dashboard extends StatefulWidget {

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends StateMVC<Dashboard> {


  ApiLinks apiLinks;

  JsonController _postController;


  _DashboardState() : super(JsonController(),) {
    _postController = controller;
  }

  @override
  void initState() {
    apiLinks=new ApiLinks();
    _postController.listenForPostList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: StreamBuilder <List<PostModel>>(
            stream: _postController.getPostList,
            builder: (context, snapshot){
              print("STREAM CALLED");
              if(snapshot.hasData) {
                print("Has data");
                return Container(
                  child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context,index){
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("UserId: ${snapshot.data[index].userid}",style: TextStyle(fontSize: 15.0),),
                            SizedBox(height: 5.0,),
                            Text("Id: ${snapshot.data[index].id}",style: TextStyle(fontSize: 15.0),),
                            SizedBox(height: 5.0,),
                            Text("title:" +snapshot.data[index].title,style: TextStyle(fontSize: 15.0),),
                            SizedBox(height: 5.0,),
                            Text("body:" +snapshot.data[index].body,style: TextStyle(fontSize: 15.0),),
                            SizedBox(height: 5.0,)
                          ],
                        );
                      }
                  ),
                );
              }
              else return Container(
                child: Center(child: Text("Loading....")),
              );
            }
          ),
        )
      ),
    );
  }
}


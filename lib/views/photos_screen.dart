import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:rest_api_jsonholder/models/PhotosModel.dart';
import 'package:rest_api_jsonholder/models/Postmodel.dart';
import 'package:rest_api_jsonholder/helper/apis.dart';
import 'package:rest_api_jsonholder/controller/controller.dart';
import 'package:percent_indicator/percent_indicator.dart';


class PhotosScreen extends StatefulWidget {

  @override
  _PhotosScreenState createState() => _PhotosScreenState();
}

class _PhotosScreenState extends StateMVC<PhotosScreen> {


  ApiLinks apiLinks;
  JsonController _photosController;


  _PhotosScreenState() : super(JsonController(),) {
    _photosController = controller;
  }

  @override
  void initState() {
    apiLinks=new ApiLinks();
    _photosController.listenForPhotosList();
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
            child: StreamBuilder <List<PhotosModel>>(
                stream: _photosController.getPhotosList,
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
                                Text("albumId: ${snapshot.data[index].albumId}",style: TextStyle(fontSize: 15.0),),
                                SizedBox(height: 5.0,),
                                Text("Id: ${snapshot.data[index].id}",style: TextStyle(fontSize: 15.0),),
                                SizedBox(height: 5.0,),
                                Image.network(snapshot.data[index].url),
                                Image.network(snapshot.data[index].thumbnailUrl),
                                SizedBox(height: 5.0,),
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


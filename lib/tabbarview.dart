import 'package:flutter/material.dart';
import 'package:rest_api_jsonholder/views/photos_screen.dart';
import 'package:rest_api_jsonholder/views/posts_screen.dart';

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Color(0xffF15C22),
            tabs: [
              Tab(child: Text("/POSTS(100)",style: TextStyle(fontSize: 20.0,color: Colors.black),),),
              Tab(child: Text("/PHOTOS(5000)",style: TextStyle(fontSize: 20.0,color: Colors.black),),),

            ],
          ),
          title: Column(
            children: [
              Text('Rest Api Integration',style: TextStyle(fontSize: 25),),
              SizedBox(height: 10.0),
              Text('jsonplaceholder.typicode.com',style: TextStyle(fontSize: 15),),
            ],
          ),
          centerTitle: true,
          leading: Icon(Icons.menu),
          actions: [
            Icon(Icons.add,size: 30.0,)
          ],
        ),
        body: TabBarView(
          children: [
            Dashboard(),
            PhotosScreen(),
          ],
        ),
      ),
    );
  }
}

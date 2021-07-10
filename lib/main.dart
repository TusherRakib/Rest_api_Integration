import 'package:flutter/material.dart';
import 'package:rest_api_jsonholder/views/posts_screen.dart';
import 'package:rest_api_jsonholder/tabbarview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

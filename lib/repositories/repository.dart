import 'dart:convert';
import 'package:rest_api_jsonholder/models/Postmodel.dart';
import 'package:rest_api_jsonholder/helper/apis.dart';
import 'package:rest_api_jsonholder/bloc/bloc.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:http/http.dart' as http;

  Future<List<dynamic>> repoPostList() async {
    ApiLinks apiLinks = new ApiLinks();
    try {
      var response = await http.get(Uri.parse(apiLinks.getPosts));
      print("response Data::::${response.body}");
      if (response != null) {
        print("REPO POST LIST");
        List<PostModel> lists = List<PostModel>.from(
            json.decode(response.body).map((x) => PostModel.fromJson(x)));
        print(lists.length);
        return lists;
      }
      else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }

Future<List<dynamic>> repoPhotosList() async {
  ApiLinks apiLinks = new ApiLinks();
  try {
    var response = await http.get(Uri.parse(apiLinks.getPosts));
    print("response Data::::${response.body}");
    if (response != null) {
      print("REPO POST LIST");
      List<PostModel> lists = List<PostModel>.from(
          json.decode(response.body).map((x) => PostModel.fromJson(x)));
      print(lists.length);
      return lists;
    }
    else {
      return null;
    }
  } catch (e) {
    print(e);
  }
}

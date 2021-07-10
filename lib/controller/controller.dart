import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:rest_api_jsonholder/models/Postmodel.dart';
import 'package:rest_api_jsonholder/bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rest_api_jsonholder/repositories/repository.dart';

class PostController extends ControllerMVC implements Bloc{


  final _postList = PublishSubject<List<PostModel>>();
  Stream<List<PostModel>> get getPostList => _postList.stream;

  Future<void> listenForPostList() async {
    print("listenForPostList");
    List<PostModel> products = await repoPostList();
    print(products.length);
    _postList.sink.add(products);
  }
}
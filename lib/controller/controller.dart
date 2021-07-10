import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:rest_api_jsonholder/models/PhotosModel.dart';
import 'package:rest_api_jsonholder/models/Postmodel.dart';
import 'package:rest_api_jsonholder/bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rest_api_jsonholder/repositories/repository.dart';

class JsonController extends ControllerMVC implements Bloc{


  final _postList = PublishSubject<List<PostModel>>();
  final _photosList = PublishSubject<List<PhotosModel>>();


  Stream<List<PostModel>> get getPostList => _postList.stream;
  Stream<List<PhotosModel>> get getPhotosList => _photosList.stream;

  Future<void> listenForPostList() async {
    print("listenForPostList");
    List<PostModel> products = await repoPostList();
    print(products.length);
    _postList.sink.add(products);
  }

  Future<void> listenForPhotosList() async {
    print("listenForPostList");
    List<PhotosModel> photos = await repoPhotosList();
    print(photos.length);
    _photosList.sink.add(photos);
  }
}
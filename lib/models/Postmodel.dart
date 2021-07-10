class PostModel {
  int userid;
  int id;
  String title;
  String body;

  PostModel({this.userid, this.id, this.title, this.body});

  PostModel.fromJson(Map<String, dynamic> json) {
    userid = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userid;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}

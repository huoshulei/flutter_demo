// user.g.dart 将在我们运行生成命令后自动生成

class Login {
  String token;
  String userId;
  String sectionkey;
  String gradekey;
  String state;
//  String list;

  Login.fromJson(json) {
    token=json['token'];
    userId=json['userId'];
    sectionkey=json['sectionkey'];
    gradekey=json['gradekey'];
    state=json['state'];
//    list=json['list'];
  }
}

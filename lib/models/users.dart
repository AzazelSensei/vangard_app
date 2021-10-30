class Users {
  Users({this.id, this.mail, this.password});
  Users.withNoMail({this.id, this.mail, this.password});
  String? id;
  String? mail;
  String? password;

  Users.fromMap(dynamic obj) {
    this.id = obj['username'];
    this.password = obj['password'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = id;
    map["password"] = password;
    return map;
  }
}

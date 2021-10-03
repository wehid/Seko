class Login {
  // int id;
  String username;
  String password;

  Login({this.username, this.password});

  Login.fromJson(Map<String, dynamic> json){
    // id = json['id'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}
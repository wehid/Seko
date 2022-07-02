class ChangePassword {
  int userId;
  String oldPassword;
  String password;

  ChangePassword({this.userId, this.oldPassword, this.password});

  ChangePassword.fromJson(Map<String, dynamic> json) {
    userId = json['ID'];
    oldPassword = json['OldPassword'];
    password = json['Password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.userId;
    data['OldPassword'] = this.oldPassword;
    data['Password'] = this.password;
    return data;
  }
}

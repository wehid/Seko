class UploadResponse {
  String path;
  String fileName;

  UploadResponse({this.path, this.fileName});

  UploadResponse.fromJson(Map<String, dynamic> json) {
    path = json['Path'];
    fileName = json['FileName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Path'] = this.path;
    data['FileName'] = this.fileName;
    return data;
  }
}

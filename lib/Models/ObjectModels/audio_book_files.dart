
class AudioBookFiles {
  String id;
  String bookId;
  String name;
  String file;
  String filePath;

  AudioBookFiles({this.id, this.bookId, this.name, this.file, this.filePath});

  AudioBookFiles.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    bookId = json['BookID'];
    name = json['Name'];
    file = json['File'];
    filePath = json['FilePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['BookID'] = this.bookId;
    data['Name'] = this.name;
    data['File'] = this.file;
    data['FilePath'] = this.filePath;
    return data;
  }
}

import 'audio_book_files.dart';

class Book {
  String id;
  String type;
  String userId;
  String name;
  String smallImage;
  String brief;
  String file;
  String link;
  String createDate;
  String textFile;
  String author;
  String translator;
  String mainLanguageID;
  String transLanguageID;
  String backColor;
  String foreColor;
  String userUsername;
  String userName;
  String userFamily;
  String userImage;
  String mainLanguageTitle;
  String transLanguageTitle;
  String filePath;
  String smallImagePath;
  String userImagePath;
  List<AudioBookFiles> audioFiles;

  Book({
    this.id,
    this.type,
    this.userId,
    this.name,
    this.smallImage,
    this.brief,
    this.file,
    this.link,
    this.createDate,
    this.textFile,
    this.author,
    this.translator,
    this.mainLanguageID,
    this.transLanguageID,
    this.backColor,
    this.foreColor,
    this.userUsername,
    this.userName,
    this.userFamily,
    this.userImage,
    this.mainLanguageTitle,
    this.transLanguageTitle,
    this.filePath,
    this.smallImagePath,
    this.userImagePath,
    this.audioFiles,
  });

  Book.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    type = json['Type'];
    userId = json['UserID'];
    name = json['Name'];
    smallImage = json['SmallImage'];
    brief = json['Brief'];
    file = json['File'];
    link = json['Link'];
    createDate = json['CreateDate'];
    textFile = json['TextFile'];
    author = json['Author'];
    translator = json['Translator'];
    mainLanguageID = json['MainLanguageID'];
    transLanguageID = json['TransLanguageID'];
    backColor = json['BackColor'];
    foreColor = json['ForeColor'];
    userUsername = json['UserUsername'];
    userName = json['UserName'];
    userFamily = json['UserFamily'];
    userImage = json['UserImage'];
    mainLanguageTitle = json['MainLanguageTitle'];
    transLanguageTitle = json['TransLanguageTitle'];
    filePath = json['FilePath'];
    smallImagePath = json['SmallImagePath'];
    userImagePath = json['UserImagePath'];
    if (json['Files'] != null) {
      audioFiles = <AudioBookFiles>[];
      json['Files'].forEach((v) {
        audioFiles.add(new AudioBookFiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['Type'] = this.type;
    data['UserID'] = this.userId;
    data['Name'] = this.name;
    data['SmallImage'] = this.smallImage;
    data['Brief'] = this.brief;
    data['File'] = this.file;
    data['Link'] = this.link;
    data['CreateDate'] = this.createDate;
    data['TextFile'] = this.textFile;
    data['Author'] = this.author;
    data['Translator'] = this.translator;
    data['MainLanguageID'] = this.mainLanguageID;
    data['TransLanguageID'] = this.transLanguageID;
    data['BackColor'] = this.backColor;
    data['ForeColor'] = this.foreColor;
    data['UserUsername'] = this.userUsername;
    data['UserName'] = this.userName;
    data['UserFamily'] = this.userFamily;
    data['UserImage'] = this.userImage;
    data['MainLanguageTitle'] = this.mainLanguageTitle;
    data['TransLanguageTitle'] = this.transLanguageTitle;
    data['FilePath'] = this.filePath;
    data['SmallImagePath'] = this.smallImagePath;
    data['UserImagePath'] = this.userImagePath;
    if (this.audioFiles != null) {
      data['Files'] = this.audioFiles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

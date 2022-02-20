class Course {
  String id;
  String categoryID;
  String partnerID;
  String name;
  String brief;
  String overview;
  String topics;
  String startDate;
  String requirements;
  String smallImage;
  String type;
  String status;
  String hoursPerWeek;
  String color;
  String backColor;
  String foreColor;
  String secondBackColor;
  String secondForeColor;
  String video;
  String videoUrl;
  String studyType;
  String partnerName;
  String categoryName;
  String smallImagePath;
  String videoPath;

  Course({
    this.id,
    this.categoryID,
    this.partnerID,
    this.name,
    this.brief,
    this.overview,
    this.topics,
    this.startDate,
    this.requirements,
    this.smallImage,
    this.type,
    this.status,
    this.hoursPerWeek,
    this.color,
    this.backColor,
    this.foreColor,
    this.secondBackColor,
    this.secondForeColor,
    this.video,
    this.videoUrl,
    this.studyType,
    this.partnerName,
    this.categoryName,
    this.smallImagePath,
    this.videoPath,
  });

  Course.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    categoryID = json['CategoryID'];
    partnerID = json['PartnerID'];
    name = json['Name'];
    brief = json['Brief'];
    overview = json['Overview'];
    topics = json['Topics'];
    startDate = json['StartDate'];
    requirements = json['Requirements'];
    smallImage = json['SmallImage'];
    type = json['Type'];
    status = json['Status'];
    hoursPerWeek = json['HoursPerWeek'];
    color = json['Color'];
    backColor = json['BackColor'];
    foreColor = json['ForeColor'];
    secondBackColor = json['SecondBackColor'];
    secondForeColor = json['SecondForeColor'];
    video = json['Video'];
    videoUrl = json['VideoUrl'];
    studyType = json['StudyType'];
    partnerName = json['PartnerName'];
    categoryName = json['CategoryName'];
    smallImagePath = json['SmallImagePath'];
    videoPath = json['VideoPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['CategoryID'] = this.categoryID;
    data['PartnerID'] = this.partnerID;
    data['Name'] = this.name;
    data['Brief'] = this.brief;
    data['Overview'] = this.overview;
    data['Topics'] = this.topics;
    data['StartDate'] = this.startDate;
    data['Requirements'] = this.requirements;
    data['SmallImage'] = this.smallImage;
    data['Type'] = this.type;
    data['Status'] = this.status;
    data['HoursPerWeek'] = this.hoursPerWeek;
    data['Color'] = this.color;
    data['BackColor'] = this.backColor;
    data['ForeColor'] = this.foreColor;
    data['SecondBackColor'] = this.secondBackColor;
    data['SecondForeColor'] = this.secondForeColor;
    data['Video'] = this.video;
    data['VideoUrl'] = this.videoUrl;
    data['StudyType'] = this.studyType;
    data['PartnerName'] = this.partnerName;
    data['CategoryName'] = this.categoryName;
    data['SmallImagePath'] = this.smallImagePath;
    data['VideoPath'] = this.videoPath;
    return data;
  }
}

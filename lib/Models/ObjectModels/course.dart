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
  String partnerName;
  String categoryName;
  String smallImagePath;

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
    this.partnerName,
    this.categoryName,
    this.smallImagePath,
    this.color,
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
    partnerName = json['PartnerName'];
    categoryName = json['CategoryName'];
    smallImagePath = json['SmallImagePath'];
    color = json['Color'];
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
    data['PartnerName'] = this.partnerName;
    data['CategoryName'] = this.categoryName;
    data['SmallImagePath'] = this.smallImagePath;
    data['Color'] = this.color;
    return data;
  }
}

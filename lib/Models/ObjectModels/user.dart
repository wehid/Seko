class User {
  String id;
  String username;
  String password;
  String type;
  String status;
  String name;
  String family;
  String email;
  String website;
  String mobile;
  String image;
  String introduction;
  String provinceID;
  String cityID;
  String townID;
  String createDate;
  String modifiedDate;
  String partnerID;
  String token;
  String tokenExpireDate;
  String partnerName;
  String initials;
  String imagePath;

  User({
    this.id,
    this.username,
    this.password,
    this.type,
    this.status,
    this.name,
    this.family,
    this.email,
    this.website,
    this.mobile,
    this.image,
    this.introduction,
    this.provinceID,
    this.cityID,
    this.townID,
    this.createDate,
    this.modifiedDate,
    this.partnerID,
    this.token,
    this.tokenExpireDate,
    this.partnerName,
    this.initials,
    this.imagePath,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    username = json['Username'];
    password = json['Password'];
    type = json['Type'];
    status = json['Status'];
    name = json['Name'];
    family = json['Family'];
    email = json['Email'];
    website = json['Website'];
    mobile = json['Mobile'];
    image = json['Image'];
    introduction = json['Introduction'];
    provinceID = json['ProvinceID'];
    cityID = json['CityID'];
    townID = json['TownID'];
    createDate = json['CreateDate'];
    modifiedDate = json['ModifiedDate'];
    partnerID = json['PartnerID'];
    token = json['Token'];
    tokenExpireDate = json['TokenExpireDate'];
    partnerName = json['PartnerName'];
    initials = json['Initials'];
    imagePath = json['ImagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['Username'] = this.username;
    data['Password'] = this.password;
    data['Type'] = this.type;
    data['Status'] = this.status;
    data['Name'] = this.name;
    data['Family'] = this.family;
    data['Email'] = this.email;
    data['Website'] = this.website;
    data['Mobile'] = this.mobile;
    data['Image'] = this.image;
    data['Introduction'] = this.introduction;
    data['ProvinceID'] = this.provinceID;
    data['CityID'] = this.cityID;
    data['TownID'] = this.townID;
    data['CreateDate'] = this.createDate;
    data['ModifiedDate'] = this.modifiedDate;
    data['PartnerID'] = this.partnerID;
    data['Token'] = this.token;
    data['TokenExpireDate'] = this.tokenExpireDate;
    data['PartnerName'] = this.partnerName;
    data['Initials'] = this.initials;
    data['ImagePath'] = this.imagePath;
    return data;
  }
}

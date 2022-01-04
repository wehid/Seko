class SquadMember {
  String id;
  String squadId;
  String memberId;
  String squadName;
  String memberUsername;
  String memberName;
  String memberFamily;
  String memberImage;
  String memberImagePath;

  SquadMember({
    this.id,
    this.squadId,
    this.memberId,
    this.squadName,
    this.memberUsername,
    this.memberName,
    this.memberFamily,
    this.memberImage,
    this.memberImagePath,
  });

  SquadMember.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    squadId = json['SquadID'];
    memberId = json['MemberID'];
    squadName = json['SquadName'];
    memberUsername = json['MemberUsername'];
    memberName = json['MemberName'];
    memberFamily = json['MemberFamily'];
    memberImage = json['MemberImage'];
    memberImagePath = json['MemberImagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['SquadID'] = this.squadId;
    data['MemberID'] = this.memberId;
    data['SquadName'] = this.squadName;
    data['MemberUsername'] = this.memberUsername;
    data['MemberName'] = this.memberName;
    data['MemberFamily'] = this.memberFamily;
    data['MemberImage'] = this.memberImage;
    data['MemberImagePath'] = this.memberImagePath;
    return data;
  }
}

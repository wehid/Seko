import 'squad_member.dart';

class Squad {
  String id;
  String supervisorId;
  String title;
  String supervisorUsername;
  String supervisorName;
  String supervisorFamily;
  String supervisorImage;
  String supervisorImagePath;
  List<SquadMember> members;

  Squad({
    this.id,
    this.supervisorId,
    this.title,
    this.supervisorUsername,
    this.supervisorName,
    this.supervisorFamily,
    this.supervisorImage,
    this.supervisorImagePath,
    this.members,
  });

  Squad.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    supervisorId = json['SupervisorID'];
    title = json['Title'];
    supervisorUsername = json['SupervisorUsername'];
    supervisorName = json['SupervisorName'];
    supervisorFamily = json['SupervisorFamily'];
    supervisorImage = json['SupervisorImage'];
    supervisorImagePath = json['SupervisorImagePath'];
    if (json['Members'] != null) {
      members = <SquadMember>[];
      json['Members'].forEach((v) {
        members.add(new SquadMember.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['SupervisorID'] = this.supervisorId;
    data['Title'] = this.title;
    data['SupervisorUsername'] = this.supervisorUsername;
    data['SupervisorName'] = this.supervisorName;
    data['SupervisorFamily'] = this.supervisorFamily;
    data['SupervisorImage'] = this.supervisorImage;
    data['SupervisorImagePath'] = this.supervisorImagePath;
    if (this.members != null) {
      data['Members'] = this.members.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

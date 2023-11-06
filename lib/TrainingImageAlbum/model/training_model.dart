// class TrainingModel {
//   List<TrainingModelData>? data;
//   int? statusCode;
//   String? statusMessage;

//   TrainingModel({this.data, this.statusCode, this.statusMessage});

//   TrainingModel.fromJson(Map<String, dynamic> json) {
//     if (json['Data'] != null) {
//       data = <TrainingModelData>[];
//       json['Data'].forEach((v) {
//         data!.add(new TrainingModelData.fromJson(v));
//       });
//     }
//     statusCode = json['statusCode'];
//     statusMessage = json['statusMessage'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['Data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['statusCode'] = this.statusCode;
//     data['statusMessage'] = this.statusMessage;
//     return data;
//   }
// }

// class TrainingModelData {
//   String? rotaId;
//   String? region;
//   String? branch;
//   String? siteCode;
//   String? siteName;
//   String? trainerName;
//   String? trainingTime;
//   String? trainingImages;

//   TrainingModelData(
//       {this.rotaId,
//       this.region,
//       this.branch,
//       this.siteCode,
//       this.siteName,
//       this.trainerName,
//       this.trainingTime,
//       this.trainingImages});

//   TrainingModelData.fromJson(Map<String, dynamic> json) {
//     rotaId = json['RotaId'];
//     region = json['Region'];
//     branch = json['Branch'];
//     siteCode = json['SiteCode'];
//     siteName = json['SiteName'];
//     trainerName = json['TrainerName'];
//     trainingTime = json['TrainingTime'];
//     trainingImages = json['TrainingImages'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['RotaId'] = rotaId;
//     data['Region'] = this.region;
//     data['Branch'] = this.branch;
//     data['SiteCode'] = this.siteCode;
//     data['SiteName'] = this.siteName;
//     data['TrainerName'] = this.trainerName;
//     data['TrainingTime'] = this.trainingTime;
//     data['TrainingImages'] = this.trainingImages;
//     return data;
//   }
// }






class TrainingModel {
  List<Data>? data;
  int? statusCode;
  String? statusMessage;

  TrainingModel({this.data, this.statusCode, this.statusMessage});

  TrainingModel.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    statusCode = json['statusCode'];
    statusMessage = json['statusMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['statusCode'] = this.statusCode;
    data['statusMessage'] = this.statusMessage;
    return data;
  }
}

class Data {
  String? rotaId;
  String? region;
  String? branch;
  String? siteCode;
  String? siteName;
  String? trainerName;
  String? trainingTime;
  String? trainingImages;

  Data(
      {this.rotaId,
      this.region,
      this.branch,
      this.siteCode,
      this.siteName,
      this.trainerName,
      this.trainingTime,
      this.trainingImages});

  Data.fromJson(Map<String, dynamic> json) {
    rotaId = json['RotaId'];
    region = json['Region'];
    branch = json['Branch'];
    siteCode = json['SiteCode'];
    siteName = json['SiteName'];
    trainerName = json['TrainerName'];
    trainingTime = json['TrainingTime'];
    trainingImages = json['TrainingImages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RotaId'] = this.rotaId;
    data['Region'] = this.region;
    data['Branch'] = this.branch;
    data['SiteCode'] = this.siteCode;
    data['SiteName'] = this.siteName;
    data['TrainerName'] = this.trainerName;
    data['TrainingTime'] = this.trainingTime;
    data['TrainingImages'] = this.trainingImages;
    return data;
  }
}











import 'dart:convert';

List<GetQModel> GetQModelFromJson(dynamic str) =>
    List<GetQModel>.from (str.map((x) => GetQModel.fromJson(x)));

String GetQModelToJson(List<GetQModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetQModel {
  int? taskId;
  String? taskName;
  String? id;
  dynamic taskCount;
  int? taskStatus;
  DateTime? taskDate;
  dynamic activityId;
  List<FormList>? formList;

  GetQModel({
    required this.taskId,
    required this.taskName,
    required this.id,
    this.taskCount,
    required this.taskStatus,
    required this.taskDate,
    this.activityId,
    required this.formList,
  });

  factory GetQModel.fromJson(Map<String, dynamic> json) => GetQModel(
        taskId: json["taskId"],
        taskName: json["taskName"],
        id: json["id"],
        taskCount: json["taskCount"],
        taskStatus: json["taskStatus"],
        taskDate: DateTime.parse(json["taskDate"]),
        activityId: json["activityId"],
        formList: List<FormList>.from(
            json["formList"].map((x) => FormList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "taskId": taskId,
        "taskName": taskName,
        "id": id,
        "taskCount": taskCount,
        "taskStatus": taskStatus,
        "taskDate": taskDate!.toIso8601String(),
        "activityId": activityId,
        "formList": List<dynamic>.from(formList!.map((x) => x.toJson())),
      };
}

class FormList {
  int formId;
  int parentId;
  String formName;
  String dataPoint;
  String dataName;
  String qrCode;
  int isCompleted;
  String formJson;
  List<dynamic> subFormList;

  FormList({
    required this.formId,
    required this.parentId,
    required this.formName,
    required this.dataPoint,
    required this.dataName,
    required this.qrCode,
    required this.isCompleted,
    required this.formJson,
    required this.subFormList,
  });

  factory FormList.fromJson(Map<String, dynamic> json) => FormList(
        formId: json["formId"],
        parentId: json["parentId"],
        formName: json["formName"],
        dataPoint: json["dataPoint"],
        dataName: json["dataName"],
        qrCode: json["qrCode"],
        isCompleted: json["isCompleted"],
        formJson: json["formJson"],
        subFormList: List<dynamic>.from(json["subFormList"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "formId": formId,
        "parentId": parentId,
        "formName": formName,
        "dataPoint": dataPoint,
        "dataName": dataName,
        "qrCode": qrCode,
        "isCompleted": isCompleted,
        "formJson": formJson,
        "subFormList": List<dynamic>.from(subFormList.map((x) => x)),
      };
}


// class GetQModel {
//   int? taskId;
//   String? taskName;
//   String? id;
//   Null? taskCount;
//   int? taskStatus;
//   String? taskDate;
//   Null? activityId;
//   List<FormList>? formList;

//   GetQModel(
//       {this.taskId,
//       this.taskName,
//       this.id,
//       this.taskCount,
//       this.taskStatus,
//       this.taskDate,
//       this.activityId,
//       this.formList});

//   GetQModel.fromJson(Map<String, dynamic> json) {
//     taskId = json['taskId'];
//     taskName = json['taskName'];
//     id = json['id'];
//     taskCount = json['taskCount'];
//     taskStatus = json['taskStatus'];
//     taskDate = json['taskDate'];
//     activityId = json['activityId'];
//     if (json['formList'] != null) {
//       formList = <FormList>[];
//       json['formList'].forEach((v) {
//         formList!.add(new FormList.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['taskId'] = this.taskId;
//     data['taskName'] = this.taskName;
//     data['id'] = this.id;
//     data['taskCount'] = this.taskCount;
//     data['taskStatus'] = this.taskStatus;
//     data['taskDate'] = this.taskDate;
//     data['activityId'] = this.activityId;
//     if (this.formList != null) {
//       data['formList'] = this.formList!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class FormList {
//   int? formId;
//   int? parentId;
//   String? formName;
//   String? dataPoint;
//   String? dataName;
//   String? qrCode;
//   int? isCompleted;
//   String? formJson;
//   List<Null>? subFormList;

//   FormList(
//       {this.formId,
//       this.parentId,
//       this.formName,
//       this.dataPoint,
//       this.dataName,
//       this.qrCode,
//       this.isCompleted,
//       this.formJson,
//       this.subFormList});

//   FormList.fromJson(Map<String, dynamic> json) {
//     formId = json['formId'];
//     parentId = json['parentId'];
//     formName = json['formName'];
//     dataPoint = json['dataPoint'];
//     dataName = json['dataName'];
//     qrCode = json['qrCode'];
//     isCompleted = json['isCompleted'];
//     formJson = json['formJson'];
//     if (json['subFormList'] != null) {
//       subFormList = <Null>[];
//       json['subFormList'].forEach((v) {
//         subFormList!.add(new Null.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['formId'] = this.formId;
//     data['parentId'] = this.parentId;
//     data['formName'] = this.formName;
//     data['dataPoint'] = this.dataPoint;
//     data['dataName'] = this.dataName;
//     data['qrCode'] = this.qrCode;
//     data['isCompleted'] = this.isCompleted;
//     data['formJson'] = this.formJson;
//     if (this.subFormList != null) {
//       data['subFormList'] = this.subFormList!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

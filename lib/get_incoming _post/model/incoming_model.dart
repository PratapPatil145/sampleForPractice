// class IncomingModel {
//     int statusCode;
//     String statusMessage;
//     List<Datum> data;

//     IncomingModel({
//         required this.statusCode,
//         required this.statusMessage,
//         required this.data,
//     });

 

// }

// class Datum {
//     String id;
//     int chatId;
//     String subCategory;
//     int subCategoryId;
//     int senderId;
//     String senderName;
//     String message;
//     DateTime chatDate;
//     int isStar;
//     dynamic chatComments;
//     int isblockUser;
//     int repostChatId;
//     int isRepost;
//     DateTime repostDate;
//     dynamic colour;
//     dynamic fontColour;
//     String linkedIn;
//     String whatsApp;
//     String telegram;
//     String topmate;
//     dynamic twitter;
//     dynamic mediumBlog;
//     dynamic subStack;
//     dynamic other;
//     dynamic youTube;
//     dynamic facebook;
//     dynamic instagram;
//     dynamic isFacebook;
//     dynamic isInstagram;
//     dynamic meetPro;
//     dynamic isMeetPro;
//     String userDescription;
//     int membersCount;
//     int commentCount;
//     String duration;
//     // CommentName commentName;
//     String isExpert;
//     String? userImage;
//     dynamic isLinkedIn;
//     dynamic isWhatsApp;
//     dynamic isTelegram;
//     dynamic isTopmate;
//     int nextPostId;
//     int nextUserId;
//     int prevPostId;
//     int prevUserId;

//     Datum({
//         required this.id,
//         required this.chatId,
//         required this.subCategory,
//         required this.subCategoryId,
//         required this.senderId,
//         required this.senderName,
//         required this.message,
//         required this.chatDate,
//         required this.isStar,
//         this.chatComments,
//         required this.isblockUser,
//         required this.repostChatId,
//         required this.isRepost,
//         required this.repostDate,
//         this.colour,
//         this.fontColour,
//         required this.linkedIn,
//         required this.whatsApp,
//         required this.telegram,
//         required this.topmate,
//         this.twitter,
//         this.mediumBlog,
//         this.subStack,
//         this.other,
//         this.youTube,
//         this.facebook,
//         this.instagram,
//         this.isFacebook,
//         this.isInstagram,
//         this.meetPro,
//         this.isMeetPro,
//         required this.userDescription,
//         required this.membersCount,
//         required this.commentCount,
//         required this.duration,
//         // required this.commentName,
//         required this.isExpert,
//         this.userImage,
//         this.isLinkedIn,
//         this.isWhatsApp,
//         this.isTelegram,
//         this.isTopmate,
//         required this.nextPostId,
//         required this.nextUserId,
//         required this.prevPostId,
//         required this.prevUserId,
//     });

// }

class IncomingModel {
  int? statusCode;
  String? statusMessage;
  List<Data>? data;

  IncomingModel({this.statusCode, this.statusMessage, this.data});

  IncomingModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    statusMessage = json['statusMessage'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['statusMessage'] = this.statusMessage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  int? chatId;
  String? subCategory;
  int? subCategoryId;
  int? senderId;
  String? senderName;
  String? message;
  String? chatDate;
  int? isStar;
  Null? chatComments;
  int? isblockUser;
  int? repostChatId;
  int? isRepost;
  String? repostDate;
  Null? colour;
  Null? fontColour;
  String? linkedIn;
  String? whatsApp;
  String? telegram;
  String? topmate;
  Null? twitter;
  Null? mediumBlog;
  Null? subStack;
  Null? other;
  Null? youTube;
  Null? facebook;
  Null? instagram;
  Null? isFacebook;
  Null? isInstagram;
  Null? meetPro;
  Null? isMeetPro;
  String? userDescription;
  int? membersCount;
  int? commentCount;
  String? duration;
  String? commentName;
  String? isExpert;
  String? userImage;
  Null? isLinkedIn;
  Null? isWhatsApp;
  Null? isTelegram;
  Null? isTopmate;
  int? nextPostId;
  int? nextUserId;
  int? prevPostId;
  int? prevUserId;

  Data(
      {this.sId,
      this.chatId,
      this.subCategory,
      this.subCategoryId,
      this.senderId,
      this.senderName,
      this.message,
      this.chatDate,
      this.isStar,
      this.chatComments,
      this.isblockUser,
      this.repostChatId,
      this.isRepost,
      this.repostDate,
      this.colour,
      this.fontColour,
      this.linkedIn,
      this.whatsApp,
      this.telegram,
      this.topmate,
      this.twitter,
      this.mediumBlog,
      this.subStack,
      this.other,
      this.youTube,
      this.facebook,
      this.instagram,
      this.isFacebook,
      this.isInstagram,
      this.meetPro,
      this.isMeetPro,
      this.userDescription,
      this.membersCount,
      this.commentCount,
      this.duration,
      this.commentName,
      this.isExpert,
      this.userImage,
      this.isLinkedIn,
      this.isWhatsApp,
      this.isTelegram,
      this.isTopmate,
      this.nextPostId,
      this.nextUserId,
      this.prevPostId,
      this.prevUserId});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    chatId = json['chatId'];
    subCategory = json['subCategory'];
    subCategoryId = json['subCategoryId'];
    senderId = json['senderId'];
    senderName = json['senderName'];
    message = json['message'];
    chatDate = json['chatDate'];
    isStar = json['isStar'];
    chatComments = json['chatComments'];
    isblockUser = json['isblockUser'];
    repostChatId = json['repostChatId'];
    isRepost = json['isRepost'];
    repostDate = json['repostDate'];
    colour = json['colour'];
    fontColour = json['fontColour'];
    linkedIn = json['linkedIn'];
    whatsApp = json['whatsApp'];
    telegram = json['telegram'];
    topmate = json['topmate'];
    twitter = json['twitter'];
    mediumBlog = json['mediumBlog'];
    subStack = json['subStack'];
    other = json['other'];
    youTube = json['youTube'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    isFacebook = json['isFacebook'];
    isInstagram = json['isInstagram'];
    meetPro = json['meetPro'];
    isMeetPro = json['isMeetPro'];
    userDescription = json['userDescription'];
    membersCount = json['membersCount'];
    commentCount = json['commentCount'];
    duration = json['duration'];
    commentName = json['commentName'];
    isExpert = json['isExpert'];
    userImage = json['userImage'];
    isLinkedIn = json['isLinkedIn'];
    isWhatsApp = json['isWhatsApp'];
    isTelegram = json['isTelegram'];
    isTopmate = json['isTopmate'];
    nextPostId = json['nextPostId'];
    nextUserId = json['nextUserId'];
    prevPostId = json['prevPostId'];
    prevUserId = json['prevUserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['chatId'] = this.chatId;
    data['subCategory'] = this.subCategory;
    data['subCategoryId'] = this.subCategoryId;
    data['senderId'] = this.senderId;
    data['senderName'] = this.senderName;
    data['message'] = this.message;
    data['chatDate'] = this.chatDate;
    data['isStar'] = this.isStar;
    data['chatComments'] = this.chatComments;
    data['isblockUser'] = this.isblockUser;
    data['repostChatId'] = this.repostChatId;
    data['isRepost'] = this.isRepost;
    data['repostDate'] = this.repostDate;
    data['colour'] = this.colour;
    data['fontColour'] = this.fontColour;
    data['linkedIn'] = this.linkedIn;
    data['whatsApp'] = this.whatsApp;
    data['telegram'] = this.telegram;
    data['topmate'] = this.topmate;
    data['twitter'] = this.twitter;
    data['mediumBlog'] = this.mediumBlog;
    data['subStack'] = this.subStack;
    data['other'] = this.other;
    data['youTube'] = this.youTube;
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['isFacebook'] = this.isFacebook;
    data['isInstagram'] = this.isInstagram;
    data['meetPro'] = this.meetPro;
    data['isMeetPro'] = this.isMeetPro;
    data['userDescription'] = this.userDescription;
    data['membersCount'] = this.membersCount;
    data['commentCount'] = this.commentCount;
    data['duration'] = this.duration;
    data['commentName'] = this.commentName;
    data['isExpert'] = this.isExpert;
    data['userImage'] = this.userImage;
    data['isLinkedIn'] = this.isLinkedIn;
    data['isWhatsApp'] = this.isWhatsApp;
    data['isTelegram'] = this.isTelegram;
    data['isTopmate'] = this.isTopmate;
    data['nextPostId'] = this.nextPostId;
    data['nextUserId'] = this.nextUserId;
    data['prevPostId'] = this.prevPostId;
    data['prevUserId'] = this.prevUserId;
    return data;
  }
}
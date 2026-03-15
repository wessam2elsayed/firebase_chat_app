import 'package:cloud_firestore/cloud_firestore.dart';
class MessageModel {
  final String? senderId;
  final String? text;
  final String? time;

  MessageModel({
    required this.senderId, 
    required this.text, 
    required this.time});

  factory MessageModel.fromJson(Map<String , dynamic> json){
    return MessageModel(
      senderId: json["senderid"]??"",
      text: json["text"]??"",
      time: json["time"]!= null
      ?json["time"] is Timestamp
      ?(json["time"]as Timestamp).toDate().toString()
       : json["time"].toString()
      :"",
      

    );
  }  

  Map<String, dynamic> tojson() {
    return {
      'senderid': senderId, 
      'text': text,
      'time': Timestamp.now(),
    };
  }
  
}
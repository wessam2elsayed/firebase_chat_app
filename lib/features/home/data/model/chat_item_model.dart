import 'package:firebase_chat_app/features/home/data/model/message_model.dart';
import 'package:firebase_chat_app/features/home/data/model/user_model.dart';

class ChatItemModel {
  final String? id;
  final String? name;
  final String? image;
  final List<MessageModel> message;
  // final String? time;
  // final String? unreadCount;
  final List<dynamic> users;

  ChatItemModel({
    required this.id, 
    required this.name, 
    required this.image, 
    required this.message, 
    // required this.time, 
    // required this.unreadCount, 
    required this.users, 
    
    });

  factory ChatItemModel.fromjson(
    Map<String,dynamic>json , 
    UserModel userModel,
    String docId,
    ){
      final rawMessages = json["messages"]as List?  ??[];
      
      return ChatItemModel(
        id: docId, 
        name: userModel.name??"", 
        image: userModel.image??"", 
        message: rawMessages.map((e)=>MessageModel.fromJson(e)).toList(), 
        users: List<String>.from(json["users"]?? []),
        );
    }
   
      
  // Map<String,dynamic>tojson()=>{
  //   "name":name,
  //   "image":image,
  //   "message":message,
  //   "time":time,
  //   "unreadCount":unreadCount
  // };

  

}
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
      senderId: json["senderId"],
      text: json["message"],
      time: json["time"]
    );
  }  
}
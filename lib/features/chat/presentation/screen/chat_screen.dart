import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat_app/core/theme/app_colors.dart';
import 'package:firebase_chat_app/core/utils/app_strings.dart';
import 'package:firebase_chat_app/features/home/data/model/message_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String chatId;
  final String otherUserName;
  // final String otherUserImage;
  const ChatScreen({
    super.key, 
    required this.chatId, 
    required this.otherUserName, 
    // required this.otherUserImage
    });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController _messaageController=TextEditingController();
  final ScrollController _scrollController=ScrollController();

  void sendMessage()async{
    print("-----------wwwwwww---------");
    final text= _messaageController.text;
    if(text.isEmpty)return;
    _messaageController.clear();

    final currentUserId = FirebaseAuth.instance.currentUser!.uid;
    
    final newMessage= MessageModel(
      
      senderId: currentUserId, 
      text: text, 
      time: DateTime.now().toIso8601String(),
      );

      // _messaageController.clear();

      await FirebaseFirestore.instance
      .collection("chats")
      .doc(widget.chatId)
      .update(
        {
          "messages":FieldValue.arrayUnion([newMessage])
        }
      );

  }

  @override
  void dispose() {
    _messaageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final currentUserId = FirebaseAuth.instance.currentUser!.uid;

    print("Chat ID is: '${widget.chatId}'");

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.otherUserName
          ),
      ),
      body: Column(
        children: [
          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
            .collection("chats")
            .doc(widget.chatId)
            .snapshots(),

            builder: (context, snapshot) {

              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }

              if(snapshot.hasError){
                return Center(child: Text(AppStrings.error),);
              }

              if(snapshot.hasData || snapshot.data!.exists){

                final data = snapshot.data!.data() as   Map<String , dynamic>? ?? {};
                final rawMessages = data["messages"] as List<dynamic>? ?? [];
                final messages = rawMessages
                .map((e)=> MessageModel.fromJson(e as Map<String , dynamic>)
                ).toList();
              

              return ListView.builder(
                      itemCount: messages.length,
                      shrinkWrap: true,
                      itemBuilder: (context,index){

                        final msg = messages[index];
                        final isMe = msg.senderId == currentUserId;

              return Align(
                alignment:isMe
                ? Alignment.centerRight
                : Alignment.centerLeft,

                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  decoration: BoxDecoration(

                    color: isMe
                    ?AppColors.purple
                    :AppColors.blue,

                    borderRadius: isMe
                    ? BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15)
                    )
                    :BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15)
                    )               
                  ),
                  child: Text(msg.text?? 
                    AppStrings.hi,
                  style: TextStyle(
                    color: AppColors.white
                  ),),
                ),
              );
                      });
              }else{
                return SizedBox.shrink();
              }
            },
          ),

        Spacer(),

        Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // image: DecorationImage
                // (image: NetworkImage(widget.otherUserImage))
              ),
            ),

            Expanded(
              child: TextFormField(
                controller: _messaageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  hintText: AppStrings.type
                ),
              )),

              IconButton(
                onPressed: (){
                  sendMessage();
                }, 
                icon: Icon(Icons.send,
                color: AppColors.blue,
                size: 30,))
          ],
        ),
        const SizedBox(height: 40,),
        ],
      )
    );
  }
}
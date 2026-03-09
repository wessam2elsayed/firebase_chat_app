import 'package:firebase_chat_app/core/theme/app_colors.dart';
import 'package:firebase_chat_app/core/utils/app_strings.dart';
import 'package:firebase_chat_app/features/home/data/model/chat_item_model.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final ChatItemModel chatItemModel;
  const ChatItem({super.key, required this.chatItemModel});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){},
      child: Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.purple,
                width: 2)
              ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage:  chatItemModel.image!=null&&chatItemModel.image!.isNotEmpty
                    ?AssetImage(chatItemModel.image!)
                    :AssetImage("assets/unknown_person.jpg",),),
                     title: Text(chatItemModel.name.toString()),
                subtitle: Text(chatItemModel.message.isNotEmpty
                ?chatItemModel.message.last.text??""
                :"No messages yet",
                overflow: TextOverflow.ellipsis,),
                trailing: Column(
                  children: [
                    Text(chatItemModel.message.isNotEmpty
                    ?chatItemModel.message.last.time??""
                    :"",
                    style: TextStyle(
                      fontSize: 12
                    ),),
                    const SizedBox(height: 10,),
                
              
                    // CircleAvatar(
                    //   radius: 10,
                    //   backgroundColor: AppColors.purple,
                    //   child: Text(chatItemModel.unreadCount??"1",
                    //   style: TextStyle(
                    //     color: AppColors.white
                    //   ),),
                    // )
                  ],
                ),
              ),
            ),
    );
  }
}
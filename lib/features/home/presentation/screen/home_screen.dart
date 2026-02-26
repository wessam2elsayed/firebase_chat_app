import 'package:firebase_chat_app/core/utils/app_strings.dart';
import 'package:firebase_chat_app/features/home/model/chat_item_model.dart';
import 'package:firebase_chat_app/features/home/presentation/widgets/chat_item.dart';
import 'package:firebase_chat_app/features/home/presentation/widgets/search_chat.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: const SizedBox(height: 50)),
          SliverToBoxAdapter(child: SearchChat()) ,

          SliverToBoxAdapter(child: const SizedBox(height: 20)),

          SliverToBoxAdapter(
            child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context,index){
            return ChatItem(
              chatItemModel: ChatItemModel(
                name: AppStrings.wessam, 
                image: "assets/unknown_person.jpg", 
                message: AppStrings.hi, 
                time: "10:00 Am", 
                unreadCount: index.toString()),);
          }, 
          separatorBuilder: (context,index){
            return SizedBox(height: 10,);
          }, 
          itemCount: 10
          ),
          ), 
         
        ],
        ),
      ),
    );
  }
}
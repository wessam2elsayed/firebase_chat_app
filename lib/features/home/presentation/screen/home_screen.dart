import 'package:firebase_chat_app/core/utils/app_strings.dart';
import 'package:firebase_chat_app/features/home/cubit/home_cubit.dart';
import 'package:firebase_chat_app/features/home/data/model/chat_item_model.dart';
import 'package:firebase_chat_app/features/home/presentation/widgets/chat_item.dart';
import 'package:firebase_chat_app/features/home/presentation/widgets/search_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => HomeCubit()..getUserChats(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: const SizedBox(height: 50)),
              SliverToBoxAdapter(child: SearchChat()),

              SliverToBoxAdapter(child: const SizedBox(height: 20)),

              SliverToBoxAdapter(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if(state is GetChatLoading){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    else if(state is GetChatFailure){
                      return Center(child: Text(state.errorMessage),);
                    }
                    else if(state is GetChatSuccess){

                     final chats = state.chats;
                     if(chats.isEmpty){
                      return Center(child: Text(AppStrings.no),);
                     }

                     return ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {

                        final bool hasMessage = chats[index].message.isNotEmpty;
                        final lastMessage=hasMessage
                        ?chats[index].message.last.text
                        :"";

                        final chat=chats[index];
                        
                        return ChatItem(
                          chatItemModel: chat
                          // ChatItemModel(
                          //   name: chat.users!.first,
                          //   image: "assets/unknown_person.jpg",
                          //   message: chat.message,
                          //   users: chat.users, 
                            // id: '',
                            // time: "10:00 Am",
                            // unreadCount: index.toString()
                          // ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 10);
                      },
                      itemCount: chats.length,
                    );
                    }else{
                      return SizedBox.shrink();
                    }
                  
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

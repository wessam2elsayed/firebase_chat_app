import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat_app/features/home/data/model/chat_item_model.dart';
import 'package:firebase_chat_app/features/home/data/model/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  StreamSubscription? streamSubscription;

  void getUserChats(){
    emit(GetChatLoading());
    try{
      final currentUser = FirebaseAuth.instance.currentUser!.uid;
      // final chats=await FirebaseFirestore.instance;
      // chats
      //    .collection("chats")
      //    .where("users",arrayContains: currentUser)
      //    .get();  
      streamSubscription = FirebaseFirestore.instance
      .collection("chats")
      .where("users",arrayContains: currentUser)
      .snapshots()
      .listen((snapshot)async{
        List<ChatItemModel>chats=[];
        final docs = snapshot.docs.map((doc)async{
          final data =doc.data();
          String otherUserId=data["users"][0]==currentUser
          ?data["users"][1]
          :data["users"][0];
          
        final otherUserDoc=await FirebaseFirestore.instance
          .collection("user")
          .doc(otherUserId)
          .get()
          .then((value){
            return UserModel.fromJson(
              value.data()??{},
              );
          });  
        // final otherUser = UserModel.fromJson(otherUserDoc.data()??{});

        return ChatItemModel.fromjson(data , otherUserDoc );

        }).toList();
        chats= await Future.wait(docs);
        // chats.sort(
        //   (a,b){
        //     DateTime timeA= a.message.isNotEmpty
        //     ?  (a.message.last.time as DateTime)
        //     :DateTime(2000);

        //     DateTime timeB = b.message.isNotEmpty
        //     ?(b.message.last.time as DateTime)
        //     :DateTime(2000);

        //     return timeB.compareTo(timeA);
        //   });

          emit(GetChatSuccess(chats: chats));
      });


    }
    on FirebaseAuthException catch(e){
      if(!isClosed){
        debugPrint(e.message.toString());
        emit(GetChatFailure(errorMessage: e.message.toString()));
      }
      
    
    } catch(e){
      if(!isClosed){
        debugPrint(errorPropertyTextConfiguration.toString());
        emit(GetChatFailure(errorMessage: e.toString()));
      }
      
    }
  }
  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}

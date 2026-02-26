import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final TextEditingController emailController =TextEditingController();
  final TextEditingController passwordController =TextEditingController();
  final TextEditingController nameController =TextEditingController();

  final TextEditingController emailControllerLogin =TextEditingController();
  final TextEditingController passwordControllerLogin =TextEditingController();
  
  @override
  Future<void> close()async {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    emailControllerLogin.dispose();
    passwordControllerLogin.dispose();
    return super.close();
  }

  Future<void> signUp(BuildContext context)async{
    final instance= FirebaseAuth.instance;
    emit(SignupLoading());
    try{
      //1 create user
      await instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text);

        //2 get id
        final user=instance.currentUser!.uid;
        //3 add user to firebase
        await FirebaseFirestore.instance.collection("user").doc(user).set({
          "name": nameController.text,
          "email": emailController.text
        });

       

      emit(SignupSuccess());

    }on FirebaseAuthException catch(e){
      emit(SignupFailure(erroeMessage: e.message ?? "Error"));

    }
    catch(e){
      emit(SignupFailure(erroeMessage: e.toString()));
    }
  }

  Future<void> login()async{
    final instance= FirebaseAuth.instance;
    emit(LoginLoading());
    try{
      // login
      await instance.signInWithEmailAndPassword(
        email: emailControllerLogin.text.trim(),
        password: passwordControllerLogin.text.trim());

      emit(LoginSuccess());

    }on FirebaseAuthException catch(e){
      emit(LoginFailure(erroeMessage: e.message ?? "Error"));

    }
    catch(e){
      emit(LoginFailure(erroeMessage: e.toString()));
    }
  }
}

import 'package:firebase_chat_app/features/auth/presentation/screen/login_screen.dart';
import 'package:firebase_chat_app/features/auth/presentation/screen/signup_screen.dart';
import 'package:firebase_chat_app/features/home/presentation/screen/home_screen.dart';
import 'package:firebase_chat_app/features/on_boarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';

abstract class AppRoutes {
    static const onBoardingScreen = "/onBoardingScreen";
    static const loginScreen ="/loginScreen";
    static const homeScreen ="/HomeScreen";
    static const signUpScreen="/SignupScreen";

    static Route<dynamic> onGenerateRoute(RouteSettings settings){
        switch(settings.name){
            case onBoardingScreen:
            return MaterialPageRoute(builder: (_)=> const OnBoardingScreen());

            case loginScreen:
            return MaterialPageRoute(builder: (_)=>  LoginScreen());

            case homeScreen: 
            return MaterialPageRoute(builder: (_)=> const HomeScreen());

            case signUpScreen:
            return MaterialPageRoute(builder: (_)=> const SignupScreen());
        }

         return MaterialPageRoute(
      builder: (_)=>Scaffold(
        body: Center(
          child: 
          Text("No route defined for ${settings.name}")),
      ));
    }
}
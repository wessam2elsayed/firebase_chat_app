import 'package:firebase_chat_app/features/auth/cubit/auth_cubit.dart';
import 'package:firebase_chat_app/features/auth/presentation/screen/login_screen.dart';
import 'package:firebase_chat_app/features/auth/presentation/screen/signup_screen.dart';
import 'package:firebase_chat_app/features/chat/presentation/screen/chat_screen.dart';
import 'package:firebase_chat_app/features/home/presentation/screen/home_screen.dart';
import 'package:firebase_chat_app/features/on_boarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppRoutes {
  static const onBoardingScreen = "/onBoardingScreen";
  static const loginScreen = "/loginScreen";
  static const homeScreen = "/HomeScreen";
  static const signUpScreen = "/SignupScreen";
  static const chatScreen="/chatScreen";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AuthCubit(),
            child: const HomeScreen(),
          ),
        );

      case signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignupScreen());

      // case chatScreen:
      // return  MaterialPageRoute(builder: (_) => const ChatScreen(
      //   chatId: '', 
      //   otherUserName: '', 
      //   otherUserImage: '',));
    }

    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(child: Text("No route defined for ${settings.name}")),
      ),
    );
  }
}

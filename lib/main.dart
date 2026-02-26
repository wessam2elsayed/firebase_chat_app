import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat_app/core/routes/app_routes.dart';
import 'package:firebase_chat_app/features/auth/cubit/auth_cubit.dart';
import 'package:firebase_chat_app/features/home/presentation/screen/home_screen.dart';
import 'package:firebase_chat_app/features/on_boarding/on_boarding_screen.dart';
import 'package:firebase_chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        home:FirebaseAuth.instance.currentUser==null
                  ?OnBoardingScreen()
                  :HomeScreen(), 
      ),
    );
  }
}

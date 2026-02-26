import 'package:firebase_chat_app/core/routes/app_routes.dart';
import 'package:firebase_chat_app/core/theme/app_colors.dart';
import 'package:firebase_chat_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 15,),
            Text(AppStrings.get,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),),
            const SizedBox(height: 15,),
            Text(AppStrings.help,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500
            ),),
            const SizedBox(height: 15,),
            SizedBox(width: 200,height: 250,
            child: Image.asset("assets/Screenshot 2026-02-24 231545.png"),),
            InkWell(
              onTap: (){
                Navigator.pushNamedAndRemoveUntil(
                  context, 
                  AppRoutes.loginScreen, 
                  // FirebaseAuth.instance.currentUser==null
                  // ?AppRoutes.login
                  // :HomeScreen(), 
                  (route)=>false);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(width: 200,height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.purple
                ),
                child: Center(child: Text(AppStrings.start,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.white
                ),)),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
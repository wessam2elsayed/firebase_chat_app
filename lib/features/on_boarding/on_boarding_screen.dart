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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50,),
            Text(AppStrings.get,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold
            ),),
            const SizedBox(height: 30,),
            Text(AppStrings.help,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500
            ),),
            const SizedBox(height: 30,),
            SizedBox(width: 400,height: 300,
            child: Image.asset("assets/Screenshot 2026-02-24 231545.png"),),

            const SizedBox(height: 50,),
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
                child: Container(width: double.infinity,height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.purple
                ),
                child: Center(child: Text(AppStrings.start,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
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
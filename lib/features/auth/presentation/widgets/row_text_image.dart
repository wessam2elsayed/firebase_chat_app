import 'package:firebase_chat_app/core/theme/app_colors.dart';
import 'package:firebase_chat_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class RowTextImage extends StatelessWidget {
  const RowTextImage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
                       CircleAvatar(
                  backgroundColor: AppColors.black,
                  radius: 15,
                  child: CircleAvatar(
                    radius: 13,
                    backgroundColor: AppColors.white,
                    child: IconButton(
                    onPressed: (){
                      // Navigator.pop(context);
                    },
                     icon: Icon(Icons.arrow_back,
                     size: 18,)),
                  )
    
                ),
                const SizedBox(height: 20,),
                      Text(AppStrings.hello,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),),
    
                      const SizedBox(height: 30,),
    
                      Text(AppStrings.happy,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                      ),),
                    ],
                  ),
                 
                 
                  Image.asset("assets/Screenshot.png")
                ],);
  }
}
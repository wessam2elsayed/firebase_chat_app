import 'package:firebase_chat_app/core/theme/app_colors.dart';
import 'package:firebase_chat_app/core/utils/app_strings.dart';
import 'package:firebase_chat_app/features/search/presentation/screen/search_screen.dart';
import 'package:flutter/material.dart';

class SearchChat extends StatelessWidget {
  const SearchChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context)=>SearchScreen()));
                  },
                  child: Container(
                    height: 50,
                    width: 250,
                    // width: MediaQuery.of(context).size.width/1.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.gray,
                    ),
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        label: Text(AppStrings.search,),
                        prefixIcon: Icon(Icons.search)
                      ),
                    ),
                  ),
                ),
              ),
        
        // متكرر ملوش لازمة 
              // const SizedBox(width: 10,),
              // Container(
              //   width: 50,
              //   height: 50,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(15),
              //     color: AppColors.gray
              //   ),
              //   child: Icon(Icons.search),
              // )
            ],
          );
  }
}
import 'package:firebase_chat_app/core/routes/app_routes.dart';
import 'package:firebase_chat_app/core/theme/app_colors.dart';
import 'package:firebase_chat_app/core/utils/app_strings.dart';
import 'package:firebase_chat_app/features/auth/cubit/auth_cubit.dart';
import 'package:firebase_chat_app/features/auth/presentation/widgets/forget_widget.dart';
import 'package:firebase_chat_app/features/auth/presentation/widgets/row_text_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey=GlobalKey<FormState>();
    bool isPassword = true;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                RowTextImage(),
                const SizedBox(height: 20),
            
                Text(
                  AppStrings.email,
            
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: context.read<AuthCubit>().emailControllerLogin,
                  decoration: InputDecoration(
                    fillColor: AppColors.gray,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
            
                Text(
                  AppStrings.password,
            
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: context.read<AuthCubit>().passwordControllerLogin,
                  obscureText: isPassword,
                  decoration: InputDecoration(
                    fillColor: AppColors.gray,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
            
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   ForgetWidget(txt: AppStrings.dont,
                    onpressed: () { 
                       Navigator.pushNamed(context,AppRoutes.signUpScreen);
                   },
                    ),
                   ForgetWidget(txt: AppStrings.forget, onpressed: () {  },),
                ],),
            
                const SizedBox(height: 80),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if(state is LoginSuccess){
                      print("login success");
                      Navigator.pushReplacementNamed(
                        context, 
                        AppRoutes.homeScreen);
                    }else if(state is LoginFailure){
                      print(state.erroeMessage);
                    }
                  },
                  builder: (context, state) {
                    return SizedBox(
                       width: double.infinity,
                       height: 50,
                       child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                           backgroundColor: AppColors.purple
                          ),
                         onPressed: (){
                          context.read<AuthCubit>().login();
                         }, 
                         child: state is LoginLoading? 
                         Center(child: CircularProgressIndicator(),)
                         :Text(AppStrings.login,
                         style: TextStyle(
                          fontSize: 20,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ) 
                      ),
                    
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

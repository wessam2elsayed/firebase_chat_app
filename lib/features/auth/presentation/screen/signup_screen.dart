import 'package:firebase_chat_app/core/theme/app_colors.dart';
import 'package:firebase_chat_app/core/utils/app_strings.dart';
import 'package:firebase_chat_app/features/auth/cubit/auth_cubit.dart';
import 'package:firebase_chat_app/features/auth/presentation/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  

  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> formKey=GlobalKey<FormState>();
    final authCubit = context.read<AuthCubit>();
    bool isPassword = true;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  AppStrings.create,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
            
                Text(AppStrings.account,
                style: TextStyle(fontSize: 15,)),
            
                const SizedBox(height: 20),
            
                Text(
                  AppStrings.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 15),
            
                TextFormField(
                  controller: authCubit.nameController,
                  decoration: InputDecoration(
                    fillColor: AppColors.gray,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
            
                const SizedBox(height: 20),
            
                Text(
                  AppStrings.email,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 15),
            
                TextFormField(
                  controller: authCubit.emailController,
                  decoration: InputDecoration(
                    fillColor: AppColors.gray,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
            
                const SizedBox(height: 20),
            
                Text(
                  AppStrings.password,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 15),
            
                TextFormField(
                  controller: authCubit.passwordController,
                  obscureText: isPassword,
                  decoration: InputDecoration(
                    fillColor: AppColors.gray,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                const SizedBox(height: 100),
            
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context,state){
                    if(state is SignupSuccess){
                       Navigator.pushAndRemoveUntil(
                       context, 
                       MaterialPageRoute(builder: (context)=> LoginScreen()), 
                      (Route)=> false);
                    }
                    if(state is SignupFailure){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.erroeMessage)));
                    }
                  },
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(15),
                          ),
                        ),
                        onPressed: () {
                          authCubit.signUp(context);
                        },
                        child: state is SignupLoading? 
                         Center(child: CircularProgressIndicator(),)
                         : Text(
                          AppStrings.signup,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 20),
                        ),
                      ),
                    );
                  },
                ),
            
                const SizedBox(height: 20),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      AppStrings.already,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                         fontSize: 15),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:do_it/features/Login/presentation/cubit/login_cubit.dart';
import 'package:do_it/features/Login/presentation/cubit/login_states.dart';
import 'package:do_it/features/Register/presentation/views/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/logo.dart';
import '../../../Forget_Password/presentation/views/forget_password_screen.dart';
import '../../../LayOut/presentation/views/layout.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return BlocConsumer<LoginCubit , LoginStates>(
      listener: (context , state ){},
      builder: (context , state){
        return Scaffold(
          appBar: AppBar(),
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: AppLogo(),
                    ),
                    const SizedBox(height: 25),
                    Text("Welcome Back  ",
                        style: Theme.of(context).textTheme.headlineLarge
                    ),
                    // Text("Login To Start Your Whispers",
                    //     style: Theme.of(context).textTheme.bodyLarge
                    // ),
                    const SizedBox(height: 20,),
                    CustomTextField(
                      validateMessage: "Please Enter Your Email",
                      label: "Email",
                      iconData: Iconsax.direct,
                      controller: emailController,
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      controller: passwordController,
                      obscureText: LoginCubit.get(context).isPassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            LoginCubit.get(context).changePassVisibility();
                          },
                          icon: Icon(LoginCubit.get(context).suffix),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16,),
                    Row(
                      children: [
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ForgetPasswordScreen()));
                          },
                          child: const Text("Forgot Password?"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: () {
                        if(formKey.currentState!.validate()){
                          // Handle login logic here
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) => Layout()),
                                  (route) => false
                          );
                          print("Done");
                        }
                      },
                      child: Text("Login".toUpperCase(),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: EdgeInsets.all(16.0),
                        minimumSize: const Size(double.infinity,60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    OutlinedButton(
                      onPressed: (){
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) => RegisterScreen()),
                                (route) => false
                        );
                      },
                      child: Text('create account'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 18,
                        ) ,
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.all(16.0),
                        minimumSize: const Size(double.infinity,60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
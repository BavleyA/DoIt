import 'package:do_it/features/Login/presentation/views/login_screen.dart';
import 'package:do_it/features/Login/presentation/widgets/custom_text_field.dart';
import 'package:do_it/features/Register/presentation/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/logo.dart';
import '../../../LayOut/presentation/views/layout.dart';
import '../cubit/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    final formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),

      child: BlocConsumer<RegisterCubit , RegisterStates>(
        listener: (context , state){},
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
                        obscureText: RegisterCubit.get(context).isPassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              RegisterCubit.get(context).changePassVisibility();
                            },
                            icon: Icon(RegisterCubit.get(context).suffix),
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
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: confirmPasswordController,
                        obscureText: RegisterCubit.get(context).isPassword,
                        decoration: InputDecoration(

                          labelText: 'Confirm Password',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: (){
                              RegisterCubit.get(context).changePassVisibility();
                            },
                            icon: Icon(RegisterCubit.get(context).suffix),

                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16,),
                      Row(
                        children: [
                          const Spacer(),
                          Text('Already Have an Account?'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => LoginScreen()));
                            },
                            child: const Text("Login"),
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
                        child: Text("Register".toUpperCase(),
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

                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

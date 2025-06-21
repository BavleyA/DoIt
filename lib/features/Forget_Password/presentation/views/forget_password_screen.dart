import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/logo.dart';
import '../../../Login/presentation/widgets/custom_text_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: AppLogo(),
              ),
              const SizedBox(height: 25),
              Text("Reset Password , ",
                  style: Theme.of(context).textTheme.headlineLarge
              ),
              const SizedBox(height: 5),
              Text("Please Enter Your E-mail",
                  style: Theme.of(context).textTheme.bodyLarge
              ),
              const SizedBox(height: 20,),
              CustomTextField(
                validateMessage: "Please Enter Your Email",
                label: "Email",
                iconData: Iconsax.direct,
                controller: emailController,),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Send E-mail".toUpperCase(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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
    );
  }
}
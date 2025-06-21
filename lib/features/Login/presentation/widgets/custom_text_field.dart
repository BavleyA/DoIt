import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  late IconData iconData;
  late IconButton? suffixIcon;
  final TextEditingController controller;
  final bool isPassword;
  final String validateMessage;
  CustomTextField({super.key,
    required this.label,
    required this.iconData,
    this.suffixIcon,
    required this.controller,
    this.isPassword= false,
    required this.validateMessage,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (widget.validateMessage.isEmpty ? null : (value) {
        if (value == null || value.isEmpty) {
          return widget.validateMessage;
        }
        return null;
      }),
      obscureText: widget.isPassword ? isObscured : false,
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        prefixIcon: Icon(widget.iconData),
        suffixIcon: widget.isPassword ? IconButton(
            icon: isObscured ? Icon(Iconsax.eye_slash) : Icon(Iconsax.eye),
            onPressed: () {
              setState(() {
                isObscured = !isObscured;
              });
            }
        ) : null,
        label: Text(widget.label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({
    required this.labelText,
    required this.hintText,
    this.prefixText,
    this.type = TextInputType.text,
    this.onSaved,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
    super.key,
  });

  final String labelText;
  final String hintText;
  final String? prefixText;
  final TextInputType type;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool readOnly;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        TextFormField(
          readOnly: readOnly,
          onTap: onTap,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            prefixText: prefixText,
            hintText: hintText,
            errorMaxLines: 10,
            contentPadding: const EdgeInsets.all(16),
            suffixIcon: suffixIcon,
          ),
          keyboardType: type,
          validator: validator,
          onSaved: onSaved,
        ),
      ],
    );
  }
}

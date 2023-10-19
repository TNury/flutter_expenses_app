import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({
    required this.labelText,
    required this.hintText,
    this.prefixText,
    this.type = TextInputType.text,
    this.onChange,
    this.onSaved,
    this.validator,
    super.key,
  });

  final String labelText;
  final String hintText;
  final String? prefixText;
  final TextInputType type;
  final Function(String)? onChange;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;

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
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            prefixText: prefixText,
            hintText: hintText,
            errorMaxLines: 10,
            contentPadding: const EdgeInsets.all(16),
          ),
          keyboardType: type,
          validator: validator,
          onChanged: onChange,
          onSaved: onSaved,
        ),
      ],
    );
  }
}

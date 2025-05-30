import 'package:flutter/material.dart';

Widget buildTextField({
  required TextInputType keyboardType,
  required TextEditingController controller,
  required String labeltext,
  required bool enabled,
  required bool obscureText,
  Widget? suffixIcon,
  FocusNode? focusNode,
  int? maxLength,
}) {
  return Expanded(
    child: TextSelectionTheme(
      data: const TextSelectionThemeData(
          selectionColor: Color(0x1AD9D9D9),
          selectionHandleColor: Color(0xFFFCD535)),
      child: SizedBox(
        height: 50,
        child: TextField(
          keyboardType: keyboardType,
          controller: controller,
          cursorColor: const Color(0xBED9D9D9),
          cursorWidth: 1,
          maxLength: maxLength,
          style: const TextStyle(fontSize: 14, color: Color(0xBED9D9D9)),
          decoration: InputDecoration(
            labelText: labeltext,
            labelStyle: TextStyle(fontSize: 14, color: const Color(0xBED9D9D9)),
            filled: false,
            counterText: '',
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 0.75, color: Color(0xBED9D9D9)),
                borderRadius: BorderRadius.circular(2.5)),
            disabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 0.75, color: Color(0xBED9D9D9)),
                borderRadius: BorderRadius.circular(2.5)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFFCD353)),
                borderRadius: BorderRadius.circular(2.5)),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            suffixIcon: suffixIcon,
          ),
          obscureText: obscureText,
          enabled: enabled,
          focusNode: focusNode,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus!.unfocus();
          },
        ),
      ),
    ),
  );
}

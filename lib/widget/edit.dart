import 'package:flutter/material.dart';

import '../bloc/blocstate.dart';
import '../module/constant.dart';

class MEdit extends StatelessWidget {
  final String hint;
  final Function(String?)? onChange;
  final bool autoFocus;
  final bool notempty;
  final TextEditingController? controller;
  final bool password;
  final BlocState? state;
  final IconData? icon;

  const MEdit(
      {required this.hint,
      required this.autoFocus,
      required this.password,
      this.state,
      this.icon,
      this.notempty = false,
      this.controller,
      this.onChange,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: const TextStyle(fontSize: 18, color: kwhite),
        controller: controller,
        onChanged: onChange,
        validator: (val) {
          if ((val ?? '').isEmpty && notempty) {
            state is CanEmpty;
            return "Enter user name and password";
          }
          return null;
        },
        decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: Constans.normalPadding),
              child: Icon(
                icon,
                color: kwhite.withOpacity(0.4),
                size: 26,
              ),
            ),
            enabled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(Constans.mediumBorderRadios),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kwhite.withOpacity(0.4), width: 2),
              borderRadius: BorderRadius.circular(Constans.mediumBorderRadios),
            ),
            contentPadding: const EdgeInsets.all(26),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8), gapPadding: 18),
            labelText: hint,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
            labelStyle: const TextStyle(
                color: kwhite, fontSize: 16, fontWeight: FontWeight.w600)),
        obscureText: password);
  }
}

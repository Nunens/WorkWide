// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../module/constant.dart';

class InputField extends StatelessWidget {
  final double? size;
  final TextInputType? type;
  final bool? secure;
  final String? hintText;
  final IconData? icon;
  final TextEditingController? contoroller;

  const InputField(
      {this.size,
      this.contoroller,
      this.secure,
      this.icon,
      this.hintText,
      this.type});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
        width: size,
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey.shade600.withOpacity(0.3)),
        child: TextFormField(
          controller: contoroller,
          style: textTheme.button?.copyWith(
            color: kwhite.withOpacity(
              0.6,
            ),
          ),
          cursorColor: kViolet,
          decoration: InputDecoration(
              icon: Icon(
                icon,
                color: kwhite.withOpacity(
                  0.6,
                ),
                size: Constans.defualtIconSize,
              ),
              hintText: hintText,
              hintStyle: textTheme.button?.copyWith(
                  color: kwhite.withOpacity(
                    0.6,
                  ),
                  fontSize: 16),
              border: InputBorder.none),
        ));
  }
}

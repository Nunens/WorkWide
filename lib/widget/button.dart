// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../module/constant.dart';

class MyButton extends StatelessWidget {
  final Function()? press;
  final String text;
  const MyButton({required this.press, required this.text});

  get kwhite => null;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(Constans.mediumBorderRadios),
        ),
        width: double.infinity,
        height: 90,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: kred.withOpacity(0.8)),
            onPressed: press,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
              child: Text(text,
                  style: Theme.of(context)
                      .textTheme
                      .button
                      ?.copyWith(color: kwhite, fontSize: 18)),
            ),
          ),
        ));
  }
}

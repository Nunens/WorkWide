import 'package:flutter/material.dart';
import 'package:workwide_chat/module/extension.dart';

import '../module/constant.dart';

class Error extends StatelessWidget {
  final Exception exception;

  const Error({
    Key? key,
    required this.exception,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      exception.toString(),
      style: context.textTheme.subtitle1!
          .copyWith(color: kred, fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}

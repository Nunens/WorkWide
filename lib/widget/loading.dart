import 'package:flutter/cupertino.dart';
import '../module/constant.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(
        radius: 15,
        color: kwhite,
      ),
    );
  }
}

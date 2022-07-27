import 'package:flutter/material.dart';
import 'package:workwide_chat/module/extension.dart';

import '../module/constant.dart';

class MItemView extends StatelessWidget {
  const MItemView(
      {Key? key,
      required this.img,
      required this.title,
      required this.subTitle,
      required this.ontap,
      required this.iconData,
      required this.time})
      : super(key: key);
  final String img;
  final Function()? ontap;
  final String title;
  final String subTitle;
  final IconData iconData;
  final String time;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      contentPadding: const EdgeInsets.all(0),
      leading: Container(
        padding: const EdgeInsets.all(0),
        width: 60,
        height: 60,
        child: CircleAvatar(
          backgroundColor: kwhite,
          child: ClipOval(
            child: Image.asset(
              img,
              width: 55,
              height: 55,
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: context.textTheme.subtitle1
            ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(
          top: 5,
        ),
        child: Text(
          subTitle,
          style:
              context.textTheme.subtitle2?.copyWith(fontSize: 14, color: grey),
        ),
      ),
      trailing: SizedBox(
        width: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              width: 10,
            ),
            Visibility(
              visible: true,
              child: Icon(
                iconData,
                size: 16,
              ),
            ),
            Text(time,
                style: context.textTheme.headline6
                    ?.copyWith(color: Colors.grey.shade600, fontSize: 15)),
          ],
        ),
      ),
    );
  }
}

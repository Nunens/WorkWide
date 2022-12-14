import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../bloc/blocstate.dart';
import '../bloc/userbloc.dart';
import '../module/constant.dart';
import '../module/extension.dart';
import '../repository/user_data.dart';
import '../widget/button.dart';
import '../widget/edit.dart';

class CreateProfile extends StatelessWidget {
  final BlocState state;
  const CreateProfile({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _username = TextEditingController();
    TextEditingController _bio = TextEditingController();
    final image = BlocProvider.of<UserBloc>(context).img;
    final bloc = UserBloc();
    final userdata = UserData(bloc.client);
    final ImagePicker _picker = ImagePicker();
    return Scaffold(
      backgroundColor: Constans.navyblueshade1,
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(
          Constans.defultpadding,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Create Your profile',
                style: context.textTheme.subtitle1!.copyWith(
                    color: kwhite, fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(0),
                          width: 160,
                          height: 160,
                          child: CircleAvatar(
                              backgroundColor: kgrey300,
                              backgroundImage: image == null
                                  ? const AssetImage('assets/icons/users.png')
                                      as ImageProvider<Object>
                                  : FileImage(File(image.path))))
                    ],
                  ),
                  Positioned(
                      top: 105,
                      left: 120,
                      child: InkWell(
                        borderRadius:
                            BorderRadius.circular(Constans.bigBorderRadios),
                        onTap: () async {
                          context.userbloc.pickImage(_picker);
                        },
                        child: Container(
                            width: 55,
                            height: 55,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: kred),
                            child: const Center(
                                child: Icon(
                              Icons.camera_alt,
                              color: kwhite,
                              size: 28,
                            ))),
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Edit(hint: "Username", autoFocus: false, password: false),
            const SizedBox(
              height: 20,
            ),
            const Edit(hint: "Bio", autoFocus: false, password: false),
            const SizedBox(
              height: 40,
            ),
            MyButton(
                press: () {
                  context.userbloc.createUserStorage(
                      _username.text, _bio.text, image.toString());
                  userdata.uploadProfilePicture(
                      _picker.toString(), image.toString());
                },
                text: "Done")
          ],
        ),
      )),
    );
  }
}

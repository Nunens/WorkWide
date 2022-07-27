import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bloc/blocstate.dart';
import '../module/constant.dart';
import '../module/extension.dart';
import '../module/widgets.dart';
import '../widget/button.dart';
import '../widget/edit.dart';
import '../widget/error.dart';
import '../widget/loading.dart';
import 'register.dart';

TextEditingController _username = TextEditingController();
TextEditingController _password = TextEditingController();

class Login extends StatelessWidget {
  final BlocState state;
  const Login({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _fromKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: Constans.navyblueshade1,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(top: 120, left: 20, right: 20),
              child: Form(
                key: _fromKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Image(
                          image: AssetImage('assets/img/login.png'),
                          width: 200.0,
                          height: 200.0,
                        ),
                        Text(
                          'WorkWide Chat!',
                          style: context.textTheme.subtitle2!.copyWith(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: kwhite),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Welcome back!',
                          textAlign: TextAlign.center,
                          style: context.textTheme.subtitle1!.copyWith(
                              color: kwhite,
                              fontSize: 25,
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Edit(
                            hint: 'Username',
                            autoFocus: false,
                            notempty: false,
                            controller: _username,
                            state: state,
                            password: false),
                        const SizedBox(
                          height: 20,
                        ),
                        Edit(
                            icon: CupertinoIcons.eye_slash,
                            hint: 'Password',
                            autoFocus: false,
                            state: state,
                            controller: _password,
                            notempty: true,
                            password: true),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [const Spacer(), text('Forgot Password')],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        AbsorbPointer(
                            absorbing: state is Loading ? true : false,
                            child: state is Loading
                                ? const Padding(
                                    padding: EdgeInsets.only(top: 30),
                                    child: Loader(),
                                  )
                                : MyButton(
                                    press: () {
                                      if (_fromKey.currentState!.validate()) {
                                        context.userbloc.authenticate(
                                            _username.text,
                                            _password.text,
                                            context);
                                      }
                                    },
                                    text: "Login")),
                        state is Failed
                            ? Error(exception: (state as Failed).exception)
                            : state is CanEmpty
                                ? const Text('Enternter username or password')
                                : Container()
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Not yet registered?",
                                  style: context.textTheme.subtitle1!
                                      .copyWith(color: kwhite)),
                              AbsorbPointer(
                                absorbing: state is Loading ? true : false,
                                child: InkWell(
                                  onTap: () => context.doneAndNavigate(Register(
                                    state: state,
                                  )),
                                  child: Text(" Register now",
                                      style: context.textTheme.subtitle1!
                                          .copyWith(
                                              color: kred.withOpacity(0.8))),
                                ),
                              )
                            ]))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:workwide_chat/module/extension.dart';

import '../bloc/blocstate.dart';
import '../module/constant.dart';

class OnBoard extends StatelessWidget {
  final BlocState state;
  const OnBoard({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Constans.navyblueshade2,
      overrideNext: const Text('', style: TextStyle(color: kblack)),
      isTopSafeArea: true,
      showDoneButton: true,
      done: Text('done', style: TextStyle(color: Constans.whiteShade1)),
      onDone: () {
        context.onboardBlocs.saveFirstTimeUser();
      },
      showSkipButton: true,
      skip: Text('Skip', style: TextStyle(color: Constans.whiteShade1)),
      showNextButton: true,
      onSkip: () {
        state is Welcome;
      },
      pages: [
        PageViewModel(
          image: Lottie.asset('assets/lottie/mobile.json',
              fit: BoxFit.contain, height: 400),
          body: "Your privacy matters",
          title: "WorkWide Chat !",
          decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                  color: kwhite, fontWeight: FontWeight.bold, fontSize: 22),
              bodyTextStyle: TextStyle(color: kwhite, fontSize: 18)),
        ),
        PageViewModel(
          image: Lottie.asset("assets/lottie/chat.json", height: 300),
          body: "Send text, and attachments",
          title: "Chat to friends",
          decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                  color: kwhite, fontWeight: FontWeight.bold, fontSize: 22),
              bodyTextStyle: TextStyle(color: kwhite, fontSize: 18)),
        ),
        PageViewModel(
          image: Lottie.asset("assets/lottie/mobile.json", height: 400),
          body: "Appwrite is an Open-Source self-hosted backend as a service",
          title: "AppWrite - Backend Service",
          decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                  color: kwhite, fontWeight: FontWeight.bold, fontSize: 22),
              bodyTextStyle: TextStyle(color: kwhite, fontSize: 18)),
        ),
      ],
    );
  }
}

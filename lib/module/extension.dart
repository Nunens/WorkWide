import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/onboardbloc.dart';
import '../bloc/userbloc.dart';
import 'constant.dart';

extension ContextExtension on BuildContext {
  OnBoardBloc get onboardBlocs => read<OnBoardBloc>();
  UserBloc get userbloc => read<UserBloc>();

  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  TextTheme get textTheme => Theme.of(this).textTheme;
  void nextScreans(Widget child) =>
      Navigator.push(this, MaterialPageRoute(builder: (context) => child));

  void doneAndNavigate(Widget child) {
    Navigator.pushReplacement(
        this, MaterialPageRoute(builder: (context) => child));
  }
}

extension WidgetsExtension on Widget {
  Widget center(Widget? child) => Center(
        child: child,
      );

  Widget text(child) => Text(
        child,
        style: const TextStyle(color: kwhite, fontSize: 16),
      );
}

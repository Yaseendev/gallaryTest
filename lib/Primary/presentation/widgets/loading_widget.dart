import 'package:flutter/material.dart';
import 'package:gallary_test/Utils/constants.dart';
import 'package:progress_indicators/progress_indicators.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlowingProgressIndicator(
      duration: Duration(milliseconds: 500),
      child: ClipOval(
        child: SizedBox.fromSize(
          size: Size.fromRadius(50),
          child: Image.asset(
            Images.kAppLogo,
            scale: 4,
          ),
        ),
      ),
    );
  }
}

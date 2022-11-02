import 'package:flutter/material.dart';
import 'package:gallary_test/Utils/constants.dart';
import 'package:progress_indicators/progress_indicators.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: GlowingProgressIndicator(
          duration: const Duration(milliseconds: 500),
          child: ClipOval(
            child: Image.asset(
              Images.kAppLogo,
            ),
          ),
        ),
      ),
    );
  }
}

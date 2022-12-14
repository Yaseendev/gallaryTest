import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallary_test/Account/presentation/screens/login_screen.dart';
import 'package:gallary_test/Primary/blocs/router_bloc/router_bloc.dart';
import '../widgets/loading_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RouterBloc, RouterState>(
      listener: (context, state) {
        if (state is RouterLoggedIn) {
          //TODO: Go To Galary screen
        } else if (state is RouterLoggedOut) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => LoginScreen()));
        }
      },
      child: Scaffold(body: LoadingWidget()),
    );
  }
}

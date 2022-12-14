import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:gallary_test/Primary/presentation/screens/splash_screen.dart';
import 'Primary/blocs/router_bloc/router_bloc.dart';
import 'Utils/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await locatorsSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
      providers: [
        BlocProvider<RouterBloc>(
          create: (context) => RouterBloc()..add(PageSelectEvent()),
        ),],
        child: MaterialApp(
          title: 'Gallary App',
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        ),
      );
    });
  }
}

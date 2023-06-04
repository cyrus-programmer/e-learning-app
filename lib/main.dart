import 'package:e_learning_app/app_bloc.dart';
import 'package:e_learning_app/app_states.dart';
import 'package:e_learning_app/common/values/colors.dart';
import 'package:e_learning_app/pages/bloc_providers.dart';
import 'package:e_learning_app/pages/register/register.dart';
import 'package:e_learning_app/pages/sign_in/bloc/signin_bloc.dart';
import 'package:e_learning_app/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_events.dart';
import 'pages/sign_in/signin.dart';
import 'pages/welcome/bloc/welcome_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProvider.allBlocProviders,
      child: ScreenUtilInit(builder: (context, child) {
        return MaterialApp(
          title: 'E learning App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(

          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: AppColors.primaryText
            ),
            elevation: 0,
            backgroundColor: Colors.white
          )
          ),
          home: const Welcome(),
          routes: {
            'myHomePage': (context) => const MyHomePage(),
            "signIn":(context)=> const SignIn(),
            'register':(context)=> const Register()
          },
        );
      }),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Bloc State Management"),
        ),
        body: Center(
          child: BlocBuilder<AppBlocs, AppState>(
            builder: (context, state) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  "${BlocProvider.of<AppBlocs>(context).state.counter}",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              heroTag: "Float-increment",
              onPressed: () =>
                  BlocProvider.of<AppBlocs>(context).add(Increment()),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              heroTag: "Float-Decrement",
              onPressed: () =>
                  BlocProvider.of<AppBlocs>(context).add(Decrement()),
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

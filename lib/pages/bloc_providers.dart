import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_bloc.dart';
import 'sign_in/bloc/signin_bloc.dart';
import 'welcome/bloc/welcome_bloc.dart';

class AppBlocProvider{
  static get allBlocProviders =>[
    BlocProvider(
        create: (context) => WelComeBlocs()),
    BlocProvider(
        create: (context) => AppBlocs()),
    BlocProvider(
        create: (context) => SignInBloc()),
  ];
}
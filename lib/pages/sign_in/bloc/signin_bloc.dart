import 'package:e_learning_app/pages/sign_in/bloc/signin_event.dart';
import 'package:e_learning_app/pages/sign_in/bloc/signin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState>{
  SignInBloc():super(const SignInState()){
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }
  void _emailEvent(EmailEvent event, Emitter<SignInState> emit){
    emit(state.copywit(email: event.email));
  }
  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit){
    emit(state.copywit(password: event.password));
  }
}
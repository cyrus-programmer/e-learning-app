import 'package:e_learning_app/pages/welcome/bloc/welcome_events.dart';
import 'package:e_learning_app/pages/welcome/bloc/welcome_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class WelComeBlocs extends Bloc<WelComeEvents, WelcomeState> {
  WelComeBlocs() : super((WelcomeState())) {
    on<WelComeEvents>((event, emit) {
      emit(WelcomeState(page: state.page));
    });
  }
}

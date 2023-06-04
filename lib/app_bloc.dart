import 'package:e_learning_app/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_events.dart';

class AppBlocs extends Bloc<AppEvents, AppState> {
  AppBlocs() : super(InitState()) {
    on<Increment>((event, emit) {
      emit(AppState(counter: state.counter + 1));
    });
    on<Decrement>((event, emit) {
      emit(AppState(counter: state.counter - 1));
    });
  }
}

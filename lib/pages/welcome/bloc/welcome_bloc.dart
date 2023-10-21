
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_news/pages/welcome/bloc/welcome_state.dart';

part 'welcome_event.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState(page: 0)) {
    on<MoveOnBoardingEvent>(_moveOnBoarding);
  }
  void _moveOnBoarding(MoveOnBoardingEvent event, Emitter<WelcomeState> emit) {
    emit(WelcomeState(page: state.page));
  }
}

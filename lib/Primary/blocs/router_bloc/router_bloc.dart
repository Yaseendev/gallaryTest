import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallary_test/Account/data/repositories/user_repository.dart';
import 'package:gallary_test/Utils/locator.dart';
import 'package:meta/meta.dart';

part 'router_event.dart';
part 'router_state.dart';

class RouterBloc extends Bloc<RouterEvent, RouterState> {
  RouterBloc() : super(RouterInitial()) {
    final UserRepository userRepository = locator.get<UserRepository>();
    on<RouterEvent>((event, emit) async {
      if (await userRepository.isUserLoggedIn()) {
        emit(RouterLoggedIn());
      } else {
        emit(RouterLoggedOut());
      }
    });
  }
}

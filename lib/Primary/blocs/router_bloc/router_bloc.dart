import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'router_event.dart';
part 'router_state.dart';

class RouterBloc extends Bloc<RouterEvent, RouterState> {
  RouterBloc() : super(RouterInitial()) {
    //final UserRepository userAccoountRepository =locator.get<UserRepository>();
    on<RouterEvent>((event, emit) {

    });
  }
}

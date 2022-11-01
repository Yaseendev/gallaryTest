part of 'router_bloc.dart';

@immutable
abstract class RouterState extends Equatable{
  @override
  List<Object?> get props => [];
}

class RouterInitial extends RouterState {}

class RouterLoggedIn extends RouterState {
@override
  List<Object?> get props => [];
}

class RouterLoggedOut extends RouterState {}



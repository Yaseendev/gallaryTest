part of 'router_bloc.dart';

@immutable
abstract class RouterEvent extends Equatable {

}

class PageSelectEvent extends RouterEvent {
  @override
  List<Object> get props => [];
}

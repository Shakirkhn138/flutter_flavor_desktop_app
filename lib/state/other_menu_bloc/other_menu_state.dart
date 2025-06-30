part of 'other_menu_bloc.dart';

abstract class OtherMenuState extends Equatable {
  const OtherMenuState();

  @override
  List<Object> get props => [];
}

class OtherMenuInitial extends OtherMenuState {}

class OtherMenuLoading extends OtherMenuState {}

class OtherMenuLoaded extends OtherMenuState {
  final List<OtherMenuModel> menus;
  const OtherMenuLoaded (this.menus);

  @override
  List<Object> get props => [menus];
}

class OtherMenuError extends OtherMenuState {
  final String error;
  const OtherMenuError (this.error);

  @override
  List<Object> get props => [error];
}
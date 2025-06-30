part of 'other_menu_bloc.dart';

abstract class OtherMenuEvent extends Equatable {
  const OtherMenuEvent();

  @override
  List<Object> get props => [];
}

class LoadOtherMenu extends OtherMenuEvent {}

class AddOtherMenu extends OtherMenuEvent {
  final OtherMenuModel menu;
  const AddOtherMenu (this.menu);

  @override
  List<Object> get props => [menu];
}

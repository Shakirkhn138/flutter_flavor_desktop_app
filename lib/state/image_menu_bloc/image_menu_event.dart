part of 'image_menu_bloc.dart';

abstract class ImageMenuEvent extends Equatable {
  const ImageMenuEvent();

  @override
  List<Object> get props => [];
}

class LoadImageMenu extends ImageMenuEvent {}

class AddImageMenu extends ImageMenuEvent {
  final ImageMenuModel image;
  const AddImageMenu (this.image);

  @override
  List<Object> get props => [image];
}

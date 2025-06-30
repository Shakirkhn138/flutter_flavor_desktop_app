part of 'image_menu_bloc.dart';

abstract class ImageMenuState extends Equatable {
  const ImageMenuState();

  @override
  List<Object> get props => [];
}

class ImageMenuInitial extends ImageMenuState {}

class ImageMenuLoading extends ImageMenuState {}

class ImageMenuLoaded extends ImageMenuState {
  final List<ImageMenuModel> images;
  const ImageMenuLoaded (this.images);

  @override
  List<Object> get props => [images];
}

class ImageMenuError extends ImageMenuState {
  final String error;
  const ImageMenuError (this.error);

  @override
  List<Object> get props => [error];
}
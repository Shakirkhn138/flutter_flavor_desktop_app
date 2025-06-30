import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practice_desktop_app/config/models/image_menu_model.dart';

part 'image_menu_event.dart';
part 'image_menu_state.dart';

class ImageMenuBloc extends Bloc<ImageMenuEvent, ImageMenuState> {
  ImageMenuBloc() : super(ImageMenuInitial()) {
    on<LoadImageMenu>(_loadImage);
    on<AddImageMenu>(_addImage);
  }

  void _loadImage (LoadImageMenu event, Emitter<ImageMenuState> emit){
    final List<ImageMenuModel> imageMenu = [
      ImageMenuModel(image: 'assets/images/pizza.jpg'),
      ImageMenuModel(image: 'assets/images/pizza.jpg'),
      ImageMenuModel(image: 'assets/images/pizza.jpg'),
      ImageMenuModel(image: 'assets/images/pizza.jpg'),
      ImageMenuModel(image: 'assets/images/pizza.jpg'),
      ImageMenuModel(image: 'assets/images/pizza.jpg'),
      ImageMenuModel(image: 'assets/images/pizza.jpg'),
    ];
    emit(ImageMenuLoaded(imageMenu));
  }

  void _addImage (AddImageMenu event, Emitter<ImageMenuState> emit){
    if (state is ImageMenuLoaded){
      final List<ImageMenuModel> updatedImageMenu = List.from((state as ImageMenuLoaded).images)..add(event.image);
      emit(ImageMenuLoaded(updatedImageMenu));
    }
  }
}

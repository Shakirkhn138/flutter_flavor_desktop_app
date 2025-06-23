

class MenuDishModel {
  final String name;
  final String image;
  final int mins;
  final double rating;

  const MenuDishModel ({
    required this.name,
    required this.image,
    required this.mins,
    required this.rating
});

}

class MenuTabsModel {
  final String title;
  final List<MenuDishModel> dishes;

  const MenuTabsModel ({
    required this.title,
    required this.dishes
});
}
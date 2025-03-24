import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconpath;
  Color color;
  CategoryModel({
    required this.name,
    required this.iconpath,
    required this.color,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];
    categories.add(
      CategoryModel(
        name: 'plate',
        iconpath: 'assets/icons/plate.svg',
        color: Colors.green,
      ),
    );
    categories.add(
      CategoryModel(
        name: 'cake',
        iconpath: 'assets/icons/cake.svg',
        color: Colors.orange,
      ),
    );
    categories.add(
      CategoryModel(
        name: 'pie',
        iconpath: 'assets/icons/pie.svg',
        color: Colors.red,
      ),
    );
    categories.add(
      CategoryModel(
        name: 'smoothie',
        iconpath: 'assets/icons/orange-snacks.svg',
        color: Colors.purple,
      ),
    );

    return categories;
  }
}

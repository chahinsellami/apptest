class DietModels {
  String name;
  String iconpath;
  String level;
  String duration;
  String calorie;
  bool isSelected;

  DietModels({
    required this.name,
    required this.iconpath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.isSelected,
  });
  static List<DietModels> getDiet() {
    List<DietModels> diet = [];

    diet.add(
      DietModels(
        name: 'breakfast',
        iconpath: 'assets/icons/honey-pancakes.svg',
        level: 'easy',
        duration: '10 min',
        calorie: '200 cal',
        isSelected: true,
      ),
    );
    diet.add(
      DietModels(
        name: 'lunch',
        iconpath: 'assets/icons/honey-pancakes.svg',
        level: 'medium',
        duration: '20 min',
        calorie: '400 cal',
        isSelected: true,
      ),
    );
    diet.add(
      DietModels(
        name: 'dinner',
        iconpath: 'assets/icons/honey-pancakes.svg',
        level: 'hard',
        duration: '30 min',
        calorie: '600 cal',
        isSelected: true,
      ),
    );

    return diet;
  }
}

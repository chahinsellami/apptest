import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/category_models.dart';
import '../models/diet_models.dart'; // Import the CategoryModel class

class Homepage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<CategoryModel> categories = [];
  List<DietModels> diet = [];
  @override
  // ignore: must_call_super
  void _getinitState() {
    categories = CategoryModel.getCategories(); // Initialize categories
    diet = DietModels.getDiet(); // Initialize diet
  }

  @override
  Widget build(BuildContext context) {
    _getinitState(); // Call the method to get categories and diet
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Search(),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                _CategoriesSection(),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Recommendations\nfor diets',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      color: Colors.white,
                      height: 210,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Container(
                            width: 210,
                            decoration: BoxDecoration(
                              color: categories[index].color.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(diet[index].iconpath),
                                Text(
                                  diet[index].name,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  diet[index].level +
                                      ' | ' +
                                      diet[index].duration +
                                      ' | ' +
                                      diet[index].calorie,
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                                Container(
                                  height: 40,
                                  width: 135,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        categories[index].color.withOpacity(
                                          0.2,
                                        ),
                                        categories[index].color.withOpacity(
                                          0.2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder:
                            (context, index) => SizedBox(width: 25),
                        itemCount: diet.length,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(left: 20, right: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _CategoriesSection() {
    return Container(
      height: 120,
      color: Colors.white,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 25),
        padding: EdgeInsets.only(left: 20, right: 20),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: categories[index].color.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(categories[index].iconpath),
                  ),
                ),
                Text(
                  categories[index].name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'breakfast',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            'assets/icons/Arrow - Left 2.svg',
            height: 20,
            width: 20,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              height: 5,
              width: 5,
            ),
          ),
        ),
      ],
    );
  }
}

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey, spreadRadius: 0, blurRadius: 40),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(10),
          hintText: 'Search for recipes',
          hintStyle: TextStyle(color: Color(0xFFA0A0A0), fontSize: 14),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset('assets/icons/Search.svg'),
          ),
          suffix: SizedBox(
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VerticalDivider(
                    color: Colors.black,
                    endIndent: 10,
                    indent: 10,
                    thickness: 0.1,
                  ),
                ],
              ),
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset('assets/icons/Filter.svg'),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

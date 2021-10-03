import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ProviderModel/category_provider.dart';
import '../../Models/ObjectModels/category.dart';

class DropdownCategories extends StatefulWidget {
  @override
  _DropdownCategoriesState createState() => _DropdownCategoriesState();
}

class _DropdownCategoriesState extends State<DropdownCategories> {
  // this category we add to the all category list for the show all category.
  //because category id is above 0, we set the id to -1 to difrent with them.
  final Category _showAllCategory = Category(title: 'هەموو پۆلێنەکان', id: '-1');
  CategoryProvider _categoryProvider;
  List<Category> _categoryList;
  Category _selectedCategory;

  List<Category> _addShowAllCategory(List<Category> categoryList) {
    //check if adding _showAllCategory before
    if(categoryList[0].id != _showAllCategory.id){
      categoryList.insert(0, _showAllCategory);
    }

    return categoryList;
  }

  @override
  void initState() {
    _categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
    _categoryList = _categoryProvider.categoryList;
    _categoryList = _addShowAllCategory(_categoryList);

    _selectedCategory = _categoryList[0];
    super.initState();
  }

  void _handleSelectedCategory(Category selectedCategory){
    if(selectedCategory.id == _showAllCategory.id){
      _categoryProvider.deselectCategory();
    }else{
      _categoryProvider.setSelectedCategory(selectedCategory);
    }
  }

  @override
  Widget build(BuildContext context) {

    return DropdownButton<Category>(
      elevation: 2,
      value: _selectedCategory,
      icon: const Icon(Icons.arrow_downward_outlined),
      iconSize: 20,
      onChanged: (Category newCategory){
        _handleSelectedCategory(newCategory);
        setState(() {
          _selectedCategory = newCategory;
        });
      },
      items: _categoryList.map<DropdownMenuItem<Category>>((category) {
        return DropdownMenuItem<Category>(
          value: category,
          child: Text(category.title, style: TextStyle(fontWeight: FontWeight.bold),),
        );
      }).toList(),
    );
  }
}

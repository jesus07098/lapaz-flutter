import 'package:flutter/material.dart';
import 'package:lapaz_app/src/models/category.dart';
import 'package:lapaz_app/src/models/response_api.dart';
import 'package:lapaz_app/src/models/users.dart';
import 'package:lapaz_app/src/provider/categories_provider.dart';
import 'package:lapaz_app/src/utils/general_snackbar.dart';
import 'package:lapaz_app/src/utils/shared_pref.dart';

class RestaurantCategoriesCreateController {
  BuildContext context;
  Function refresh;

  TextEditingController nameController =  TextEditingController();
  TextEditingController descriptionController =  TextEditingController();
  CategoriesProvider _categoriesProvider = new CategoriesProvider();
  User user;
  SharedPref sharedPref = new SharedPref();

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    user = User.fromJson(await sharedPref.read('user'));
    _categoriesProvider.init(context, user);
  }

  void createCategory() async {
    String name = nameController.text;
    String description = descriptionController.text;

    if (name.isEmpty || description.isEmpty) {
      GeneralSnackbar.show(context, 'Debe ingresar todos los campos');
      return;
    }

    Category category = Category(name: name, description: description);

    ResponseApi responseApi = await _categoriesProvider.create(category);
    
    try{
    GeneralSnackbar.show(context, responseApi.message);
    }catch(e){
    }

    if (responseApi.success) {
      nameController.text = '';
      descriptionController.text = '';
    }
  }
}

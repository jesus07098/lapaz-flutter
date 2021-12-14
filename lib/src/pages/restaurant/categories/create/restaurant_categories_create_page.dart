import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lapaz_app/src/pages/restaurant/categories/create/restaurant_categories_create_controller.dart';
import 'package:lapaz_app/src/utils/theme_colors.dart';
import 'package:lapaz_app/src/widgets/widgets.dart';

class RestaurantCategoriesCreatePage extends StatefulWidget {
  RestaurantCategoriesCreatePage({Key key}) : super(key: key);

  @override
  _RestaurantCategoriesCreatePageState createState() =>
      _RestaurantCategoriesCreatePageState();
}

class _RestaurantCategoriesCreatePageState
    extends State<RestaurantCategoriesCreatePage> {
  RestaurantCategoriesCreateController _con =
      RestaurantCategoriesCreateController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColors.purple800,
          title: const Text('Nueva categoría'),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFieldIconPreffix(
                controller: _con.nameController,
                  hinttext: 'Nombre de la categoría',
                  icon: Icons.list_alt,
                  keyboardtype: TextInputType.name),
              Container(
                width:  350,
                child: TextFormField(
                    controller: _con.descriptionController,
                    maxLines: 3,
                    maxLength: 255,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.description_outlined,
                            color: ThemeColors.purple800),
                        contentPadding: const EdgeInsets.all(13),
                        hintStyle: const TextStyle(fontSize: 18),
                        hintText: 'Descripción de la categoría',
                        filled: true,
                        fillColor: ThemeColors.purple100,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            )))),
              ),
              const Spacer(),
              ElevatedButtonInfinite(action: _con.createCategory, label: 'Crear categoría'),
            ],
          ),
        ));
  }
    void refresh() {
    setState(() {});
  }
  
}



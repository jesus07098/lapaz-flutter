import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lapaz_app/src/pages/restaurant/orders/list/restaurant_orders_list_controller.dart';
import 'package:lapaz_app/src/utils/theme_colors.dart';

class RestaurantOrdersListPage extends StatefulWidget {
  const RestaurantOrdersListPage({Key key}) : super(key: key);

  @override
  _RestaurantOrdersListPageState createState() =>
      _RestaurantOrdersListPageState();
}

class _RestaurantOrdersListPageState extends State<RestaurantOrdersListPage> {
  final RestaurantProductsListController _con =
      RestaurantProductsListController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.key,
      appBar: AppBar(
        leading: _menuDrawer(),
      ),
      drawer: _drawer(),
      body: const Center(
        child: Text('Restaurant Order List'),
      ),
    );
  }

  Widget _menuDrawer() {
    return GestureDetector(
      onTap: _con.openDrawer,
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        alignment: Alignment.centerLeft,
        child: Image.asset('assets/img/menu.png', width: 20, height: 20),
      ),
    );
  }

  Widget _drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(color: ThemeColors.purple800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '',
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                  Text(
                    '',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[200],
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                    maxLines: 1,
                  ),
                  Text(
                    '',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[200],
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                    maxLines: 1,
                  ),
                  Container(
                    height: 60,
                    margin: EdgeInsets.only(top: 10),
                    child: Text('Foto'),
                    //  FadeInImage(
                    //   image: _con.user?.image != null
                    //       ? NetworkImage(_con.user?.image)
                    //       : AssetImage('assets/img/no-image.png'),
                    //   fit: BoxFit.contain,
                    //   fadeInDuration: Duration(milliseconds: 50),
                    //   placeholder: AssetImage('assets/img/no-image.png'),
                    // ),
                  )
                ],
              )),
          const ListTile(
            title: Text('Seleccionar rol'),
            trailing: Icon(Icons.person_outline),
          ),
          ListTile(
            onTap: _con.logout,
            title: Text('Cerrar sesion'),
            trailing: Icon(Icons.power_settings_new),
          ),
        ],
      ),
    );
  }
}

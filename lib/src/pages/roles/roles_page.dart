import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:lapaz_app/src/models/rol.dart';
import 'package:lapaz_app/src/pages/roles/roles_controller.dart';
import 'package:lapaz_app/src/utils/theme_colors.dart';

class RolesPage extends StatefulWidget {
  const RolesPage({Key key}) : super(key: key);

  @override
  State<RolesPage> createState() => _RolesPageState();
}

class _RolesPageState extends State<RolesPage> {
  final RolesController _con = RolesController();

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
        title: const Text('Selección de rol'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
        child: ListView(
          children: _con.user != null
              ? _con.user.roles.map((Rol rol) {
                  return _cardRol(rol);
                }).toList()
              : [],
        ),
      ),
    );
  }

  Widget _cardRol(Rol rol) {
    return GestureDetector(
      onTap: () => _con.goToPage(rol.route),
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: FadeInImage(
              placeholder: const NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/2048px-No_image_available.svg.png'),
              fadeInDuration: const Duration(milliseconds: 30),
              fit: BoxFit.contain,
              image: rol.image != null
                  ? NetworkImage(rol.image)
                  : const NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/2048px-No_image_available.svg.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 25),
            child: Text(rol.name ?? '',
                style: const TextStyle(
                  fontSize: 16,
                )),
          )
        ],
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}

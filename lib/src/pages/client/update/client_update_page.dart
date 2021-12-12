import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lapaz_app/src/pages/client/update/client_update_controller.dart';
import 'package:lapaz_app/src/utils/theme_colors.dart';

class ClientUpdatePage extends StatefulWidget {
  const ClientUpdatePage({Key key}) : super(key: key);

  @override
  _ClientUpdatePageState createState() => _ClientUpdatePageState();
}

class _ClientUpdatePageState extends State<ClientUpdatePage> {

  ClientUpdateController _con = new ClientUpdateController();

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
        title: const Text('Editar perfil'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              _imageUser(),
              const SizedBox(height: 30),
              _textFieldName(),
              _textFieldLastName(),
              _textFieldPhone(),
            ],
          ),
        )
      ),
      bottomNavigationBar: _buttonLogin(),
    );
  }

  Widget _imageUser() {
    return GestureDetector(
      onTap: _con.showAlertDialog,
      child: CircleAvatar(
        backgroundImage: _con.imageFile != null
            ? FileImage(_con.imageFile)
            : _con.user?.image != null
              ? NetworkImage(_con.user?.image)
              : const AssetImage('assets/img/user_profile_2.png'),
        radius: 60,
        backgroundColor: Colors.grey[200],
      ),
    );
  }

  Widget _textFieldName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: ThemeColors.purple100,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.nameController,
        decoration: const InputDecoration(
            hintText: 'Nombre',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: ThemeColors.purple800,
            ),
            prefixIcon: Icon(
              Icons.person,
              color: ThemeColors.purple800,
            )
        ),
      ),
    );
  }

  Widget _textFieldLastName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: ThemeColors.purple100,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.lastnameController,
        decoration: const InputDecoration(
            hintText: 'Apellido',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: ThemeColors.purple800,
            ),
            prefixIcon: Icon(
              Icons.person_outline,
              color: ThemeColors.purple800,
            )
        ),
      ),
    );
  }

  Widget _textFieldPhone() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: ThemeColors.purple100,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.phoneController,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
            hintText: 'Telefono',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: ThemeColors.purple800,
            ),
            prefixIcon: Icon(
              Icons.phone,
              color: ThemeColors.purple800,
            )
        ),
      ),
    );
  }


  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: ElevatedButton(
        onPressed: _con.isEnable ? _con.update : null,
        child: const Text('ACTUALIZAR PERFIL'),
        style: ElevatedButton.styleFrom(
            primary: ThemeColors.purple800,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            padding: const EdgeInsets.symmetric(vertical: 15)
        ),
      ),
    );
  }


  void refresh() {
    setState(() {

    });
  }
}

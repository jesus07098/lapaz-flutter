import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lapaz_app/src/models/address.dart';
import 'package:lapaz_app/src/models/response_api.dart';
import 'package:lapaz_app/src/models/users.dart';
import 'package:lapaz_app/src/pages/client/address/map/client_address_map_page.dart';
import 'package:lapaz_app/src/provider/address_provider.dart';
import 'package:lapaz_app/src/utils/general_snackbar.dart';
import 'package:lapaz_app/src/utils/shared_pref.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ClientAddressCreateController {

  BuildContext context;
  Function refresh;

  TextEditingController refPointController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController neighborhoodController = TextEditingController();

  Map<String, dynamic> refPoint;

  AddressProvider _addressProvider =  AddressProvider();
  User user;
  SharedPref _sharedPref =  SharedPref();

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    user = User.fromJson(await _sharedPref.read('user'));
    _addressProvider.init(context, user);
  }

  void createAddress() async {
    String addressName = addressController.text;
    String neighborhood = neighborhoodController.text;
    double lat = refPoint['lat'] ?? 0;
    double lng = refPoint['lng'] ?? 0;

    if (addressName.isEmpty || neighborhood.isEmpty || lat == 0 || lng == 0) {
      GeneralSnackbar.show(context, 'Completa todos los campos');
      return;
    }

    Address address =  Address(
      address: addressName,
      neighborhood: neighborhood,
      lat: lat,
      lng: lng,
      idUser: user.id
    );

    ResponseApi responseApi = await _addressProvider.create(address);

    if (responseApi.success) {

      address.id = responseApi.data;
      _sharedPref.save('address', address);

      Fluttertoast.showToast(msg: responseApi.message);
      Navigator.pop(context, true);
    }
  }

  void openMap() async {
    refPoint = await showMaterialModalBottomSheet(
        context: context,
        isDismissible: false,
        enableDrag: false,
        builder: (context)=> ClientAddressMapPage()
    );

    if (refPoint != null) {
      refPointController.text = refPoint['address'];
      refresh();
    }
  }

}
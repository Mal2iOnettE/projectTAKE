import 'package:flutter/material.dart';
import 'package:markets/src/elements/DeliveryAddressBottomSheetWidget.dart';

import '../repository/settings_repository.dart' as settingRepo;
import '../../generated/l10n.dart';
import '../helpers/checkbox_form_field.dart';
import '../models/address.dart';

class DeliveryAddressChange {
  BuildContext context;
  Address address;
  ValueChanged<Address> onChanged;
  GlobalKey<FormState> _deliveryAddressFormKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey;

  DeliveryAddressChange({this.context, this.address, this.onChanged, this.scaffoldKey}) {
    DeliveryAddressBottomSheetWidget(scaffoldKey: scaffoldKey);
  }
}

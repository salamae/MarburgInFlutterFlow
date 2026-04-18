import '/entdecken/entdecken/entdecken_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/fuer_dich/fuer_dich/fuer_dich_widget.dart';
import '/veranstaltungen/veranstaltungen/veranstaltungen_widget.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for fuerDich component.
  late FuerDichModel fuerDichModel;
  // Model for veranstaltungen component.
  late VeranstaltungenModel veranstaltungenModel;
  // Model for entdecken component.
  late EntdeckenModel entdeckenModel;

  @override
  void initState(BuildContext context) {
    fuerDichModel = createModel(context, () => FuerDichModel());
    veranstaltungenModel = createModel(context, () => VeranstaltungenModel());
    entdeckenModel = createModel(context, () => EntdeckenModel());
  }

  @override
  void dispose() {
    fuerDichModel.dispose();
    veranstaltungenModel.dispose();
    entdeckenModel.dispose();
  }
}

import '/compenents/apple_switch/apple_switch_widget.dart';
import '/compenents/einstellungen/einstellungen_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'proflile_component_widget.dart' show ProflileComponentWidget;
import 'package:flutter/material.dart';

class ProflileComponentModel extends FlutterFlowModel<ProflileComponentWidget> {
  ///  Local state fields for this page.

  int? occupation;

  int? appUsage;

  bool saved = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for street widget.
  FocusNode? streetFocusNode;
  TextEditingController? streetTextController;
  String? Function(BuildContext, String?)? streetTextControllerValidator;
  // State field(s) for zip widget.
  FocusNode? zipFocusNode;
  TextEditingController? zipTextController;
  String? Function(BuildContext, String?)? zipTextControllerValidator;
  // Model for Sport.
  late AppleSwitchModel sportModel;
  // Model for Geschaefte.
  late AppleSwitchModel geschaefteModel;
  // Model for Ausfluege.
  late AppleSwitchModel ausfluegeModel;
  // Model for TheaterKultur.
  late AppleSwitchModel theaterKulturModel;
  // Model for Gastronomie.
  late AppleSwitchModel gastronomieModel;
  // Model for Pizzeria.
  late AppleSwitchModel pizzeriaModel;
  // Model for VeganeKost.
  late AppleSwitchModel veganeKostModel;
  // Model for Hochzeitslocation.
  late AppleSwitchModel hochzeitslocationModel;
  // Model for Buchhandlung.
  late AppleSwitchModel buchhandlungModel;
  // Model for Spielzeug.
  late AppleSwitchModel spielzeugModel;
  // Model for Regional.
  late AppleSwitchModel regionalModel;
  // Model for FamilieundKinder.
  late AppleSwitchModel familieundKinderModel;
  // Model for Picknickplatz.
  late AppleSwitchModel picknickplatzModel;
  // Model for TeichWaldsee.
  late AppleSwitchModel teichWaldseeModel;
  // Model for Flomarkt.
  late AppleSwitchModel flomarktModel;
  // Model for Einstellungen component.
  late EinstellungenModel einstellungenModel;

  @override
  void initState(BuildContext context) {
    sportModel = createModel(context, () => AppleSwitchModel());
    geschaefteModel = createModel(context, () => AppleSwitchModel());
    ausfluegeModel = createModel(context, () => AppleSwitchModel());
    theaterKulturModel = createModel(context, () => AppleSwitchModel());
    gastronomieModel = createModel(context, () => AppleSwitchModel());
    pizzeriaModel = createModel(context, () => AppleSwitchModel());
    veganeKostModel = createModel(context, () => AppleSwitchModel());
    hochzeitslocationModel = createModel(context, () => AppleSwitchModel());
    buchhandlungModel = createModel(context, () => AppleSwitchModel());
    spielzeugModel = createModel(context, () => AppleSwitchModel());
    regionalModel = createModel(context, () => AppleSwitchModel());
    familieundKinderModel = createModel(context, () => AppleSwitchModel());
    picknickplatzModel = createModel(context, () => AppleSwitchModel());
    teichWaldseeModel = createModel(context, () => AppleSwitchModel());
    flomarktModel = createModel(context, () => AppleSwitchModel());
    einstellungenModel = createModel(context, () => EinstellungenModel());
  }

  @override
  void dispose() {
    streetFocusNode?.dispose();
    streetTextController?.dispose();

    zipFocusNode?.dispose();
    zipTextController?.dispose();

    sportModel.dispose();
    geschaefteModel.dispose();
    ausfluegeModel.dispose();
    theaterKulturModel.dispose();
    gastronomieModel.dispose();
    pizzeriaModel.dispose();
    veganeKostModel.dispose();
    hochzeitslocationModel.dispose();
    buchhandlungModel.dispose();
    spielzeugModel.dispose();
    regionalModel.dispose();
    familieundKinderModel.dispose();
    picknickplatzModel.dispose();
    teichWaldseeModel.dispose();
    flomarktModel.dispose();
    einstellungenModel.dispose();
  }
}

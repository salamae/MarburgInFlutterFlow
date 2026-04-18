import '/favoriten/favoriten/favoriten_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/home/home_widget.dart';
import '/profile/profil/profil_widget.dart';
import '/stoebern/stoebern/stoebern_widget.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for home component.
  late HomeModel homeModel;
  // Model for favoriten component.
  late FavoritenModel favoritenModel;
  // Model for stoebern component.
  late StoebernModel stoebernModel;
  // Model for profil component.
  late ProfilModel profilModel;

  @override
  void initState(BuildContext context) {
    homeModel = createModel(context, () => HomeModel());
    favoritenModel = createModel(context, () => FavoritenModel());
    stoebernModel = createModel(context, () => StoebernModel());
    profilModel = createModel(context, () => ProfilModel());
  }

  @override
  void dispose() {
    homeModel.dispose();
    favoritenModel.dispose();
    stoebernModel.dispose();
    profilModel.dispose();
  }
}

import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'on_board_widget.dart' show OnBoardWidget;
import 'package:flutter/material.dart';

class OnBoardModel extends FlutterFlowModel<OnBoardWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for checkbox1 widget.
  bool? checkbox1Value1;
  // State field(s) for checkbox2 widget.
  bool? checkbox2Value1;
  // State field(s) for checkbox3 widget.
  bool? checkbox3Value1;
  // State field(s) for checkbox4 widget.
  bool? checkbox4Value1;
  // State field(s) for checkbox1 widget.
  bool? checkbox1Value2;
  // State field(s) for checkbox2 widget.
  bool? checkbox2Value2;
  // State field(s) for checkbox3 widget.
  bool? checkbox3Value2;
  // State field(s) for checkbox4 widget.
  bool? checkbox4Value2;
  // State field(s) for checkbox5 widget.
  bool? checkbox5Value;
  // State field(s) for checkbox6 widget.
  bool? checkbox6Value;
  // State field(s) for checkbox7 widget.
  bool? checkbox7Value;
  // State field(s) for checkbox8 widget.
  bool? checkbox8Value;
  // State field(s) for checkbox9 widget.
  bool? checkbox9Value;
  // State field(s) for checkbox10 widget.
  bool? checkbox10Value;
  // State field(s) for checkbox11 widget.
  bool? checkbox11Value;
  // State field(s) for checkbox12 widget.
  bool? checkbox12Value;
  // State field(s) for checkbox13 widget.
  bool? checkbox13Value;
  // State field(s) for checkbox14 widget.
  bool? checkbox14Value;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}

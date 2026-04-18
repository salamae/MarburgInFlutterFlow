import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  Local state fields for this component.

  bool reg = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? emailTextController1;
  String? Function(BuildContext, String?)? emailTextController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? passwordTextController1;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextController1Validator;
  // State field(s) for regEmail widget.
  FocusNode? regEmailFocusNode;
  TextEditingController? regEmailTextController;
  String? Function(BuildContext, String?)? regEmailTextControllerValidator;
  // State field(s) for regPassword1 widget.
  FocusNode? regPassword1FocusNode;
  TextEditingController? regPassword1TextController;
  late bool regPassword1Visibility;
  String? Function(BuildContext, String?)? regPassword1TextControllerValidator;
  // State field(s) for regPassword2 widget.
  FocusNode? regPassword2FocusNode;
  TextEditingController? regPassword2TextController;
  late bool regPassword2Visibility;
  String? Function(BuildContext, String?)? regPassword2TextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    regPassword1Visibility = false;
    regPassword2Visibility = false;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    emailTextController1?.dispose();

    textFieldFocusNode2?.dispose();
    passwordTextController1?.dispose();

    regEmailFocusNode?.dispose();
    regEmailTextController?.dispose();

    regPassword1FocusNode?.dispose();
    regPassword1TextController?.dispose();

    regPassword2FocusNode?.dispose();
    regPassword2TextController?.dispose();
  }
}

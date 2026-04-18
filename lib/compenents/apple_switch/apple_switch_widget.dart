import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'apple_switch_model.dart';
export 'apple_switch_model.dart';

class AppleSwitchWidget extends StatefulWidget {
  const AppleSwitchWidget({
    super.key,
    required this.title,
  });

  final String? title;

  @override
  State<AppleSwitchWidget> createState() => _AppleSwitchWidgetState();
}

class _AppleSwitchWidgetState extends State<AppleSwitchWidget> {
  late AppleSwitchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppleSwitchModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isOn = () {
        if ((widget.title == 'Sport') &&
            (currentUserDocument?.interests.toList() ?? [])
                .contains(widget.title)) {
          return true;
        } else if ((widget.title == 'Geschäfte') &&
            (currentUserDocument?.interests.toList() ?? [])
                .contains(widget.title)) {
          return true;
        } else if ((widget.title == 'Ausflüge') &&
            (currentUserDocument?.interests.toList() ?? [])
                .contains(widget.title)) {
          return true;
        } else if ((widget.title == 'Theater & Kultur') &&
            (currentUserDocument?.interests.toList() ?? [])
                .contains(widget.title)) {
          return true;
        } else if ((widget.title == 'Gastronomie') &&
            (currentUserDocument?.interests.toList() ?? [])
                .contains(widget.title)) {
          return true;
        } else if ((widget.title == 'Pizzeria') &&
            (currentUserDocument?.interests.toList() ?? [])
                .contains(widget.title)) {
          return true;
        } else if ((widget.title == 'Vegane Kost') &&
            (currentUserDocument?.interests.toList() ?? [])
                .contains(widget.title)) {
          return true;
        } else if ((widget.title == 'Hochzeitslocation') &&
            (currentUserDocument?.interests.toList() ?? [])
                .contains(widget.title)) {
          return true;
        } else if ((widget.title == 'Buchhandlung') &&
            (currentUserDocument?.interests.toList() ?? [])
                .contains(widget.title)) {
          return true;
        } else if ((widget.title == 'Spielzeug') &&
            (currentUserDocument?.interests.toList() ?? [])
                .contains(widget.title)) {
          return true;
        } else if ((widget.title == 'Regional') &&
            (currentUserDocument?.interests.toList() ?? [])
                .contains(widget.title)) {
          return true;
        } else if ((widget.title == 'Familie und Kinder') &&
            (currentUserDocument?.interests.toList() ?? [])
                .contains(widget.title)) {
          return true;
        } else if ((widget.title == 'Picknickplatz') &&
            (currentUserDocument?.interests.toList() ?? [])
                .contains(widget.title)) {
          return true;
        } else if ((widget.title == 'Teich/Waldsee') &&
            (currentUserDocument?.interests.toList() ?? [])
                .contains(widget.title)) {
          return true;
        } else if ((widget.title == 'Flomarkt') &&
            (currentUserDocument?.interests.toList() ?? [])
                .contains(widget.title)) {
          return true;
        } else {
          return false;
        }
      }();
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.4),
      child: Container(
        height: 28.0,
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title!,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.interTight(
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: Color(0xDF14181B),
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  _model.isOn = !_model.isOn;
                  safeSetState(() {});
                  if (_model.isOn) {
                    FFAppState().addToUserIntersse(widget.title!);
                    FFAppState().update(() {});
                  } else {
                    FFAppState().removeFromUserIntersse(widget.title!);
                    FFAppState().update(() {});
                  }
                },
                child: Container(
                  width: 68.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: _model.isOn ? Color(0xFF34C759) : Color(0xFFC5C5C7),
                    borderRadius: BorderRadius.circular(999.0),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              2.0, 2.0, 0.0, 2.0),
                          child: Container(
                            width: 40.0,
                            height: 90.0,
                            decoration: BoxDecoration(
                              color: !_model.isOn
                                  ? Colors.white
                                  : Color(0x00000000),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(999.0),
                                topRight: Radius.circular(999.0),
                                bottomLeft: Radius.circular(999.0),
                                bottomRight: Radius.circular(999.0),
                              ),
                              shape: BoxShape.rectangle,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 2.0, 2.0),
                          child: Container(
                            width: 40.0,
                            height: 90.0,
                            decoration: BoxDecoration(
                              color: _model.isOn
                                  ? Colors.white
                                  : Color(0x00000000),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(999.0),
                                topRight: Radius.circular(999.0),
                                bottomLeft: Radius.circular(999.0),
                                bottomRight: Radius.circular(999.0),
                              ),
                              shape: BoxShape.rectangle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

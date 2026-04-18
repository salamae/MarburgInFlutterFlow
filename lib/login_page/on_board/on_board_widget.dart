import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'on_board_model.dart';
export 'on_board_model.dart';

class OnBoardWidget extends StatefulWidget {
  const OnBoardWidget({super.key});

  static String routeName = 'onBoard';
  static String routePath = '/onBoard';

  @override
  State<OnBoardWidget> createState() => _OnBoardWidgetState();
}

class _OnBoardWidgetState extends State<OnBoardWidget>
    with TickerProviderStateMixin {
  late OnBoardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnBoardModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {
        _model.checkbox1Value1 = true;
      });
      safeSetState(() {
        _model.checkbox2Value1 = false;
      });
      safeSetState(() {
        _model.checkbox3Value1 = false;
      });
      safeSetState(() {
        _model.checkbox4Value1 = false;
      });
      safeSetState(() {
        _model.checkbox1Value2 = false;
      });
      safeSetState(() {
        _model.checkbox2Value2 = false;
      });
      safeSetState(() {
        _model.checkbox3Value2 = false;
      });
      safeSetState(() {
        _model.checkbox4Value2 = false;
      });
      safeSetState(() {
        _model.checkbox5Value = false;
      });
      safeSetState(() {
        _model.checkbox6Value = false;
      });
      safeSetState(() {
        _model.checkbox7Value = false;
      });
      safeSetState(() {
        _model.checkbox8Value = false;
      });
      safeSetState(() {
        _model.checkbox9Value = false;
      });
      safeSetState(() {
        _model.checkbox10Value = false;
      });
      safeSetState(() {
        _model.checkbox11Value = false;
      });
      safeSetState(() {
        _model.checkbox12Value = false;
      });
      safeSetState(() {
        _model.checkbox13Value = false;
      });
      safeSetState(() {
        _model.checkbox14Value = false;
      });
      FFAppState().userIntersse = [];
      safeSetState(() {});
      FFAppState().userOccupation = '';
      safeSetState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFFAFAFA),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 82.0, 16.0, 0.0),
              child: Stack(
                children: [
                  if (_model.tabBarCurrentIndex == 0)
                    Container(
                      width: double.infinity,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFDFDFE1),
                      ),
                    ),
                  if (_model.tabBarCurrentIndex == 1)
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 4.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFDFDFE1),
                          ),
                        ),
                        Container(
                          width: 120.0,
                          height: 4.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFE9453A),
                          ),
                        ),
                      ],
                    ),
                  if (_model.tabBarCurrentIndex == 2)
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 4.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFDFDFE1),
                          ),
                        ),
                        Container(
                          width: 250.0,
                          height: 4.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFE9453A),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment(-1.0, 0),
                    child: TabBar(
                      labelColor: FlutterFlowTheme.of(context).primaryText,
                      unselectedLabelColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      labelStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                                fontSize: 0.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontStyle,
                              ),
                      unselectedLabelStyle: TextStyle(),
                      indicatorColor: Colors.transparent,
                      tabs: [
                        Opacity(
                          opacity: 0.0,
                          child: Tab(
                            text: ' ',
                          ),
                        ),
                        Opacity(
                          opacity: 0.0,
                          child: Tab(
                            text: ' ',
                          ),
                        ),
                        Opacity(
                          opacity: 0.0,
                          child: Tab(
                            text: ' ',
                          ),
                        ),
                      ],
                      controller: _model.tabBarController,
                      onTap: (i) async {
                        [() async {}, () async {}, () async {}][i]();
                      },
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _model.tabBarController,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 160.0, 0.0, 34.0),
                                  child: Icon(
                                    FFIcons.khandwavefill,
                                    color: Color(0xFFE9453A),
                                    size: 72.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 13.0),
                                child: Text(
                                  'Willkommen bei der Marburg App!',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF000407),
                                        fontSize: 32.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                        lineHeight: 1.3,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Text(
                                  'Lassen Sie uns Ihr Profil personalisieren, damit wir Ihnen die besten Inhalte für Marburg zeigen können.',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF88888C),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                        lineHeight: 1.35,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: Icon(
                                    FFIcons.kbriefcasefill,
                                    color: Color(0xFFE9453A),
                                    size: 60.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: Text(
                                  'Ihre Tätigkeit',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.black,
                                        fontSize: 26.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Text(
                                  'Wählen Sie Ihre aktuelle Tätigkeit aus',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF88888C),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ),
                              Container(
                                width: 100.0,
                                height: 355.0,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 30.0, 0.0, 15.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            safeSetState(() {
                                              _model.checkbox1Value1 = true;
                                            });
                                            safeSetState(() {
                                              _model.checkbox2Value1 = false;
                                            });
                                            safeSetState(() {
                                              _model.checkbox3Value1 = false;
                                            });
                                            safeSetState(() {
                                              _model.checkbox4Value1 = false;
                                            });
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 55.0,
                                            decoration: BoxDecoration(
                                              color: _model.checkbox1Value1!
                                                  ? Color(0xFFF8E8E7)
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color: _model.checkbox1Value1!
                                                    ? Color(0xFFE9453A)
                                                    : Color(0xFFD1D1D6),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Berufstätig',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .interTight(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 17.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
                                                  child: Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          Color(0xB99B9595),
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .checkbox1Value1 ??=
                                                          false,
                                                      onChanged:
                                                          (newValue) async {
                                                        safeSetState(() => _model
                                                                .checkbox1Value1 =
                                                            newValue!);
                                                        if (newValue!) {
                                                          safeSetState(() {
                                                            _model.checkbox1Value1 =
                                                                true;
                                                          });
                                                          safeSetState(() {
                                                            _model.checkbox2Value1 =
                                                                false;
                                                          });
                                                          safeSetState(() {
                                                            _model.checkbox3Value1 =
                                                                false;
                                                          });
                                                          safeSetState(() {
                                                            _model.checkbox4Value1 =
                                                                false;
                                                          });
                                                        } else {
                                                          safeSetState(() {
                                                            _model.checkbox1Value1 =
                                                                false;
                                                          });
                                                        }
                                                      },
                                                      side:
                                                          (Color(0xB99B9595) !=
                                                                  null)
                                                              ? BorderSide(
                                                                  width: 2,
                                                                  color: Color(
                                                                      0xB99B9595),
                                                                )
                                                              : null,
                                                      activeColor:
                                                          Color(0xFFE9453A),
                                                      checkColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 15.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            safeSetState(() {
                                              _model.checkbox2Value1 = true;
                                            });
                                            safeSetState(() {
                                              _model.checkbox1Value1 = false;
                                            });
                                            safeSetState(() {
                                              _model.checkbox3Value1 = false;
                                            });
                                            safeSetState(() {
                                              _model.checkbox4Value1 = false;
                                            });
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 55.0,
                                            decoration: BoxDecoration(
                                              color: _model.checkbox2Value1!
                                                  ? Color(0xFFF8E8E7)
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color: _model.checkbox2Value1!
                                                    ? Color(0xFFE9453A)
                                                    : Color(0xFFD1D1D6),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Schüler',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .interTight(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 17.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
                                                  child: Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          Color(0xB99B9595),
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .checkbox2Value1 ??=
                                                          false,
                                                      onChanged:
                                                          (newValue) async {
                                                        safeSetState(() => _model
                                                                .checkbox2Value1 =
                                                            newValue!);
                                                        if (newValue!) {
                                                          safeSetState(() {
                                                            _model.checkbox2Value1 =
                                                                true;
                                                          });
                                                          safeSetState(() {
                                                            _model.checkbox1Value1 =
                                                                false;
                                                          });
                                                          safeSetState(() {
                                                            _model.checkbox3Value1 =
                                                                false;
                                                          });
                                                          safeSetState(() {
                                                            _model.checkbox4Value1 =
                                                                false;
                                                          });
                                                        } else {
                                                          safeSetState(() {
                                                            _model.checkbox2Value1 =
                                                                false;
                                                          });
                                                        }
                                                      },
                                                      side:
                                                          (Color(0xB99B9595) !=
                                                                  null)
                                                              ? BorderSide(
                                                                  width: 2,
                                                                  color: Color(
                                                                      0xB99B9595),
                                                                )
                                                              : null,
                                                      activeColor:
                                                          Color(0xFFE9453A),
                                                      checkColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 15.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            safeSetState(() {
                                              _model.checkbox3Value1 = true;
                                            });
                                            safeSetState(() {
                                              _model.checkbox1Value1 = false;
                                            });
                                            safeSetState(() {
                                              _model.checkbox2Value1 = false;
                                            });
                                            safeSetState(() {
                                              _model.checkbox4Value1 = false;
                                            });
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 55.0,
                                            decoration: BoxDecoration(
                                              color: _model.checkbox3Value1!
                                                  ? Color(0xFFF8E8E7)
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color: _model.checkbox3Value1!
                                                    ? Color(0xFFE9453A)
                                                    : Color(0xFFD1D1D6),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Student',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .interTight(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 17.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
                                                  child: Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          Color(0xB99B9595),
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .checkbox3Value1 ??=
                                                          false,
                                                      onChanged:
                                                          (newValue) async {
                                                        safeSetState(() => _model
                                                                .checkbox3Value1 =
                                                            newValue!);
                                                        if (newValue!) {
                                                          safeSetState(() {
                                                            _model.checkbox3Value1 =
                                                                true;
                                                          });
                                                          safeSetState(() {
                                                            _model.checkbox1Value1 =
                                                                false;
                                                          });
                                                          safeSetState(() {
                                                            _model.checkbox2Value1 =
                                                                false;
                                                          });
                                                          safeSetState(() {
                                                            _model.checkbox4Value1 =
                                                                false;
                                                          });
                                                        } else {
                                                          safeSetState(() {
                                                            _model.checkbox3Value1 =
                                                                false;
                                                          });
                                                        }
                                                      },
                                                      side:
                                                          (Color(0xB99B9595) !=
                                                                  null)
                                                              ? BorderSide(
                                                                  width: 2,
                                                                  color: Color(
                                                                      0xB99B9595),
                                                                )
                                                              : null,
                                                      activeColor:
                                                          Color(0xFFE9453A),
                                                      checkColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          safeSetState(() {
                                            _model.checkbox4Value1 = true;
                                          });
                                          safeSetState(() {
                                            _model.checkbox1Value1 = false;
                                          });
                                          safeSetState(() {
                                            _model.checkbox2Value1 = false;
                                          });
                                          safeSetState(() {
                                            _model.checkbox3Value1 = false;
                                          });
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 55.0,
                                          decoration: BoxDecoration(
                                            color: _model.checkbox4Value1!
                                                ? Color(0xFFF8E8E7)
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: _model.checkbox4Value1!
                                                  ? Color(0xFFE9453A)
                                                  : Color(0xFFD1D1D6),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Rentner',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .interTight(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 5.0, 0.0),
                                                child: Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    ),
                                                    unselectedWidgetColor:
                                                        Color(0xB99B9595),
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .checkbox4Value1 ??=
                                                        false,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() => _model
                                                              .checkbox4Value1 =
                                                          newValue!);
                                                      if (newValue!) {
                                                        safeSetState(() {
                                                          _model.checkbox4Value1 =
                                                              true;
                                                        });
                                                        safeSetState(() {
                                                          _model.checkbox1Value1 =
                                                              false;
                                                        });
                                                        safeSetState(() {
                                                          _model.checkbox2Value1 =
                                                              false;
                                                        });
                                                        safeSetState(() {
                                                          _model.checkbox3Value1 =
                                                              false;
                                                        });
                                                      } else {
                                                        safeSetState(() {
                                                          _model.checkbox4Value1 =
                                                              false;
                                                        });
                                                      }
                                                    },
                                                    side: (Color(0xB99B9595) !=
                                                            null)
                                                        ? BorderSide(
                                                            width: 2,
                                                            color: Color(
                                                                0xB99B9595),
                                                          )
                                                        : null,
                                                    activeColor:
                                                        Color(0xFFE9453A),
                                                    checkColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
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
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 30.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: Icon(
                                    FFIcons.kheartfill,
                                    color: Color(0xFFE9453A),
                                    size: 55.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 18.0),
                                child: Text(
                                  'Ihre Interessen',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.black,
                                        fontSize: 26.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Text(
                                  'Wahlen Sie alle Bereiche aus, die Sie interessieren',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF88888C),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 30.0, 0.0, 0.0),
                                child: Container(
                                  width: 100.0,
                                  height: 389.82,
                                  decoration: BoxDecoration(),
                                  child: GridView(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10.0,
                                      mainAxisSpacing: 12.0,
                                      childAspectRatio: 2.0,
                                    ),
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.checkbox1Value2!) {
                                            safeSetState(() {
                                              _model.checkbox1Value2 = false;
                                            });
                                            FFAppState().removeFromUserIntersse(
                                                'Sport');
                                            FFAppState().update(() {});
                                          } else {
                                            safeSetState(() {
                                              _model.checkbox1Value2 = true;
                                            });
                                            if (FFAppState()
                                                .userIntersse
                                                .contains('Sport')) {
                                              FFAppState()
                                                  .removeFromUserIntersse(
                                                      'Sport');
                                              FFAppState().update(() {});
                                            } else {
                                              FFAppState()
                                                  .addToUserIntersse('Sport');
                                              FFAppState().update(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: _model.checkbox1Value2!
                                                ? Color(0xFFE9453A)
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: _model.checkbox1Value2!
                                                  ? Color(0xFFE9453A)
                                                  : Color(0xFFDADADE),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0.0,
                                                                valueOrDefault<
                                                                    double>(
                                                                  _model.checkbox1Value2!
                                                                      ? 16.0
                                                                      : 0.0,
                                                                  0.0,
                                                                ),
                                                                0.0,
                                                                0.0),
                                                    child: Text(
                                                      'Sport',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .interTight(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: _model
                                                                    .checkbox1Value2!
                                                                ? Colors.white
                                                                : Colors.black,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (_model.checkbox1Value2 ??
                                                  true)
                                                Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    ),
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .checkbox1Value2 ??=
                                                        true,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() => _model
                                                              .checkbox1Value2 =
                                                          newValue!);
                                                      if (newValue!) {
                                                        safeSetState(() {
                                                          _model.checkbox1Value2 =
                                                              true;
                                                        });
                                                        FFAppState()
                                                            .removeFromUserIntersse(
                                                                'Sport');
                                                        FFAppState()
                                                            .update(() {});
                                                      } else {
                                                        safeSetState(() {
                                                          _model.checkbox1Value2 =
                                                              false;
                                                        });
                                                        if (FFAppState()
                                                            .userIntersse
                                                            .contains(
                                                                'Sport')) {
                                                          FFAppState()
                                                              .removeFromUserIntersse(
                                                                  'Sport');
                                                          FFAppState()
                                                              .update(() {});
                                                        } else {
                                                          FFAppState()
                                                              .addToUserIntersse(
                                                                  'Sport');
                                                          FFAppState()
                                                              .update(() {});
                                                        }
                                                      }
                                                    },
                                                    activeColor: Colors.white,
                                                    checkColor:
                                                        Color(0xFFE9453A),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.checkbox2Value2!) {
                                            safeSetState(() {
                                              _model.checkbox2Value2 = false;
                                            });
                                            FFAppState().removeFromUserIntersse(
                                                'Geschäfte');
                                            FFAppState().update(() {});
                                          } else {
                                            safeSetState(() {
                                              _model.checkbox2Value2 = true;
                                            });
                                            if (FFAppState()
                                                .userIntersse
                                                .contains('Geschäfte')) {
                                              FFAppState()
                                                  .removeFromUserIntersse(
                                                      'Geschäfte');
                                              FFAppState().update(() {});
                                            } else {
                                              FFAppState().addToUserIntersse(
                                                  'Geschäfte');
                                              FFAppState().update(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: _model.checkbox2Value2!
                                                ? Color(0xFFE9453A)
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: _model.checkbox2Value2!
                                                  ? Color(0xFFE9453A)
                                                  : Color(0xFFDADADE),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0.0,
                                                                valueOrDefault<
                                                                    double>(
                                                                  _model.checkbox2Value2!
                                                                      ? 16.0
                                                                      : 0.0,
                                                                  0.0,
                                                                ),
                                                                0.0,
                                                                0.0),
                                                    child: Text(
                                                      'Geschäfte',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .interTight(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: _model
                                                                    .checkbox2Value2!
                                                                ? Colors.white
                                                                : Colors.black,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (_model.checkbox2Value2 ??
                                                  true)
                                                Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    ),
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .checkbox2Value2 ??=
                                                        true,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() => _model
                                                              .checkbox2Value2 =
                                                          newValue!);
                                                      if (newValue!) {
                                                        safeSetState(() {
                                                          _model.checkbox2Value2 =
                                                              true;
                                                        });
                                                        FFAppState()
                                                            .removeFromUserIntersse(
                                                                'Geschäfte');
                                                        FFAppState()
                                                            .update(() {});
                                                      } else {
                                                        safeSetState(() {
                                                          _model.checkbox2Value2 =
                                                              false;
                                                        });
                                                        if (FFAppState()
                                                            .userIntersse
                                                            .contains(
                                                                'Geschäfte')) {
                                                          FFAppState()
                                                              .removeFromUserIntersse(
                                                                  'Geschäfte');
                                                          FFAppState()
                                                              .update(() {});
                                                        } else {
                                                          FFAppState()
                                                              .addToUserIntersse(
                                                                  'Geschäfte');
                                                          FFAppState()
                                                              .update(() {});
                                                        }
                                                      }
                                                    },
                                                    activeColor: Colors.white,
                                                    checkColor:
                                                        Color(0xFFE9453A),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.checkbox3Value2!) {
                                            safeSetState(() {
                                              _model.checkbox3Value2 = false;
                                            });
                                            FFAppState().removeFromUserIntersse(
                                                'Ausflüge');
                                            FFAppState().update(() {});
                                          } else {
                                            safeSetState(() {
                                              _model.checkbox3Value2 = true;
                                            });
                                            if (FFAppState()
                                                .userIntersse
                                                .contains('Ausflüge')) {
                                              FFAppState()
                                                  .removeFromUserIntersse(
                                                      'Ausflüge');
                                              FFAppState().update(() {});
                                            } else {
                                              FFAppState().addToUserIntersse(
                                                  'Ausflüge');
                                              FFAppState().update(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: _model.checkbox3Value2!
                                                ? Color(0xFFE9453A)
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: _model.checkbox3Value2!
                                                  ? Color(0xFFE9453A)
                                                  : Color(0xFFDADADE),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0.0,
                                                                valueOrDefault<
                                                                    double>(
                                                                  _model.checkbox3Value2!
                                                                      ? 16.0
                                                                      : 0.0,
                                                                  0.0,
                                                                ),
                                                                0.0,
                                                                0.0),
                                                    child: Text(
                                                      'Ausflüge',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .interTight(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: _model
                                                                    .checkbox3Value2!
                                                                ? Colors.white
                                                                : Colors.black,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (_model.checkbox3Value2 ??
                                                  true)
                                                Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    ),
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .checkbox3Value2 ??=
                                                        true,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() => _model
                                                              .checkbox3Value2 =
                                                          newValue!);
                                                      if (newValue!) {
                                                        safeSetState(() {
                                                          _model.checkbox3Value2 =
                                                              true;
                                                        });
                                                        FFAppState()
                                                            .removeFromUserIntersse(
                                                                'Ausflüge');
                                                        FFAppState()
                                                            .update(() {});
                                                      } else {
                                                        safeSetState(() {
                                                          _model.checkbox3Value2 =
                                                              false;
                                                        });
                                                        if (FFAppState()
                                                            .userIntersse
                                                            .contains(
                                                                'Ausflüge')) {
                                                          FFAppState()
                                                              .removeFromUserIntersse(
                                                                  'Ausflüge');
                                                          FFAppState()
                                                              .update(() {});
                                                        } else {
                                                          FFAppState()
                                                              .addToUserIntersse(
                                                                  'Ausflüge');
                                                          FFAppState()
                                                              .update(() {});
                                                        }
                                                      }
                                                    },
                                                    activeColor: Colors.white,
                                                    checkColor:
                                                        Color(0xFFE9453A),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.checkbox4Value2!) {
                                            safeSetState(() {
                                              _model.checkbox4Value2 = false;
                                            });
                                            FFAppState().removeFromUserIntersse(
                                                'Theater & Kultur');
                                            FFAppState().update(() {});
                                          } else {
                                            safeSetState(() {
                                              _model.checkbox4Value2 = true;
                                            });
                                            if (FFAppState()
                                                .userIntersse
                                                .contains('Theater & Kultur')) {
                                              FFAppState()
                                                  .removeFromUserIntersse(
                                                      'Theater & Kultur');
                                              FFAppState().update(() {});
                                            } else {
                                              FFAppState().addToUserIntersse(
                                                  'Theater & Kultur');
                                              FFAppState().update(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: _model.checkbox4Value2!
                                                ? Color(0xFFE9453A)
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: _model.checkbox4Value2!
                                                  ? Color(0xFFE9453A)
                                                  : Color(0xFFDADADE),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0.0,
                                                                valueOrDefault<
                                                                    double>(
                                                                  _model.checkbox4Value2!
                                                                      ? 16.0
                                                                      : 0.0,
                                                                  0.0,
                                                                ),
                                                                0.0,
                                                                0.0),
                                                    child: Text(
                                                      'Theater & Kultur',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .interTight(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: _model
                                                                    .checkbox4Value2!
                                                                ? Colors.white
                                                                : Colors.black,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (_model.checkbox4Value2 ??
                                                  true)
                                                Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    ),
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .checkbox4Value2 ??=
                                                        true,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() => _model
                                                              .checkbox4Value2 =
                                                          newValue!);
                                                      if (newValue!) {
                                                        safeSetState(() {
                                                          _model.checkbox4Value2 =
                                                              true;
                                                        });
                                                        FFAppState()
                                                            .removeFromUserIntersse(
                                                                'Theater & Kultur');
                                                        FFAppState()
                                                            .update(() {});
                                                      } else {
                                                        safeSetState(() {
                                                          _model.checkbox4Value2 =
                                                              false;
                                                        });
                                                        if (FFAppState()
                                                            .userIntersse
                                                            .contains(
                                                                'Theater & Kultur')) {
                                                          FFAppState()
                                                              .removeFromUserIntersse(
                                                                  'Theater & Kultur');
                                                          FFAppState()
                                                              .update(() {});
                                                        } else {
                                                          FFAppState()
                                                              .addToUserIntersse(
                                                                  'Theater & Kultur');
                                                          FFAppState()
                                                              .update(() {});
                                                        }
                                                      }
                                                    },
                                                    activeColor: Colors.white,
                                                    checkColor:
                                                        Color(0xFFE9453A),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.checkbox5Value!) {
                                            safeSetState(() {
                                              _model.checkbox5Value = false;
                                            });
                                            FFAppState().removeFromUserIntersse(
                                                'Gastronomie');
                                            FFAppState().update(() {});
                                          } else {
                                            safeSetState(() {
                                              _model.checkbox5Value = true;
                                            });
                                            if (FFAppState()
                                                .userIntersse
                                                .contains('Gastronomie')) {
                                              FFAppState()
                                                  .removeFromUserIntersse(
                                                      'Gastronomie');
                                              FFAppState().update(() {});
                                            } else {
                                              FFAppState().addToUserIntersse(
                                                  'Gastronomie');
                                              FFAppState().update(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: _model.checkbox5Value!
                                                ? Color(0xFFE9453A)
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: _model.checkbox5Value!
                                                  ? Color(0xFFE9453A)
                                                  : Color(0xFFDADADE),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0.0,
                                                                valueOrDefault<
                                                                    double>(
                                                                  _model.checkbox5Value!
                                                                      ? 16.0
                                                                      : 0.0,
                                                                  0.0,
                                                                ),
                                                                0.0,
                                                                0.0),
                                                    child: Text(
                                                      'Gastronomie',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .interTight(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: _model
                                                                    .checkbox5Value!
                                                                ? Colors.white
                                                                : Colors.black,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (_model.checkbox5Value ?? true)
                                                Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    ),
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .checkbox5Value ??=
                                                        true,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() => _model
                                                              .checkbox5Value =
                                                          newValue!);
                                                      if (newValue!) {
                                                        safeSetState(() {
                                                          _model.checkbox5Value =
                                                              true;
                                                        });
                                                        FFAppState()
                                                            .removeFromUserIntersse(
                                                                'Gastronomie');
                                                        FFAppState()
                                                            .update(() {});
                                                      } else {
                                                        safeSetState(() {
                                                          _model.checkbox5Value =
                                                              false;
                                                        });
                                                        if (FFAppState()
                                                            .userIntersse
                                                            .contains(
                                                                'Gastronomie')) {
                                                          FFAppState()
                                                              .removeFromUserIntersse(
                                                                  'Gastronomie');
                                                          FFAppState()
                                                              .update(() {});
                                                        } else {
                                                          FFAppState()
                                                              .addToUserIntersse(
                                                                  'Gastronomie');
                                                          FFAppState()
                                                              .update(() {});
                                                        }
                                                      }
                                                    },
                                                    activeColor: Colors.white,
                                                    checkColor:
                                                        Color(0xFFE9453A),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.checkbox6Value!) {
                                            safeSetState(() {
                                              _model.checkbox6Value = false;
                                            });
                                            FFAppState().removeFromUserIntersse(
                                                'Pizzeria');
                                            FFAppState().update(() {});
                                          } else {
                                            safeSetState(() {
                                              _model.checkbox6Value = true;
                                            });
                                            if (FFAppState()
                                                .userIntersse
                                                .contains('Pizzeria')) {
                                              FFAppState()
                                                  .removeFromUserIntersse(
                                                      'Pizzeria');
                                              FFAppState().update(() {});
                                            } else {
                                              FFAppState().addToUserIntersse(
                                                  'Pizzeria');
                                              FFAppState().update(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: _model.checkbox6Value!
                                                ? Color(0xFFE9453A)
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: _model.checkbox6Value!
                                                  ? Color(0xFFE9453A)
                                                  : Color(0xFFDADADE),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0.0,
                                                                valueOrDefault<
                                                                    double>(
                                                                  _model.checkbox6Value!
                                                                      ? 16.0
                                                                      : 0.0,
                                                                  0.0,
                                                                ),
                                                                0.0,
                                                                0.0),
                                                    child: Text(
                                                      'Pizzeria',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .interTight(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: _model
                                                                    .checkbox6Value!
                                                                ? Colors.white
                                                                : Colors.black,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (_model.checkbox6Value ?? true)
                                                Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    ),
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .checkbox6Value ??=
                                                        true,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() => _model
                                                              .checkbox6Value =
                                                          newValue!);
                                                      if (newValue!) {
                                                        safeSetState(() {
                                                          _model.checkbox6Value =
                                                              true;
                                                        });
                                                        FFAppState()
                                                            .removeFromUserIntersse(
                                                                'Pizzeria');
                                                        FFAppState()
                                                            .update(() {});
                                                      } else {
                                                        safeSetState(() {
                                                          _model.checkbox6Value =
                                                              false;
                                                        });
                                                        if (FFAppState()
                                                            .userIntersse
                                                            .contains(
                                                                'Pizzeria')) {
                                                          FFAppState()
                                                              .removeFromUserIntersse(
                                                                  'Pizzeria');
                                                          FFAppState()
                                                              .update(() {});
                                                        } else {
                                                          FFAppState()
                                                              .addToUserIntersse(
                                                                  'Pizzeria');
                                                          FFAppState()
                                                              .update(() {});
                                                        }
                                                      }
                                                    },
                                                    activeColor: Colors.white,
                                                    checkColor:
                                                        Color(0xFFE9453A),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.checkbox7Value!) {
                                            safeSetState(() {
                                              _model.checkbox7Value = false;
                                            });
                                            FFAppState().removeFromUserIntersse(
                                                'Vegane Kost');
                                            FFAppState().update(() {});
                                          } else {
                                            safeSetState(() {
                                              _model.checkbox7Value = true;
                                            });
                                            if (FFAppState()
                                                .userIntersse
                                                .contains('Vegane Kost')) {
                                              FFAppState()
                                                  .removeFromUserIntersse(
                                                      'Vegane Kost');
                                              FFAppState().update(() {});
                                            } else {
                                              FFAppState().addToUserIntersse(
                                                  'Vegane Kost');
                                              FFAppState().update(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: _model.checkbox7Value!
                                                ? Color(0xFFE9453A)
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: _model.checkbox7Value!
                                                  ? Color(0xFFE9453A)
                                                  : Color(0xFFDADADE),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0.0,
                                                                valueOrDefault<
                                                                    double>(
                                                                  _model.checkbox7Value!
                                                                      ? 16.0
                                                                      : 0.0,
                                                                  0.0,
                                                                ),
                                                                0.0,
                                                                0.0),
                                                    child: Text(
                                                      'Vegane Kost',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .interTight(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: _model
                                                                    .checkbox7Value!
                                                                ? Colors.white
                                                                : Colors.black,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (_model.checkbox7Value ?? true)
                                                Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    ),
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .checkbox7Value ??=
                                                        true,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() => _model
                                                              .checkbox7Value =
                                                          newValue!);
                                                      if (newValue!) {
                                                        safeSetState(() {
                                                          _model.checkbox7Value =
                                                              true;
                                                        });
                                                        FFAppState()
                                                            .removeFromUserIntersse(
                                                                'Vegane Kost');
                                                        FFAppState()
                                                            .update(() {});
                                                      } else {
                                                        safeSetState(() {
                                                          _model.checkbox7Value =
                                                              false;
                                                        });
                                                        if (FFAppState()
                                                            .userIntersse
                                                            .contains(
                                                                'Vegane Kost')) {
                                                          FFAppState()
                                                              .removeFromUserIntersse(
                                                                  'Vegane Kost');
                                                          FFAppState()
                                                              .update(() {});
                                                        } else {
                                                          FFAppState()
                                                              .addToUserIntersse(
                                                                  'Vegane Kost');
                                                          FFAppState()
                                                              .update(() {});
                                                        }
                                                      }
                                                    },
                                                    activeColor: Colors.white,
                                                    checkColor:
                                                        Color(0xFFE9453A),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.checkbox8Value!) {
                                            safeSetState(() {
                                              _model.checkbox8Value = false;
                                            });
                                            FFAppState().removeFromUserIntersse(
                                                'Hochzeitslocation');
                                            FFAppState().update(() {});
                                          } else {
                                            safeSetState(() {
                                              _model.checkbox8Value = true;
                                            });
                                            if (FFAppState()
                                                .userIntersse
                                                .contains(
                                                    'Hochzeitslocation')) {
                                              FFAppState()
                                                  .removeFromUserIntersse(
                                                      'Hochzeitslocation');
                                              FFAppState().update(() {});
                                            } else {
                                              FFAppState().addToUserIntersse(
                                                  'Hochzeitslocation');
                                              FFAppState().update(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: _model.checkbox8Value!
                                                ? Color(0xFFE9453A)
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: _model.checkbox8Value!
                                                  ? Color(0xFFE9453A)
                                                  : Color(0xFFDADADE),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0.0,
                                                                valueOrDefault<
                                                                    double>(
                                                                  _model.checkbox8Value!
                                                                      ? 16.0
                                                                      : 0.0,
                                                                  0.0,
                                                                ),
                                                                0.0,
                                                                0.0),
                                                    child: Text(
                                                      'Hochzeitslocation',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .interTight(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: _model
                                                                    .checkbox8Value!
                                                                ? Colors.white
                                                                : Colors.black,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (_model.checkbox8Value ?? true)
                                                Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    ),
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .checkbox8Value ??=
                                                        true,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() => _model
                                                              .checkbox8Value =
                                                          newValue!);
                                                      if (newValue!) {
                                                        safeSetState(() {
                                                          _model.checkbox8Value =
                                                              true;
                                                        });
                                                        FFAppState()
                                                            .removeFromUserIntersse(
                                                                'Hochzeitslocation');
                                                        FFAppState()
                                                            .update(() {});
                                                      } else {
                                                        safeSetState(() {
                                                          _model.checkbox8Value =
                                                              false;
                                                        });
                                                        if (FFAppState()
                                                            .userIntersse
                                                            .contains(
                                                                'Hochzeitslocation')) {
                                                          FFAppState()
                                                              .removeFromUserIntersse(
                                                                  'Hochzeitslocation');
                                                          FFAppState()
                                                              .update(() {});
                                                        } else {
                                                          FFAppState()
                                                              .addToUserIntersse(
                                                                  'Hochzeitslocation');
                                                          FFAppState()
                                                              .update(() {});
                                                        }
                                                      }
                                                    },
                                                    activeColor: Colors.white,
                                                    checkColor:
                                                        Color(0xFFE9453A),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.checkbox9Value!) {
                                            safeSetState(() {
                                              _model.checkbox9Value = false;
                                            });
                                            FFAppState().removeFromUserIntersse(
                                                'Buchhandlung');
                                            FFAppState().update(() {});
                                          } else {
                                            safeSetState(() {
                                              _model.checkbox9Value = true;
                                            });
                                            if (FFAppState()
                                                .userIntersse
                                                .contains('Buchhandlung')) {
                                              FFAppState()
                                                  .removeFromUserIntersse(
                                                      'Buchhandlung');
                                              FFAppState().update(() {});
                                            } else {
                                              FFAppState().addToUserIntersse(
                                                  'Buchhandlung');
                                              FFAppState().update(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: _model.checkbox9Value!
                                                ? Color(0xFFE9453A)
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: _model.checkbox9Value!
                                                  ? Color(0xFFE9453A)
                                                  : Color(0xFFDADADE),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0.0,
                                                                valueOrDefault<
                                                                    double>(
                                                                  _model.checkbox9Value!
                                                                      ? 16.0
                                                                      : 0.0,
                                                                  0.0,
                                                                ),
                                                                0.0,
                                                                0.0),
                                                    child: Text(
                                                      'Buchhandlung',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .interTight(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: _model
                                                                    .checkbox9Value!
                                                                ? Colors.white
                                                                : Colors.black,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (_model.checkbox9Value ?? true)
                                                Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    ),
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .checkbox9Value ??=
                                                        true,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() => _model
                                                              .checkbox9Value =
                                                          newValue!);
                                                      if (newValue!) {
                                                        safeSetState(() {
                                                          _model.checkbox9Value =
                                                              true;
                                                        });
                                                        FFAppState()
                                                            .removeFromUserIntersse(
                                                                'Buchhandlung');
                                                        FFAppState()
                                                            .update(() {});
                                                      } else {
                                                        safeSetState(() {
                                                          _model.checkbox9Value =
                                                              false;
                                                        });
                                                        if (FFAppState()
                                                            .userIntersse
                                                            .contains(
                                                                'Buchhandlung')) {
                                                          FFAppState()
                                                              .removeFromUserIntersse(
                                                                  'Buchhandlung');
                                                          FFAppState()
                                                              .update(() {});
                                                        } else {
                                                          FFAppState()
                                                              .addToUserIntersse(
                                                                  'Buchhandlung');
                                                          FFAppState()
                                                              .update(() {});
                                                        }
                                                      }
                                                    },
                                                    activeColor: Colors.white,
                                                    checkColor:
                                                        Color(0xFFE9453A),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.checkbox10Value!) {
                                            safeSetState(() {
                                              _model.checkbox10Value = false;
                                            });
                                            FFAppState().removeFromUserIntersse(
                                                'Spielzeug');
                                            FFAppState().update(() {});
                                          } else {
                                            safeSetState(() {
                                              _model.checkbox10Value = true;
                                            });
                                            if (FFAppState()
                                                .userIntersse
                                                .contains('Spielzeug')) {
                                              FFAppState()
                                                  .removeFromUserIntersse(
                                                      'Spielzeug');
                                              FFAppState().update(() {});
                                            } else {
                                              FFAppState().addToUserIntersse(
                                                  'Spielzeug');
                                              FFAppState().update(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: _model.checkbox10Value!
                                                ? Color(0xFFE9453A)
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: _model.checkbox10Value!
                                                  ? Color(0xFFE9453A)
                                                  : Color(0xFFDADADE),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0.0,
                                                                valueOrDefault<
                                                                    double>(
                                                                  _model.checkbox10Value!
                                                                      ? 16.0
                                                                      : 0.0,
                                                                  0.0,
                                                                ),
                                                                0.0,
                                                                0.0),
                                                    child: Text(
                                                      'Spielzeug',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .interTight(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: _model
                                                                    .checkbox10Value!
                                                                ? Colors.white
                                                                : Colors.black,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (_model.checkbox10Value ??
                                                  true)
                                                Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    ),
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .checkbox10Value ??=
                                                        true,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() => _model
                                                              .checkbox10Value =
                                                          newValue!);
                                                      if (newValue!) {
                                                        safeSetState(() {
                                                          _model.checkbox10Value =
                                                              true;
                                                        });
                                                        FFAppState()
                                                            .removeFromUserIntersse(
                                                                'Spielzeug');
                                                        FFAppState()
                                                            .update(() {});
                                                      } else {
                                                        safeSetState(() {
                                                          _model.checkbox10Value =
                                                              false;
                                                        });
                                                        if (FFAppState()
                                                            .userIntersse
                                                            .contains(
                                                                'Spielzeug')) {
                                                          FFAppState()
                                                              .removeFromUserIntersse(
                                                                  'Spielzeug');
                                                          FFAppState()
                                                              .update(() {});
                                                        } else {
                                                          FFAppState()
                                                              .addToUserIntersse(
                                                                  'Spielzeug');
                                                          FFAppState()
                                                              .update(() {});
                                                        }
                                                      }
                                                    },
                                                    activeColor: Colors.white,
                                                    checkColor:
                                                        Color(0xFFE9453A),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.checkbox11Value!) {
                                            safeSetState(() {
                                              _model.checkbox11Value = false;
                                            });
                                            FFAppState().removeFromUserIntersse(
                                                'Regional');
                                            FFAppState().update(() {});
                                          } else {
                                            safeSetState(() {
                                              _model.checkbox11Value = true;
                                            });
                                            if (FFAppState()
                                                .userIntersse
                                                .contains('Regional')) {
                                              FFAppState()
                                                  .removeFromUserIntersse(
                                                      'Regional');
                                              FFAppState().update(() {});
                                            } else {
                                              FFAppState().addToUserIntersse(
                                                  'Regional');
                                              FFAppState().update(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: _model.checkbox11Value!
                                                ? Color(0xFFE9453A)
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: _model.checkbox11Value!
                                                  ? Color(0xFFE9453A)
                                                  : Color(0xFFDADADE),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0.0,
                                                                valueOrDefault<
                                                                    double>(
                                                                  _model.checkbox11Value!
                                                                      ? 16.0
                                                                      : 0.0,
                                                                  0.0,
                                                                ),
                                                                0.0,
                                                                0.0),
                                                    child: Text(
                                                      'Regional',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .interTight(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: _model
                                                                    .checkbox11Value!
                                                                ? Colors.white
                                                                : Colors.black,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (_model.checkbox11Value ??
                                                  true)
                                                Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    ),
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .checkbox11Value ??=
                                                        true,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() => _model
                                                              .checkbox11Value =
                                                          newValue!);
                                                      if (newValue!) {
                                                        safeSetState(() {
                                                          _model.checkbox11Value =
                                                              true;
                                                        });
                                                        FFAppState()
                                                            .removeFromUserIntersse(
                                                                'Regional');
                                                        FFAppState()
                                                            .update(() {});
                                                      } else {
                                                        safeSetState(() {
                                                          _model.checkbox11Value =
                                                              false;
                                                        });
                                                        if (FFAppState()
                                                            .userIntersse
                                                            .contains(
                                                                'Regional')) {
                                                          FFAppState()
                                                              .removeFromUserIntersse(
                                                                  'Regional');
                                                          FFAppState()
                                                              .update(() {});
                                                        } else {
                                                          FFAppState()
                                                              .addToUserIntersse(
                                                                  'Regional');
                                                          FFAppState()
                                                              .update(() {});
                                                        }
                                                      }
                                                    },
                                                    activeColor: Colors.white,
                                                    checkColor:
                                                        Color(0xFFE9453A),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.checkbox12Value!) {
                                            safeSetState(() {
                                              _model.checkbox12Value = false;
                                            });
                                            FFAppState().removeFromUserIntersse(
                                                'Familie und Kinder');
                                            FFAppState().update(() {});
                                          } else {
                                            safeSetState(() {
                                              _model.checkbox12Value = true;
                                            });
                                            if (FFAppState()
                                                .userIntersse
                                                .contains(
                                                    'Familie und Kinder')) {
                                              FFAppState()
                                                  .removeFromUserIntersse(
                                                      'Familie und Kinder');
                                              FFAppState().update(() {});
                                            } else {
                                              FFAppState().addToUserIntersse(
                                                  'Familie und Kinder');
                                              FFAppState().update(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: _model.checkbox12Value!
                                                ? Color(0xFFE9453A)
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: _model.checkbox12Value!
                                                  ? Color(0xFFE9453A)
                                                  : Color(0xFFDADADE),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0.0,
                                                                valueOrDefault<
                                                                    double>(
                                                                  _model.checkbox12Value!
                                                                      ? 16.0
                                                                      : 0.0,
                                                                  0.0,
                                                                ),
                                                                0.0,
                                                                0.0),
                                                    child: Text(
                                                      'Familie und Kinder',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .interTight(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: _model
                                                                    .checkbox12Value!
                                                                ? Colors.white
                                                                : Colors.black,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (_model.checkbox12Value ??
                                                  true)
                                                Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    ),
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .checkbox12Value ??=
                                                        true,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() => _model
                                                              .checkbox12Value =
                                                          newValue!);
                                                      if (newValue!) {
                                                        safeSetState(() {
                                                          _model.checkbox12Value =
                                                              true;
                                                        });
                                                        FFAppState()
                                                            .removeFromUserIntersse(
                                                                'Familie und Kinder');
                                                        FFAppState()
                                                            .update(() {});
                                                      } else {
                                                        safeSetState(() {
                                                          _model.checkbox12Value =
                                                              false;
                                                        });
                                                        if (FFAppState()
                                                            .userIntersse
                                                            .contains(
                                                                'Familie und Kinder')) {
                                                          FFAppState()
                                                              .removeFromUserIntersse(
                                                                  'Familie und Kinder');
                                                          FFAppState()
                                                              .update(() {});
                                                        } else {
                                                          FFAppState()
                                                              .addToUserIntersse(
                                                                  'Familie und Kinder');
                                                          FFAppState()
                                                              .update(() {});
                                                        }
                                                      }
                                                    },
                                                    activeColor: Colors.white,
                                                    checkColor:
                                                        Color(0xFFE9453A),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.checkbox13Value!) {
                                            safeSetState(() {
                                              _model.checkbox13Value = false;
                                            });
                                            FFAppState().removeFromUserIntersse(
                                                'Picknickplatz');
                                            FFAppState().update(() {});
                                          } else {
                                            safeSetState(() {
                                              _model.checkbox13Value = true;
                                            });
                                            if (FFAppState()
                                                .userIntersse
                                                .contains('Picknickplatz')) {
                                              FFAppState()
                                                  .removeFromUserIntersse(
                                                      'Picknickplatz');
                                              FFAppState().update(() {});
                                            } else {
                                              FFAppState().addToUserIntersse(
                                                  'Picknickplatz');
                                              FFAppState().update(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: _model.checkbox13Value!
                                                ? Color(0xFFE9453A)
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: _model.checkbox13Value!
                                                  ? Color(0xFFE9453A)
                                                  : Color(0xFFDADADE),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0.0,
                                                                valueOrDefault<
                                                                    double>(
                                                                  _model.checkbox13Value!
                                                                      ? 16.0
                                                                      : 0.0,
                                                                  0.0,
                                                                ),
                                                                0.0,
                                                                0.0),
                                                    child: Text(
                                                      'Picknickplatz',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .interTight(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: _model
                                                                    .checkbox13Value!
                                                                ? Colors.white
                                                                : Colors.black,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (_model.checkbox13Value ??
                                                  true)
                                                Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    ),
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .checkbox13Value ??=
                                                        true,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() => _model
                                                              .checkbox13Value =
                                                          newValue!);
                                                      if (newValue!) {
                                                        safeSetState(() {
                                                          _model.checkbox13Value =
                                                              true;
                                                        });
                                                        FFAppState()
                                                            .removeFromUserIntersse(
                                                                'Picknickplatz');
                                                        FFAppState()
                                                            .update(() {});
                                                      } else {
                                                        safeSetState(() {
                                                          _model.checkbox13Value =
                                                              false;
                                                        });
                                                        if (FFAppState()
                                                            .userIntersse
                                                            .contains(
                                                                'Picknickplatz')) {
                                                          FFAppState()
                                                              .removeFromUserIntersse(
                                                                  'Picknickplatz');
                                                          FFAppState()
                                                              .update(() {});
                                                        } else {
                                                          FFAppState()
                                                              .addToUserIntersse(
                                                                  'Picknickplatz');
                                                          FFAppState()
                                                              .update(() {});
                                                        }
                                                      }
                                                    },
                                                    activeColor: Colors.white,
                                                    checkColor:
                                                        Color(0xFFE9453A),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.checkbox14Value!) {
                                            safeSetState(() {
                                              _model.checkbox14Value = false;
                                            });
                                            FFAppState().removeFromUserIntersse(
                                                'Teich/Waldsee');
                                            FFAppState().update(() {});
                                          } else {
                                            safeSetState(() {
                                              _model.checkbox14Value = true;
                                            });
                                            if (FFAppState()
                                                .userIntersse
                                                .contains('Teich/Waldsee')) {
                                              FFAppState()
                                                  .removeFromUserIntersse(
                                                      'Teich/Waldsee');
                                              FFAppState().update(() {});
                                            } else {
                                              FFAppState().addToUserIntersse(
                                                  'Teich/Waldsee');
                                              FFAppState().update(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: _model.checkbox14Value!
                                                ? Color(0xFFE9453A)
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: _model.checkbox14Value!
                                                  ? Color(0xFFE9453A)
                                                  : Color(0xFFDADADE),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0.0,
                                                                valueOrDefault<
                                                                    double>(
                                                                  _model.checkbox14Value!
                                                                      ? 16.0
                                                                      : 0.0,
                                                                  0.0,
                                                                ),
                                                                0.0,
                                                                0.0),
                                                    child: Text(
                                                      'Teich/Waldsee',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .interTight(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: _model
                                                                    .checkbox14Value!
                                                                ? Colors.white
                                                                : Colors.black,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (_model.checkbox14Value ??
                                                  true)
                                                Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    ),
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .checkbox14Value ??=
                                                        true,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() => _model
                                                              .checkbox14Value =
                                                          newValue!);
                                                      if (newValue!) {
                                                        safeSetState(() {
                                                          _model.checkbox14Value =
                                                              true;
                                                        });
                                                        FFAppState()
                                                            .removeFromUserIntersse(
                                                                'Teich/Waldsee');
                                                        FFAppState()
                                                            .update(() {});
                                                      } else {
                                                        safeSetState(() {
                                                          _model.checkbox14Value =
                                                              false;
                                                        });
                                                        if (FFAppState()
                                                            .userIntersse
                                                            .contains(
                                                                'Teich/Waldsee')) {
                                                          FFAppState()
                                                              .removeFromUserIntersse(
                                                                  'Teich/Waldsee');
                                                          FFAppState()
                                                              .update(() {});
                                                        } else {
                                                          FFAppState()
                                                              .addToUserIntersse(
                                                                  'Teich/Waldsee');
                                                          FFAppState()
                                                              .update(() {});
                                                        }
                                                      }
                                                    },
                                                    activeColor: Colors.white,
                                                    checkColor:
                                                        Color(0xFFE9453A),
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 48.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (() {
                    if (_model.tabBarCurrentIndex == 1) {
                      return true;
                    } else if (_model.tabBarCurrentIndex == 2) {
                      return true;
                    } else {
                      return false;
                    }
                  }())
                    Flexible(
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 4.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              safeSetState(() {
                                _model.tabBarController!.animateTo(
                                  max(0, _model.tabBarController!.index - 1),
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              });
                            },
                            child: Text(
                              'Zurück',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFFE9453A),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (() {
                    if (_model.tabBarCurrentIndex == 0) {
                      return true;
                    } else if (_model.tabBarCurrentIndex == 1) {
                      return true;
                    } else {
                      return false;
                    }
                  }())
                    Align(
                      alignment: AlignmentDirectional(1.0, 1.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          safeSetState(() {
                            _model.tabBarController!.animateTo(
                              min(_model.tabBarController!.length - 1,
                                  _model.tabBarController!.index + 1),
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          });

                          if (() {
                                if (_model.checkbox1Value1!) {
                                  return true;
                                } else if (_model.checkbox2Value1!) {
                                  return true;
                                } else if (_model.checkbox3Value1!) {
                                  return true;
                                } else if (_model.checkbox4Value1!) {
                                  return true;
                                } else {
                                  return false;
                                }
                              }() &&
                              ((_model.tabBarCurrentIndex == 1) ||
                                  (_model.tabBarCurrentIndex == 2))) {
                            FFAppState().userOccupation = () {
                              if (_model.checkbox1Value1!) {
                                return 'Berufstätig';
                              } else if (_model.checkbox2Value1!) {
                                return 'Schüler';
                              } else if (_model.checkbox3Value1!) {
                                return 'Student';
                              } else if (_model.checkbox4Value1!) {
                                return 'Rentner';
                              } else {
                                return '';
                              }
                            }();
                            safeSetState(() {});
                          } else {
                            FFAppState().userOccupation = '';
                            safeSetState(() {});
                          }
                        },
                        text: 'Weiter',
                        options: FFButtonOptions(
                          width: 100.0,
                          height: 45.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFFE9453A),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  if (_model.tabBarCurrentIndex == 2 ? true : false)
                    Align(
                      alignment: AlignmentDirectional(1.0, 1.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await currentUserReference!.update({
                            ...createUsersRecordData(
                              email: currentUserEmail,
                              onboardingCompleted: true,
                              isGuest: false,
                              createdTime: getCurrentTimestamp,
                              occupation: FFAppState().userOccupation,
                            ),
                            ...mapToFirestore(
                              {
                                'interests': FFAppState().userIntersse,
                              },
                            ),
                          });

                          context.goNamed(HomePageWidget.routeName);
                        },
                        text: 'Fertigstellen',
                        options: FFButtonOptions(
                          width: 140.0,
                          height: 45.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFFE9453A),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

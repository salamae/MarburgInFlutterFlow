import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/compenents/apple_switch/apple_switch_widget.dart';
import '/compenents/delete_account_anfrage/delete_account_anfrage_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/login_page/login_for_guest/login_for_guest_widget.dart';
import '/profile/einstellungen/einstellungen_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'proflile_component_model.dart';
export 'proflile_component_model.dart';

class ProflileComponentWidget extends StatefulWidget {
  const ProflileComponentWidget({
    super.key,
    required this.pageTitle,
  });

  final String? pageTitle;

  static String routeName = 'proflileComponent';
  static String routePath = '/proflileComponent';

  @override
  State<ProflileComponentWidget> createState() =>
      _ProflileComponentWidgetState();
}

class _ProflileComponentWidgetState extends State<ProflileComponentWidget> {
  late ProflileComponentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProflileComponentModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.occupation = () {
        if (valueOrDefault(currentUserDocument?.occupation, '') ==
            'Berufstätig') {
          return 0;
        } else if (valueOrDefault(currentUserDocument?.occupation, '') ==
            'Schüler') {
          return 1;
        } else if (valueOrDefault(currentUserDocument?.occupation, '') ==
            'Student') {
          return 2;
        } else if (valueOrDefault(currentUserDocument?.occupation, '') ==
            'Rentner') {
          return 3;
        } else {
          return 0;
        }
      }();
      _model.appUsage = () {
        if (valueOrDefault(currentUserDocument?.appUsage, '') == 'Turistisch') {
          return 0;
        } else if (valueOrDefault(currentUserDocument?.appUsage, '') ==
            'Organisatorisch') {
          return 1;
        } else if (valueOrDefault(currentUserDocument?.appUsage, '') ==
            'Beides') {
          return 2;
        } else {
          return 0;
        }
      }();
      safeSetState(() {});
    });

    _model.streetTextController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.street, ''));
    _model.streetFocusNode ??= FocusNode();

    _model.zipTextController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.zip, ''));
    _model.zipFocusNode ??= FocusNode();
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.0),
          child: AppBar(
            backgroundColor: Color(0xFFFAFAFA),
            iconTheme: IconThemeData(color: Colors.black),
            automaticallyImplyLeading: false,
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  0.0,
                  0.0,
                  0.0,
                  valueOrDefault<double>(
                    widget.pageTitle == 'Kontoeinstellungen' ? 10.0 : 0.0,
                    0.0,
                  )),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                          _model.saved = false;
                          safeSetState(() {});
                        },
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFFDFDFD),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x06000000),
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(24.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 2.0, 0.0),
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 25.0,
                            ),
                          ),
                        ),
                      ),
                      if (widget.pageTitle != 'Mitteilungen')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              valueOrDefault<double>(
                                () {
                                  if (widget.pageTitle == 'Behörden') {
                                    return 105.0;
                                  } else if (widget.pageTitle == 'Impressum') {
                                    return 100.0;
                                  } else if (widget.pageTitle ==
                                      'Datenschutz') {
                                    return 100.0;
                                  } else if (widget.pageTitle ==
                                      'Mitteilungen') {
                                    return 100.0;
                                  } else if (widget.pageTitle ==
                                      'Kontoeinstellungen') {
                                    return (loggedIn ? 15.0 : 80.0);
                                  } else if (widget.pageTitle ==
                                      'Parkplätze') {
                                    return 105.0;
                                  } else {
                                    return 0.0;
                                  }
                                }(),
                                0.0,
                              ),
                              0.0,
                              0.0,
                              0.0),
                          child: Text(
                            widget.pageTitle!,
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
                                  fontSize: 17.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      if (widget.pageTitle == 'Behörden')
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, -1.0),
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFFDFDFD),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x06000000),
                                    offset: Offset(
                                      0.0,
                                      2.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(24.0),
                                shape: BoxShape.rectangle,
                              ),
                              child: Icon(
                                Icons.add,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      if ((widget.pageTitle == 'Kontoeinstellungen') &&
                          loggedIn)
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, -1.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await currentUserReference!.update({
                                  ...createUsersRecordData(
                                    street: valueOrDefault(
                                        currentUserDocument?.street, ''),
                                    zip: valueOrDefault(
                                        currentUserDocument?.zip, ''),
                                    occupation: () {
                                      if (_model.occupation == 0) {
                                        return 'Berufstätig';
                                      } else if (_model.occupation == 1) {
                                        return 'Schüler';
                                      } else if (_model.occupation == 2) {
                                        return 'Student';
                                      } else if (_model.occupation == 3) {
                                        return 'Rentner';
                                      } else {
                                        return '';
                                      }
                                    }(),
                                    appUsage: () {
                                      if (_model.appUsage == 0) {
                                        return 'Turistisch';
                                      } else if (_model.appUsage == 1) {
                                        return 'Organisatorisch';
                                      } else if (_model.appUsage == 2) {
                                        return 'Beides';
                                      } else {
                                        return '';
                                      }
                                    }(),
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'interests': FFAppState().userIntersse,
                                    },
                                  ),
                                });
                                _model.saved = true;
                                safeSetState(() {});
                              },
                              child: Container(
                                width: 115.0,
                                height: 42.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFEFEFE),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      color: Color(0x09000000),
                                      offset: Offset(
                                        0.0,
                                        4.0,
                                      ),
                                      spreadRadius: 5.0,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Speichern',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontStyle,
                                          ),
                                          color: Colors.black,
                                          fontSize: 17.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 0.0,
          ),
        ),
        body: Stack(
          children: [
            if (widget.pageTitle == 'Behörden')
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(),
                child: StreamBuilder<List<AuthoritiesRecord>>(
                  stream: queryAuthoritiesRecord(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<AuthoritiesRecord> listViewAuthoritiesRecordList =
                        snapshot.data!;

                    return ListView.builder(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        0,
                        0,
                        20.0,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewAuthoritiesRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewAuthoritiesRecord =
                            listViewAuthoritiesRecordList[listViewIndex];
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 22.0, 0.0, 0.0),
                                  child: Text(
                                    listViewAuthoritiesRecord.name,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontStyle,
                                          ),
                                          fontSize: 17.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                Text(
                                  listViewAuthoritiesRecord.address,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: Text(
                                    listViewAuthoritiesRecord.phone !=
                                                ''
                                        ? 'Tel: ${listViewAuthoritiesRecord.phone}'
                                        : '',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                Divider(
                                  height: 0.0,
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            if (widget.pageTitle == 'Datenschutz')
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 25.0),
                          child: Text(
                            'Datenschutzerklärung',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 18.0),
                          child: Text(
                            '1. Verantwortlicher',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
                                  fontSize: 17.0,
                                  letterSpacing: 0.5,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 19.0),
                          child: Text(
                            'Verantwortlich für die Verarbeitung personenbe-zogener Daten im Rahmen dieser App ist:',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
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
                        Text(
                          'mellow GmbH\nInh. Lorenz Schaible\nBrunnenstraße 16\n35041 Marburg\nDeutschland',
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF88888C),
                                    fontSize: 15.0,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                    lineHeight: 1.35,
                                  ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 18.0),
                              child: Text(
                                'E-Mail: ',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF88888C),
                                      fontSize: 15.0,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                      lineHeight: 1.35,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 18.0),
                              child: Text(
                                'kontakt@mellow.studio',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Color(0xFFD64234),
                                      fontSize: 15.0,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 19.0),
                          child: Text(
                            'Ein Datenschutzbeauftragter ist nicht benannt, da dies gesetzlich nicht erforderlich ist.',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 18.0),
                          child: Text(
                            '2. Allgemeines zur Datenverarbeitung',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
                                  fontSize: 17.0,
                                  letterSpacing: 0.5,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 18.0),
                          child: Text(
                            'Wir nehmen den Schutz Ihrer personenbezo-genen Daten sehr ernst. Personenbezogene Daten sind alle Informationen, die sich auf eine identifizierte oder identifizierbare Person beziehen. Die Verarbeitung Ihrer Daten erfolgt ausschließlich im Rahmen der gesetzlichen Vorgaben der Datenschutz-Grundverordnung (DSGVO).',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 18.0),
                          child: Text(
                            '3. Erhobene Daten',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
                                  fontSize: 17.0,
                                  letterSpacing: 0.5,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 19.0),
                          child: Text(
                            'Im Rahmen der Nutzung der App \"Mein-Marburg\" können folgende personenbezogene Daten erhoben und verarbeitet werden:',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 18.0),
                          child: Text(
                            '• Name\n• E-Mail-Adresse\n• Optional: Adresse',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF88888C),
                                  fontSize: 14.0,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                  lineHeight: 1.35,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 19.0),
                          child: Text(
                            'Diese Daten werden im Rahmen des Benutzerkontos gespeichert und verarbeitet.',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 18.0),
                          child: Text(
                            '4. Zwecke der Verarbeitung',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
                                  fontSize: 17.0,
                                  letterSpacing: 0.5,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 19.0),
                          child: Text(
                            'Die Verarbeitung der personenbezogenen Daten erfolgt zu folgenden Zwecken:',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 18.0),
                          child: Text(
                            '• Zur Bereitstellung der App-Funktionalitäten\n• Zur Erstellung und Verwaltung eines Benutzerkontos\n• Zur Kommunikation mit Nutzerinnen und Nutzern\n• Zur Verbesserung und Weiterentwicklung der App',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF88888C),
                                  fontSize: 14.0,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                  lineHeight: 1.35,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 18.0),
                          child: Text(
                            '5. Rechtsgrundlage der Verarbeitung',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
                                  fontSize: 17.0,
                                  letterSpacing: 0.5,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 19.0),
                          child: Text(
                            'Die Verarbeitung Ihrer Daten erfolgt auf Grund-lage von Art. 6 Abs. 1 lit. b DSGVO (Vertrags-erfüllung) sowie Art. 6 Abs. 1 lit. f DSGVO (berechtigtes Interesse an der Verbesserung der App).',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 18.0),
                          child: Text(
                            '6. Drittanbieter & Dienste',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
                                  fontSize: 17.0,
                                  letterSpacing: 0.5,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 19.0),
                          child: Text(
                            'Wir verwenden folgende Dienste von Drittanbietern:',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
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
                        Text(
                          'Firebase (Google LLC)\nDie App nutzt Firebase für Hosting, Nutzerverwaltung sowie Analysezwecke (Google Analytics for Firebase). Anbieter ist:\n\nGoogle Ireland Limited\nGordon House, Barrow Street\nDublin 4, Irland\n\nDie Datenverarbeitung durch Firebase erfolgt auf Servern innerhalb der EU. Es kann nicht ausgeschlossen werden, dass in bestimmten Fällen Daten an Server in den USA übertragen werden. Google ist unter dem EU-U.S. Data Privacy Framework zertifiziert.\n\nWeitere Informationen:',
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF88888C),
                                    fontSize: 14.0,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                    lineHeight: 1.35,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 18.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await launchURL(
                                  'https://firebase.google.com/support/privacy');
                            },
                            child: Text(
                              'https://firebase.google.com/support/privacy',
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Color(0xFFD64234),
                                    fontSize: 15.0,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 18.0),
                          child: Text(
                            '7. Speicherung und Löschung',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
                                  fontSize: 17.0,
                                  letterSpacing: 0.5,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 19.0),
                          child: Text(
                            'hre personenbezogenen Daten werden nur so lange gespeichert, wie es für die oben genannten Zwecke erforderlich ist. Nutzerinnen und Nutzer können ihr Konto jederzeit in der App löschen; damit werden auch die gespeicherten Daten gelöscht, sofern keine gesetzlichen Aufbewahrungspflichten bestehen.',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 18.0),
                          child: Text(
                            '8. Ihre Rechte',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
                                  fontSize: 17.0,
                                  letterSpacing: 0.5,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 19.0),
                          child: Text(
                            'Sie haben das Recht:',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
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
                        Text(
                          '• auf Auskunft über Ihre gespeicherten Daten (Art. 15 DSGVO),\n• auf Berichtigung unrichtiger Daten (Art. 16 DSGVO),\n• auf Löschung Ihrer Daten (Art. 17 DSGVO),\n• auf Einschränkung der Verarbeitung (Art. 18 DSGVO),\n• auf Datenübertragbarkeit (Art. 20 DSGVO),\n• auf Widerspruch gegen die Verarbeitung (Art. 21 DSGVO).\n\nBitte richten Sie entsprechende Anfragen an: ',
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF88888C),
                                    fontSize: 15.0,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                    lineHeight: 1.35,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 18.0),
                          child: Text(
                            'kontakt@mellow.studio',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Color(0xFFD64234),
                                  fontSize: 15.0,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 18.0),
                          child: Text(
                            '9. Änderungen dieser Datenschutzerklärung',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
                                  fontSize: 17.0,
                                  letterSpacing: 0.5,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 30.0),
                          child: Text(
                            'Wir behalten uns vor, diese Datenschutz-erklärung bei Änderungen der App oder rechtlicher Vorgaben anzupassen. Die jeweils aktuelle Version ist jederzeit in der App abrufbar.',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
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
                      ].addToEnd(SizedBox(height: 20.0)),
                    ),
                  ),
                ),
              ),
            if (widget.pageTitle == 'Impressum')
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 25.0),
                          child: Text(
                            'Impressum',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Text(
                          'Angaben gemäß § 5 TMG',
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                                color: Colors.black,
                                fontSize: 17.0,
                                letterSpacing: 0.5,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .fontStyle,
                              ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 18.0),
                          child: Text(
                            'mellow GmbH\nInh. Lorenz Schaible\nBrunnenstraße 16\n35041 Marburg\nDeutschland',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF88888C),
                                  fontSize: 15.0,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                  lineHeight: 1.35,
                                ),
                          ),
                        ),
                        Text(
                          'Kontakt',
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                                color: Colors.black,
                                fontSize: 17.0,
                                letterSpacing: 0.5,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .fontStyle,
                              ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 18.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'E-Mail: ',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF88888C),
                                      fontSize: 15.0,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                'kontakt@mellow.studio',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Color(0xFFD64234),
                                      fontSize: 15.0,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Umsatzsteuer-ID',
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                                color: Colors.black,
                                fontSize: 17.0,
                                letterSpacing: 0.5,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .fontStyle,
                              ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 18.0),
                          child: Text(
                            'USt-IdNr.: DE123456789',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF88888C),
                                  fontSize: 15.0,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Text(
                          'Verantwortlich für den Inhalt nach § 55 Abs. 2 RStV:',
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                                color: Colors.black,
                                fontSize: 17.0,
                                letterSpacing: 0.5,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .fontStyle,
                              ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 18.0),
                          child: Text(
                            'Lorenz Schaible, Anschrift wie oben',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF88888C),
                                  fontSize: 15.0,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Text(
                          'Streitschlichtung',
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                                color: Colors.black,
                                fontSize: 17.0,
                                letterSpacing: 0.5,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .fontStyle,
                              ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 18.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Die Europäische Kommission stellt eine Plattform zur Online-Streitbeilegung (OS) bereit: ',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF88888C),
                                      fontSize: 15.0,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await launchURL(
                                        'https://ec.europa.eu/consumers/odr');
                                  },
                                  child: Text(
                                    'https://ec.europa.eu/consumers/odr',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.interTight(
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFFD64234),
                                          fontSize: 15.0,
                                          letterSpacing: 0.5,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                              Text(
                                'Unsere E-Mail-Adresse finden Sie oben im Impressum.',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF88888C),
                                      fontSize: 15.0,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Verbraucherstreitbeilegung/Universal-schlichtungsstelle',
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                                color: Colors.black,
                                fontSize: 17.0,
                                letterSpacing: 0.5,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .fontStyle,
                              ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 40.0),
                          child: Text(
                            'Wir sind nicht bereit oder verpflichtet, an Streitbeilegungsverfahren vor einer Verbrau-cherschlichtungsstelle teilzunehmen.',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF88888C),
                                  fontSize: 15.0,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ].addToEnd(SizedBox(height: 20.0)),
                    ),
                  ),
                ),
              ),
            if (widget.pageTitle == 'Parkplätze')
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 18.0, 16.0, 10.0),
                        child: Text(
                          'Parken in Marburg',
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                                color: Colors.black,
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .fontStyle,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 5.0),
                            child: StreamBuilder<List<ParkingRecord>>(
                              stream: queryParkingRecord(
                                queryBuilder: (parkingRecord) =>
                                    parkingRecord.orderBy('PARKHAUS'),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<ParkingRecord> listViewParkingRecordList =
                                    snapshot.data!;

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewParkingRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewParkingRecord =
                                        listViewParkingRecordList[
                                            listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 16.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 5.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        listViewParkingRecord
                                                            .parkhaus,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      17.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Text(
                                                          'Freie Plätze',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF8A8A8E),
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Text(
                                                      listViewParkingRecord
                                                                  .frei ==
                                                              '---'
                                                          ? '0'
                                                          : listViewParkingRecord
                                                              .frei,
                                                      textAlign: TextAlign.end,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFFD12717),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                if (() {
                                                  if (loggedIn &&
                                                      !(currentUserDocument
                                                                  ?.favoriteParkingLots
                                                                  .toList() ??
                                                              [])
                                                          .contains(
                                                              listViewParkingRecord
                                                                  .reference
                                                                  .id)) {
                                                    return true;
                                                  } else if (!loggedIn &&
                                                      !FFAppState()
                                                          .parkingLots
                                                          .contains(
                                                              listViewParkingRecord
                                                                  .reference
                                                                  .id)) {
                                                    return true;
                                                  } else {
                                                    return false;
                                                  }
                                                }())
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if (loggedIn) {
                                                              if ((currentUserDocument
                                                                          ?.favoriteParkingLots
                                                                          .toList() ??
                                                                      [])
                                                                  .contains(
                                                                      listViewParkingRecord
                                                                          .reference
                                                                          .id)) {
                                                                await currentUserReference!
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'favoriteParkingLots':
                                                                          FieldValue
                                                                              .arrayRemove([
                                                                        listViewParkingRecord
                                                                            .reference
                                                                            .id
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                                await actions
                                                                    .checkParkingNotification(
                                                                  listViewParkingRecord
                                                                      .reference
                                                                      .id,
                                                                  listViewParkingRecord
                                                                      .parkhaus,
                                                                  listViewParkingRecord
                                                                      .frei,
                                                                  FFAppState()
                                                                      .notificationSwitch4,
                                                                  FFAppState()
                                                                          .platz5
                                                                      ? 5
                                                                      : 10,
                                                                  false,
                                                                );
                                                              } else {
                                                                await currentUserReference!
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'favoriteParkingLots':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        listViewParkingRecord
                                                                            .reference
                                                                            .id
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                                await actions
                                                                    .checkParkingNotification(
                                                                  listViewParkingRecord
                                                                      .reference
                                                                      .id,
                                                                  listViewParkingRecord
                                                                      .parkhaus,
                                                                  listViewParkingRecord
                                                                      .frei,
                                                                  FFAppState()
                                                                      .notificationSwitch4,
                                                                  FFAppState()
                                                                          .platz5
                                                                      ? 5
                                                                      : 10,
                                                                  true,
                                                                );
                                                              }

                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              return;
                                                            } else {
                                                              if (FFAppState()
                                                                  .parkingLots
                                                                  .contains(
                                                                      listViewParkingRecord
                                                                          .reference
                                                                          .id)) {
                                                                FFAppState().removeFromParkingLots(
                                                                    listViewParkingRecord
                                                                        .reference
                                                                        .id);
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                              } else {
                                                                FFAppState().addToParkingLots(
                                                                    listViewParkingRecord
                                                                        .reference
                                                                        .id);
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                              }

                                                              return;
                                                            }
                                                          },
                                                          child: Icon(
                                                            FFIcons.kheart,
                                                            color: Color(
                                                                0xFF909095),
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (() {
                                                  if (loggedIn &&
                                                      (currentUserDocument
                                                                  ?.favoriteParkingLots
                                                                  .toList() ??
                                                              [])
                                                          .contains(
                                                              listViewParkingRecord
                                                                  .reference
                                                                  .id)) {
                                                    return true;
                                                  } else if (!loggedIn &&
                                                      FFAppState()
                                                          .parkingLots
                                                          .contains(
                                                              listViewParkingRecord
                                                                  .reference
                                                                  .id)) {
                                                    return true;
                                                  } else {
                                                    return false;
                                                  }
                                                }())
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if (loggedIn) {
                                                              if ((currentUserDocument
                                                                          ?.favoriteParkingLots
                                                                          .toList() ??
                                                                      [])
                                                                  .contains(
                                                                      listViewParkingRecord
                                                                          .reference
                                                                          .id)) {
                                                                await currentUserReference!
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'favoriteParkingLots':
                                                                          FieldValue
                                                                              .arrayRemove([
                                                                        listViewParkingRecord
                                                                            .reference
                                                                            .id
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                                await actions
                                                                    .checkParkingNotification(
                                                                  listViewParkingRecord
                                                                      .reference
                                                                      .id,
                                                                  listViewParkingRecord
                                                                      .parkhaus,
                                                                  listViewParkingRecord
                                                                      .frei,
                                                                  FFAppState()
                                                                      .notificationSwitch4,
                                                                  FFAppState()
                                                                          .platz5
                                                                      ? 5
                                                                      : 10,
                                                                  false,
                                                                );
                                                              } else {
                                                                await currentUserReference!
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'favoriteParkingLots':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        listViewParkingRecord
                                                                            .reference
                                                                            .id
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                                await actions
                                                                    .checkParkingNotification(
                                                                  listViewParkingRecord
                                                                      .reference
                                                                      .id,
                                                                  listViewParkingRecord
                                                                      .parkhaus,
                                                                  listViewParkingRecord
                                                                      .frei,
                                                                  FFAppState()
                                                                      .notificationSwitch4,
                                                                  FFAppState()
                                                                          .platz5
                                                                      ? 5
                                                                      : 10,
                                                                  true,
                                                                );
                                                              }

                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              return;
                                                            } else {
                                                              if (FFAppState()
                                                                  .parkingLots
                                                                  .contains(
                                                                      listViewParkingRecord
                                                                          .reference
                                                                          .id)) {
                                                                FFAppState().removeFromParkingLots(
                                                                    listViewParkingRecord
                                                                        .reference
                                                                        .id);
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                              } else {
                                                                FFAppState().addToParkingLots(
                                                                    listViewParkingRecord
                                                                        .reference
                                                                        .id);
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                              }

                                                              return;
                                                            }
                                                          },
                                                          child: Icon(
                                                            FFIcons.kheartfill,
                                                            color: Color(
                                                                0xFFFF383C),
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            height: 1.0,
                                            thickness: 0.5,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if ((widget.pageTitle == 'Kontoeinstellungen') && loggedIn)
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF2F2F7),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              33.0, 0.0, 16.0, 10.0),
                          child: Text(
                            'Adresse ',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  color: Color(0xDF6B7280),
                                  fontSize: 17.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 26.0),
                          child: Container(
                            height: 110.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 4.0, 0.0, 2.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => TextFormField(
                                      controller: _model.streetTextController,
                                      focusNode: _model.streetFocusNode,
                                      autofocus: false,
                                      enabled: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: 'Straße und Hausnummer',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0x9857636C),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      cursorColor: Color(0xFFC42516),
                                      enableInteractiveSelection: true,
                                      validator: _model
                                          .streetTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 340.0,
                                  child: Divider(
                                    height: 0.1,
                                    thickness: 0.5,
                                    color: Color(0x3B000000),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 1.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => TextFormField(
                                      controller: _model.zipTextController,
                                      focusNode: _model.zipFocusNode,
                                      autofocus: false,
                                      enabled: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                        hintText: 'PLZ',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0x9857636C),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      cursorColor: Color(0xFFC42516),
                                      enableInteractiveSelection: true,
                                      validator: _model
                                          .zipTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              33.0, 0.0, 16.0, 14.0),
                          child: Text(
                            'Tätigkeit',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  color: Color(0xDF6B7280),
                                  fontSize: 17.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 25.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 14.0, 16.0, 14.0),
                              child: Container(
                                height: 33.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEF),
                                  borderRadius: BorderRadius.circular(999.0),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2.0, 2.0, 2.0, 2.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.occupation = 0;
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 90.0,
                                              decoration: BoxDecoration(
                                                color: _model.occupation == 0
                                                    ? Colors.white
                                                    : Color(0x00000000),
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(999.0),
                                                  topRight:
                                                      Radius.circular(999.0),
                                                  bottomLeft:
                                                      Radius.circular(999.0),
                                                  bottomRight:
                                                      Radius.circular(999.0),
                                                ),
                                                shape: BoxShape.rectangle,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.occupation = 1;
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 80.0,
                                              decoration: BoxDecoration(
                                                color: _model.occupation == 1
                                                    ? Colors.white
                                                    : Color(0x00000000),
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(999.0),
                                                  topRight:
                                                      Radius.circular(999.0),
                                                  bottomLeft:
                                                      Radius.circular(999.0),
                                                  bottomRight:
                                                      Radius.circular(999.0),
                                                ),
                                                shape: BoxShape.rectangle,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.occupation = 2;
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 80.0,
                                              decoration: BoxDecoration(
                                                color: _model.occupation == 2
                                                    ? Colors.white
                                                    : Color(0x00000000),
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(999.0),
                                                  topRight:
                                                      Radius.circular(999.0),
                                                  bottomLeft:
                                                      Radius.circular(999.0),
                                                  bottomRight:
                                                      Radius.circular(999.0),
                                                ),
                                                shape: BoxShape.rectangle,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.occupation = 3;
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 75.0,
                                              decoration: BoxDecoration(
                                                color: _model.occupation == 3
                                                    ? Colors.white
                                                    : Color(0x00000000),
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(999.0),
                                                  topRight:
                                                      Radius.circular(999.0),
                                                  bottomLeft:
                                                      Radius.circular(999.0),
                                                  bottomRight:
                                                      Radius.circular(999.0),
                                                ),
                                                shape: BoxShape.rectangle,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            6.0, 0.0, 15.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.occupation = 0;
                                                safeSetState(() {});
                                              },
                                              child: Text(
                                                'Berufstätig',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xDD000000),
                                                      fontSize: 13.0,
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
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.occupation = 1;
                                                safeSetState(() {});
                                              },
                                              child: Text(
                                                'Schüler',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xDD000000),
                                                      fontSize: 13.0,
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
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.occupation = 2;
                                                safeSetState(() {});
                                              },
                                              child: Text(
                                                'Student',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xDD000000),
                                                      fontSize: 13.0,
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
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.occupation = 3;
                                                safeSetState(() {});
                                              },
                                              child: Text(
                                                'Rentner',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xDD000000),
                                                      fontSize: 13.0,
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
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              33.0, 0.0, 16.0, 10.0),
                          child: Text(
                            'Interessen ',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  color: Color(0xDF6B7280),
                                  fontSize: 17.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 28.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                wrapWithModel(
                                  model: _model.sportModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: AppleSwitchWidget(
                                    title: 'Sport',
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.geschaefteModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: AppleSwitchWidget(
                                    title: 'Geschäfte',
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.ausfluegeModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: AppleSwitchWidget(
                                    title: 'Ausflüge',
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.theaterKulturModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: AppleSwitchWidget(
                                    title: 'Theater & Kultur',
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.gastronomieModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: AppleSwitchWidget(
                                    title: 'Gastronomie',
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.pizzeriaModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: AppleSwitchWidget(
                                    title: 'Pizzeria',
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.veganeKostModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: AppleSwitchWidget(
                                    title: 'Vegane Kost',
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.hochzeitslocationModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: AppleSwitchWidget(
                                    title: 'Hochzeitslocation',
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.buchhandlungModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: AppleSwitchWidget(
                                    title: 'Buchhandlung',
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.spielzeugModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: AppleSwitchWidget(
                                    title: 'Spielzeug',
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.regionalModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: AppleSwitchWidget(
                                    title: 'Regional',
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.familieundKinderModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: AppleSwitchWidget(
                                    title: 'Familie und Kinder',
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.picknickplatzModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: AppleSwitchWidget(
                                    title: 'Picknickplatz',
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.teichWaldseeModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: AppleSwitchWidget(
                                    title: 'Teich/Waldsee',
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.flomarktModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: AppleSwitchWidget(
                                    title: 'Flomarkt',
                                  ),
                                ),
                              ]
                                  .addToStart(SizedBox(height: 13.0))
                                  .addToEnd(SizedBox(height: 10.0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              33.0, 0.0, 16.0, 8.0),
                          child: Text(
                            'Wofür nutzt du die App?',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  color: Color(0xDF6B7280),
                                  fontSize: 17.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 18.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 15.0, 16.0, 15.0),
                              child: Container(
                                height: 33.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEF),
                                  borderRadius: BorderRadius.circular(999.0),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2.0, 2.0, 2.0, 2.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.appUsage = 0;
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 100.0,
                                              decoration: BoxDecoration(
                                                color: _model.appUsage == 0
                                                    ? Colors.white
                                                    : Color(0x00000000),
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(999.0),
                                                  topRight:
                                                      Radius.circular(999.0),
                                                  bottomLeft:
                                                      Radius.circular(999.0),
                                                  bottomRight:
                                                      Radius.circular(999.0),
                                                ),
                                                shape: BoxShape.rectangle,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.appUsage = 1;
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 140.0,
                                              decoration: BoxDecoration(
                                                color: _model.appUsage == 1
                                                    ? Colors.white
                                                    : Color(0x00000000),
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(999.0),
                                                  topRight:
                                                      Radius.circular(999.0),
                                                  bottomLeft:
                                                      Radius.circular(999.0),
                                                  bottomRight:
                                                      Radius.circular(999.0),
                                                ),
                                                shape: BoxShape.rectangle,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.appUsage = 2;
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 85.0,
                                              decoration: BoxDecoration(
                                                color: _model.appUsage == 2
                                                    ? Colors.white
                                                    : Color(0x00000000),
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(999.0),
                                                  topRight:
                                                      Radius.circular(999.0),
                                                  bottomLeft:
                                                      Radius.circular(999.0),
                                                  bottomRight:
                                                      Radius.circular(999.0),
                                                ),
                                                shape: BoxShape.rectangle,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.appUsage = 0;
                                              safeSetState(() {});
                                            },
                                            child: Text(
                                              'Turistisch',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF14181B),
                                                    fontSize: 13.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.appUsage = 1;
                                              safeSetState(() {});
                                            },
                                            child: Text(
                                              'Organisatorisch',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF14181B),
                                                    fontSize: 13.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.appUsage = 2;
                                              safeSetState(() {});
                                            },
                                            child: Text(
                                              'Beides',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF14181B),
                                                    fontSize: 13.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (_model.saved)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 18.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 20.0, 0.0, 20.0),
                                  child: Text(
                                    'Gespeichert!',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineLarge
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFF32BB54),
                                          fontSize: 17.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineLarge
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Builder(
                          builder: (context) => Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 15.0, 16.0, 55.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showDialog(
                                  barrierColor: Color(0x7F000000),
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: GestureDetector(
                                        onTap: () {
                                          FocusScope.of(dialogContext)
                                              .unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: DeleteAccountAnfrageWidget(),
                                      ),
                                    );
                                  },
                                );

                                await currentUserReference!.delete();
                              },
                              child: Container(
                                height: 55.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 1.0, 0.0, 0.0),
                                    child: Text(
                                      'Konto löschen',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFFFF3B30),
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineLarge
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if ((widget.pageTitle == 'Kontoeinstellungen') && !loggedIn)
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF2F2F7),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10.0,
                              color: Color(0x0B000000),
                              offset: Offset(
                                0.0,
                                0.0,
                              ),
                              spreadRadius: 5.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      FFIcons.kpersonbadgeplus,
                                      color: Color(0xFFD22B1B),
                                      size: 32.0,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            18.0, 10.0, 0.0, 10.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Text(
                                                'App personalisieren',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 17.0,
                                                          letterSpacing: 0.2,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 2.0, 0.0, 0.0),
                                              child: Text(
                                                'Erstelle ein Konto und personalisiere \ndeine App mit deinen Interessen und\nEinstellungen',
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF57636C),
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                      lineHeight: 1.55,
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
                                    0.0, 8.0, 0.0, 10.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor: Color(0x39000000),
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () {
                                            FocusScope.of(context).unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: Container(
                                              height: 812.0,
                                              child: LoginForGuestWidget(),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  text: 'Konto erstellen oder anmelden',
                                  icon: Icon(
                                    FFIcons.kpersoncropcircle,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: 360.0,
                                    height: 45.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    color: Color(0xFFD22B1B),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          fontSize: 17.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                      ),
                    ),
                  ],
                ),
              ),
            if (widget.pageTitle == 'Mitteilungen')
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(),
                child: wrapWithModel(
                  model: _model.einstellungenModel,
                  updateCallback: () => safeSetState(() {}),
                  child: EinstellungenWidget(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

import '/backend/backend.dart';
import '/favoriten/favoriten/favoriten_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/home/home_widget.dart';
import '/profile/profil/profil_widget.dart';
import '/stoebern/stoebern/stoebern_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'homePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.migrateField(
        'events',
        'Short Description',
        'ShortDescription',
      );
      await actions.migrateField(
        'events',
        'Website Url',
        'WebsiteUrl',
      );
      await actions.migrateField(
        'events',
        'Long Description',
        'LongDescription',
      );
      await actions.migrateField(
        'events',
        'Cancellation information',
        'Cancellation_information',
      );
      await actions.migrateField(
        'events',
        'Event Url',
        'EventUrl',
      );
      await actions.migrateField(
        'events',
        'Preis Information',
        'PreisInformation',
      );
      await actions.migrateField(
        'events',
        'Öffnungszeiten',
        'Oeffnungszeiten',
      );
      await actions.migrateField(
        'events',
        'Image Url',
        'imageUrl',
      );
      await actions.migrateField(
        'buchen',
        'Page URL',
        'Page_URL',
      );
      await actions.migrateField(
        'buchen',
        'Ländercode',
        'Laendercode',
      );
      await actions.migrateField(
        'buchen',
        'Bild URL',
        'Bild_URL',
      );
      await actions.migrateField(
        'buchen',
        'Zimmer Anzahl',
        'Zimmer_Anzahl',
      );
      await actions.migrateField(
        'freizeit',
        'Short Description',
        'ShortDescription',
      );
      await actions.migrateField(
        'freizeit',
        'Website Url',
        'WebsiteUrl',
      );
      await actions.migrateField(
        'freizeit',
        'Long Description',
        'LongDescription',
      );
      await actions.migrateField(
        'freizeit',
        'Cancellation information',
        'Cancellation_information',
      );
      await actions.migrateField(
        'freizeit',
        'Event Url',
        'EventUrl',
      );
      await actions.migrateField(
        'freizeit',
        'Preis Information',
        'PreisInformation',
      );
      await actions.migrateField(
        'freizeit',
        'Öffnungszeiten',
        'Oeffnungszeiten',
      );
      await actions.migrateField(
        'freizeit',
        'Image Url',
        'ImageUrl',
      );
      await actions.migrateField(
        'gastro',
        'Short Description',
        'ShortDescription',
      );
      await actions.migrateField(
        'gastro',
        'Website Url',
        'WebsiteUrl',
      );
      await actions.migrateField(
        'gastro',
        'Long Description',
        'LongDescription',
      );
      await actions.migrateField(
        'gastro',
        'Cancellation information',
        'Cancellation_information',
      );
      await actions.migrateField(
        'gastro',
        'Event Url',
        'EventUrl',
      );
      await actions.migrateField(
        'gastro',
        'Preis Information',
        'PreisInformation',
      );
      await actions.migrateField(
        'gastro',
        'Öffnungszeiten',
        'Oeffnungszeiten',
      );
      await actions.migrateField(
        'gastro',
        'Image Url',
        'ImageUrl',
      );
      await actions.migrateField(
        'park',
        'Short Description',
        'ShortDescription',
      );
      await actions.migrateField(
        'park',
        'Website Url',
        'WebsiteUrl',
      );
      await actions.migrateField(
        'park',
        'Long Description',
        'LongDescription',
      );
      await actions.migrateField(
        'park',
        'Cancellation information',
        'Cancellation_information',
      );
      await actions.migrateField(
        'park',
        'Event Url',
        'EventUrl',
      );
      await actions.migrateField(
        'park',
        'Preis Information',
        'PreisInformation',
      );
      await actions.migrateField(
        'park',
        'Öffnungszeiten',
        'Oeffnungszeiten',
      );
      await actions.migrateField(
        'park',
        'Image Url',
        'ImageUrl',
      );
      await actions.migrateField(
        'shopping',
        'Short Description',
        'ShortDescription',
      );
      await actions.migrateField(
        'shopping',
        'Website Url',
        'WebsiteUrl',
      );
      await actions.migrateField(
        'shopping',
        'Long Description',
        'LongDescription',
      );
      await actions.migrateField(
        'shopping',
        'Cancellation information',
        'Cancellation_information',
      );
      await actions.migrateField(
        'shopping',
        'Event Url',
        'EventUrl',
      );
      await actions.migrateField(
        'shopping',
        'Preis Information',
        'PreisInformation',
      );
      await actions.migrateField(
        'shopping',
        'Öffnungszeiten',
        'Oeffnungszeiten',
      );
      await actions.migrateField(
        'shopping',
        'Image Url',
        'ImageUrl',
      );
    });

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.linear,
            delay: 0.1.ms,
            duration: 300.0.ms,
            begin: Offset(1.05, 1.05),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return StreamBuilder<List<EventsRecord>>(
      stream: queryEventsRecord(
        queryBuilder: (eventsRecord) =>
            eventsRecord.orderBy('date').orderBy('time'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFFAFAFA),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<EventsRecord> homePageEventsRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFFAFAFA),
            body: Stack(
              children: [
                if (FFAppState().tabbar == 0)
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF3F3F3),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.homeModel,
                        updateCallback: () => safeSetState(() {}),
                        child: HomeWidget(),
                      ),
                    ),
                  ),
                if (FFAppState().tabbar == 1)
                  Container(
                    decoration: BoxDecoration(),
                    child: wrapWithModel(
                      model: _model.favoritenModel,
                      updateCallback: () => safeSetState(() {}),
                      child: FavoritenWidget(
                        eventsList: homePageEventsRecordList,
                      ),
                    ),
                  ),
                if (FFAppState().tabbar == 2)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.rectangle,
                    ),
                    child: wrapWithModel(
                      model: _model.stoebernModel,
                      updateCallback: () => safeSetState(() {}),
                      child: StoebernWidget(
                        heart: Icon(
                          FFIcons.kheart,
                          color: Colors.white,
                          size: 25.0,
                        ),
                        heartfill: Icon(
                          FFIcons.kheartfill,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                if (FFAppState().tabbar == 3)
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFAFAFA),
                    ),
                    child: wrapWithModel(
                      model: _model.profilModel,
                      updateCallback: () => safeSetState(() {}),
                      child: ProfilWidget(),
                    ),
                  ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (animationsMap[
                                'containerOnActionTriggerAnimation'] !=
                            null) {
                          safeSetState(() => hasContainerTriggered = true);
                          SchedulerBinding.instance.addPostFrameCallback(
                              (_) async => await animationsMap[
                                      'containerOnActionTriggerAnimation']!
                                  .controller
                                  .forward(from: 0.0));
                        }
                      },
                      onLongPress: () async {
                        if (animationsMap[
                                'containerOnActionTriggerAnimation'] !=
                            null) {
                          safeSetState(() => hasContainerTriggered = true);
                          SchedulerBinding.instance.addPostFrameCallback(
                              (_) async => await animationsMap[
                                      'containerOnActionTriggerAnimation']!
                                  .controller
                                  .forward(from: 0.0));
                        }
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 0.05,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999.0),
                        ),
                        child: Container(
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: () {
                              if (FFAppState().tabbar == 0) {
                                return Color(0xFFFCFCFF);
                              } else if (FFAppState().tabbar == 2) {
                                return Color(0x83191919);
                              } else {
                                return Color(0xBBFCFCFF);
                              }
                            }(),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10.0,
                                color: FFAppState().tabbar == 2
                                    ? Color(0x00000000)
                                    : Color(0x8FFFFFFF),
                                offset: Offset(
                                  10.0,
                                  10.0,
                                ),
                                spreadRadius: 10.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(999.0),
                          ),
                          child: Stack(
                            children: [
                              if (FFAppState().tabbar == 0)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 4.0, 5.0, 4.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().tabbar = 0;
                                      safeSetState(() {});
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation'] !=
                                          null) {
                                        safeSetState(
                                            () => hasContainerTriggered = true);
                                        SchedulerBinding.instance
                                            .addPostFrameCallback((_) async =>
                                                await animationsMap[
                                                        'containerOnActionTriggerAnimation']!
                                                    .controller
                                                    .forward(from: 0.0));
                                      }
                                    },
                                    onLongPress: () async {
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation'] !=
                                          null) {
                                        safeSetState(
                                            () => hasContainerTriggered = true);
                                        SchedulerBinding.instance
                                            .addPostFrameCallback((_) async =>
                                                await animationsMap[
                                                        'containerOnActionTriggerAnimation']!
                                                    .controller
                                                    .forward(from: 0.0));
                                      }
                                    },
                                    child: Container(
                                      width: 90.0,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEAEAED),
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
                              if (FFAppState().tabbar == 1)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      100.0, 4.0, 0.0, 4.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().tabbar = 1;
                                      safeSetState(() {});
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation'] !=
                                          null) {
                                        safeSetState(
                                            () => hasContainerTriggered = true);
                                        SchedulerBinding.instance
                                            .addPostFrameCallback((_) async =>
                                                await animationsMap[
                                                        'containerOnActionTriggerAnimation']!
                                                    .controller
                                                    .forward(from: 0.0));
                                      }
                                    },
                                    onLongPress: () async {
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation'] !=
                                          null) {
                                        safeSetState(
                                            () => hasContainerTriggered = true);
                                        SchedulerBinding.instance
                                            .addPostFrameCallback((_) async =>
                                                await animationsMap[
                                                        'containerOnActionTriggerAnimation']!
                                                    .controller
                                                    .forward(from: 0.0));
                                      }
                                    },
                                    child: Container(
                                      width: 90.0,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEAEAED),
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
                              if (FFAppState().tabbar == 2)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      184.0, 4.0, 0.0, 4.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().tabbar = 2;
                                      safeSetState(() {});
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation'] !=
                                          null) {
                                        safeSetState(
                                            () => hasContainerTriggered = true);
                                        SchedulerBinding.instance
                                            .addPostFrameCallback((_) async =>
                                                await animationsMap[
                                                        'containerOnActionTriggerAnimation']!
                                                    .controller
                                                    .forward(from: 0.0));
                                      }
                                    },
                                    onLongPress: () async {
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation'] !=
                                          null) {
                                        safeSetState(
                                            () => hasContainerTriggered = true);
                                        SchedulerBinding.instance
                                            .addPostFrameCallback((_) async =>
                                                await animationsMap[
                                                        'containerOnActionTriggerAnimation']!
                                                    .controller
                                                    .forward(from: 0.0));
                                      }
                                    },
                                    child: Container(
                                      width: 90.0,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FFAppState().tabbar == 2
                                            ? Color(0xD14D4C48)
                                            : Colors.transparent,
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
                              if (FFAppState().tabbar == 3)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      260.0, 4.0, 0.0, 4.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().tabbar = 3;
                                      safeSetState(() {});
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation'] !=
                                          null) {
                                        safeSetState(
                                            () => hasContainerTriggered = true);
                                        SchedulerBinding.instance
                                            .addPostFrameCallback((_) async =>
                                                await animationsMap[
                                                        'containerOnActionTriggerAnimation']!
                                                    .controller
                                                    .forward(from: 0.0));
                                      }
                                    },
                                    onLongPress: () async {
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation'] !=
                                          null) {
                                        safeSetState(
                                            () => hasContainerTriggered = true);
                                        SchedulerBinding.instance
                                            .addPostFrameCallback((_) async =>
                                                await animationsMap[
                                                        'containerOnActionTriggerAnimation']!
                                                    .controller
                                                    .forward(from: 0.0));
                                      }
                                    },
                                    child: Container(
                                      width: 90.0,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEAEAED),
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
                              ClipRRect(
                                borderRadius: BorderRadius.circular(999.0),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX:
                                        FFAppState().tabbar == 0 ? 0.0 : 2.0,
                                    sigmaY:
                                        FFAppState().tabbar == 0 ? 0.0 : 2.0,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (animationsMap[
                                                        'containerOnActionTriggerAnimation'] !=
                                                    null) {
                                                  safeSetState(() =>
                                                      hasContainerTriggered =
                                                          true);
                                                  SchedulerBinding.instance
                                                      .addPostFrameCallback(
                                                          (_) async =>
                                                              await animationsMap[
                                                                      'containerOnActionTriggerAnimation']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0));
                                                }
                                                FFAppState().tabbar = 0;
                                                safeSetState(() {});
                                              },
                                              onLongPress: () async {
                                                if (animationsMap[
                                                        'containerOnActionTriggerAnimation'] !=
                                                    null) {
                                                  safeSetState(() =>
                                                      hasContainerTriggered =
                                                          true);
                                                  SchedulerBinding.instance
                                                      .addPostFrameCallback(
                                                          (_) async =>
                                                              await animationsMap[
                                                                      'containerOnActionTriggerAnimation']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0));
                                                }
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 2.0, 10.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    1.0),
                                                        child: Icon(
                                                          FFIcons
                                                              .kbildschirmfoto20260104Um134816,
                                                          color: () {
                                                            if (FFAppState()
                                                                    .tabbar ==
                                                                2) {
                                                              return Colors
                                                                  .white;
                                                            } else if (FFAppState()
                                                                    .tabbar ==
                                                                0) {
                                                              return Color(
                                                                  0xFFD12717);
                                                            } else {
                                                              return Color(
                                                                  0xFF14181B);
                                                            }
                                                          }(),
                                                          size: 28.0,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    1.0,
                                                                    2.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Home',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .interTight(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: () {
                                                                  if (FFAppState()
                                                                          .tabbar ==
                                                                      2) {
                                                                    return Colors
                                                                        .white;
                                                                  } else if (FFAppState()
                                                                          .tabbar ==
                                                                      0) {
                                                                    return Color(
                                                                        0xFFD12717);
                                                                  } else {
                                                                    return Color(
                                                                        0xFF14181B);
                                                                  }
                                                                }(),
                                                                fontSize: 11.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle: FlutterFlowTheme.of(
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
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            FFAppState().tabbar = 1;
                                            safeSetState(() {});
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation'] !=
                                                null) {
                                              safeSetState(() =>
                                                  hasContainerTriggered = true);
                                              SchedulerBinding.instance
                                                  .addPostFrameCallback((_) async =>
                                                      await animationsMap[
                                                              'containerOnActionTriggerAnimation']!
                                                          .controller
                                                          .forward(from: 0.0));
                                            }
                                          },
                                          onLongPress: () async {
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation'] !=
                                                null) {
                                              safeSetState(() =>
                                                  hasContainerTriggered = true);
                                              SchedulerBinding.instance
                                                  .addPostFrameCallback((_) async =>
                                                      await animationsMap[
                                                              'containerOnActionTriggerAnimation']!
                                                          .controller
                                                          .forward(from: 0.0));
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 2.0, 10.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 5.0),
                                                    child: Icon(
                                                      FFIcons.kheartfill,
                                                      color:
                                                          valueOrDefault<Color>(
                                                        () {
                                                          if (FFAppState()
                                                                  .tabbar ==
                                                              2) {
                                                            return Colors.white;
                                                          } else if (FFAppState()
                                                                  .tabbar ==
                                                              1) {
                                                            return Color(
                                                                0xFFD12717);
                                                          } else {
                                                            return Color(
                                                                0xFF14181B);
                                                          }
                                                        }(),
                                                        Color(0xFFB80909),
                                                      ),
                                                      size: 22.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Favoriten',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .interTight(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: () {
                                                            if (FFAppState()
                                                                    .tabbar ==
                                                                2) {
                                                              return Colors
                                                                  .white;
                                                            } else if (FFAppState()
                                                                    .tabbar ==
                                                                1) {
                                                              return Color(
                                                                  0xFFD12717);
                                                            } else {
                                                              return Color(
                                                                  0xFF14181B);
                                                            }
                                                          }(),
                                                          fontSize: 11.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 6.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              FFAppState().tabbar = 2;
                                              safeSetState(() {});
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation'] !=
                                                  null) {
                                                safeSetState(() =>
                                                    hasContainerTriggered =
                                                        true);
                                                SchedulerBinding.instance
                                                    .addPostFrameCallback(
                                                        (_) async =>
                                                            await animationsMap[
                                                                    'containerOnActionTriggerAnimation']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0));
                                              }
                                            },
                                            onLongPress: () async {
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation'] !=
                                                  null) {
                                                safeSetState(() =>
                                                    hasContainerTriggered =
                                                        true);
                                                SchedulerBinding.instance
                                                    .addPostFrameCallback(
                                                        (_) async =>
                                                            await animationsMap[
                                                                    'containerOnActionTriggerAnimation']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0));
                                              }
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 1.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Icon(
                                                      Icons.search_rounded,
                                                      color:
                                                          valueOrDefault<Color>(
                                                        FFAppState().tabbar == 2
                                                            ? Color(0xFFD12717)
                                                            : Color(0xFF14181B),
                                                        Color(0xFFB80909),
                                                      ),
                                                      size: 32.0,
                                                    ),
                                                    Text(
                                                      'Stöbern',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .interTight(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              FFAppState().tabbar ==
                                                                      2
                                                                  ? Color(
                                                                      0xFFD12717)
                                                                  : Color(
                                                                      0xFF14181B),
                                                              Color(0xFFB80909),
                                                            ),
                                                            fontSize: 11.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ].addToEnd(
                                                      SizedBox(height: 1.0)),
                                                ),
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
                                            FFAppState().tabbar = 3;
                                            safeSetState(() {});
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation'] !=
                                                null) {
                                              safeSetState(() =>
                                                  hasContainerTriggered = true);
                                              SchedulerBinding.instance
                                                  .addPostFrameCallback((_) async =>
                                                      await animationsMap[
                                                              'containerOnActionTriggerAnimation']!
                                                          .controller
                                                          .forward(from: 0.0));
                                            }
                                          },
                                          onLongPress: () async {
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation'] !=
                                                null) {
                                              safeSetState(() =>
                                                  hasContainerTriggered = true);
                                              SchedulerBinding.instance
                                                  .addPostFrameCallback((_) async =>
                                                      await animationsMap[
                                                              'containerOnActionTriggerAnimation']!
                                                          .controller
                                                          .forward(from: 0.0));
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 9.0, 5.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Icon(
                                                      FFIcons.kpersonfill,
                                                      color: () {
                                                        if (FFAppState()
                                                                .tabbar ==
                                                            2) {
                                                          return Colors.white;
                                                        } else if (FFAppState()
                                                                .tabbar ==
                                                            3) {
                                                          return Color(
                                                              0xFFD12717);
                                                        } else {
                                                          return Color(
                                                              0xFF14181B);
                                                        }
                                                      }(),
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Profil',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .interTight(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: () {
                                                            if (FFAppState()
                                                                    .tabbar ==
                                                                2) {
                                                              return Colors
                                                                  .white;
                                                            } else if (FFAppState()
                                                                    .tabbar ==
                                                                3) {
                                                              return Color(
                                                                  0xFFD12717);
                                                            } else {
                                                              return Color(
                                                                  0xFF14181B);
                                                            }
                                                          }(),
                                                          fontSize: 11.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
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
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ).animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation']!,
                        hasBeenTriggered: hasContainerTriggered),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import '/auth/firebase_auth/auth_util.dart';
import '/entdecken/entdecken/entdecken_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/fuer_dich/fuer_dich/fuer_dich_widget.dart';
import '/veranstaltungen/veranstaltungen/veranstaltungen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  var hasContainerTriggered1 = false;
  var hasContainerTriggered2 = false;
  var hasContainerTriggered3 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeOut,
            delay: 0.1.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.2, 1.2),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeOut,
            delay: 0.1.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.2, 1.2),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeOut,
            delay: 0.1.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.2, 1.2),
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 165.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 80.0, 16.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (animationsMap['containerOnActionTriggerAnimation1'] !=
                          null) {
                        safeSetState(() => hasContainerTriggered1 = true);
                        SchedulerBinding.instance.addPostFrameCallback(
                            (_) async => await animationsMap[
                                    'containerOnActionTriggerAnimation1']!
                                .controller
                                .forward(from: 0.0));
                      }
                      FFAppState().TopBar = 0;
                      FFAppState().update(() {});
                      if (animationsMap['containerOnActionTriggerAnimation2'] !=
                          null) {
                        await animationsMap[
                                'containerOnActionTriggerAnimation2']!
                            .controller
                            .reverse();
                      }
                      if (animationsMap['containerOnActionTriggerAnimation3'] !=
                          null) {
                        await animationsMap[
                                'containerOnActionTriggerAnimation3']!
                            .controller
                            .reverse();
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 5.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Image.network(
                                valueOrDefault<String>(
                                  loggedIn
                                      ? () {
                                          if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.profileIconName,
                                                  '') ==
                                              'Person1') {
                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/marburg-flutter-flow-1xanic/assets/d8v0pve0ezs8/Person1.png';
                                          } else if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.profileIconName,
                                                  '') ==
                                              'Person2') {
                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/marburg-flutter-flow-1xanic/assets/mr02omvrz9ox/Person2.png';
                                          } else if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.profileIconName,
                                                  '') ==
                                              'Person3') {
                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/marburg-flutter-flow-1xanic/assets/y64cclr3o6lh/Person3.png';
                                          } else if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.profileIconName,
                                                  '') ==
                                              'Person4') {
                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/marburg-flutter-flow-1xanic/assets/ex8hk25qto43/Person4.png';
                                          } else if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.profileIconName,
                                                  '') ==
                                              'Person5') {
                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/marburg-flutter-flow-1xanic/assets/sgqt68j4sj2l/Person5.png';
                                          } else if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.profileIconName,
                                                  '') ==
                                              'Person6') {
                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/marburg-flutter-flow-1xanic/assets/rpofmt9g2t4w/Person6.png';
                                          } else if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.profileIconName,
                                                  '') ==
                                              'Person7') {
                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/marburg-flutter-flow-1xanic/assets/5zqwpf1gv2ma/Person7.png';
                                          } else if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.profileIconName,
                                                  '') ==
                                              'Person8') {
                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/marburg-flutter-flow-1xanic/assets/tcsdk8ulhk0o/Person8.png';
                                          } else if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.profileIconName,
                                                  '') ==
                                              'Person9') {
                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/marburg-flutter-flow-1xanic/assets/6o1kr9ikp8wf/Person9.png';
                                          } else if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.profileIconName,
                                                  '') ==
                                              'Person10') {
                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/marburg-flutter-flow-1xanic/assets/6ewqlr6juvcm/Person10.png';
                                          } else if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.profileIconName,
                                                  '') ==
                                              'Person11') {
                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/marburg-flutter-flow-1xanic/assets/7g32pbzntxev/Person11.png';
                                          } else if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.profileIconName,
                                                  '') ==
                                              'Person12') {
                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/marburg-flutter-flow-1xanic/assets/r1kvoq354kih/Person12.png';
                                          } else {
                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/marburg-flutter-flow-1xanic/assets/d8v0pve0ezs8/Person1.png';
                                          }
                                        }()
                                      : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/marburg-flutter-flow-1xanic/assets/d8v0pve0ezs8/Person1.png',
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/marburg-flutter-flow-1xanic/assets/d8v0pve0ezs8/Person1.png',
                                ),
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            'Für dich',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FFAppState().TopBar == 0
                                      ? Colors.black
                                      : Color(0xFFAEAEB1),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ).animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation1']!,
                      hasBeenTriggered: hasContainerTriggered1),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (animationsMap['containerOnActionTriggerAnimation2'] !=
                          null) {
                        safeSetState(() => hasContainerTriggered2 = true);
                        SchedulerBinding.instance.addPostFrameCallback(
                            (_) async => await animationsMap[
                                    'containerOnActionTriggerAnimation2']!
                                .controller
                                .forward(from: 0.0));
                      }
                      FFAppState().TopBar = 1;
                      FFAppState().update(() {});
                      if (animationsMap['containerOnActionTriggerAnimation1'] !=
                          null) {
                        await animationsMap[
                                'containerOnActionTriggerAnimation1']!
                            .controller
                            .reverse();
                      }
                      if (animationsMap['containerOnActionTriggerAnimation3'] !=
                          null) {
                        await animationsMap[
                                'containerOnActionTriggerAnimation3']!
                            .controller
                            .reverse();
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/Erleben.png',
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            'Veranstaltungen',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FFAppState().TopBar == 1
                                      ? Colors.black
                                      : Color(0xFFAEAEB1),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ).animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation2']!,
                      hasBeenTriggered: hasContainerTriggered2),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (animationsMap['containerOnActionTriggerAnimation3'] !=
                          null) {
                        safeSetState(() => hasContainerTriggered3 = true);
                        SchedulerBinding.instance.addPostFrameCallback(
                            (_) async => await animationsMap[
                                    'containerOnActionTriggerAnimation3']!
                                .controller
                                .forward(from: 0.0));
                      }
                      FFAppState().TopBar = 2;
                      FFAppState().update(() {});
                      if (animationsMap['containerOnActionTriggerAnimation2'] !=
                          null) {
                        await animationsMap[
                                'containerOnActionTriggerAnimation2']!
                            .controller
                            .reverse();
                      }
                      if (animationsMap['containerOnActionTriggerAnimation1'] !=
                          null) {
                        await animationsMap[
                                'containerOnActionTriggerAnimation1']!
                            .controller
                            .reverse();
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/entdecken.png',
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            'Entdecken',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FFAppState().TopBar == 2
                                      ? Colors.black
                                      : Color(0xFFAEAEB1),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ).animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation3']!,
                      hasBeenTriggered: hasContainerTriggered3),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              if (FFAppState().TopBar == 0)
                wrapWithModel(
                  model: _model.fuerDichModel,
                  updateCallback: () => safeSetState(() {}),
                  child: FuerDichWidget(),
                ),
              if (FFAppState().TopBar == 1)
                wrapWithModel(
                  model: _model.veranstaltungenModel,
                  updateCallback: () => safeSetState(() {}),
                  child: VeranstaltungenWidget(),
                ),
              if (FFAppState().TopBar == 2)
                wrapWithModel(
                  model: _model.entdeckenModel,
                  updateCallback: () => safeSetState(() {}),
                  child: EntdeckenWidget(),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

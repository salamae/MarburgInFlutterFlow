import '/backend/backend.dart';
import '/compenents/leer_list/leer_list_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/veranstaltungen/eventsl_list/eventsl_list_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'veranstaltungen_model.dart';
export 'veranstaltungen_model.dart';

class VeranstaltungenWidget extends StatefulWidget {
  const VeranstaltungenWidget({super.key});

  @override
  State<VeranstaltungenWidget> createState() => _VeranstaltungenWidgetState();
}

class _VeranstaltungenWidgetState extends State<VeranstaltungenWidget>
    with TickerProviderStateMixin {
  late VeranstaltungenModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VeranstaltungenModel());

    animationsMap.addAll({
      'eventslListOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.linear,
            delay: 0.1.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, -20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'eventslListOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.linear,
            delay: 0.1.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, -20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'eventslListOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.linear,
            delay: 0.1.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, -20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'eventslListOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.linear,
            delay: 0.1.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, -20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'eventslListOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.linear,
            delay: 0.1.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, -20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFAFAFA),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              width: double.infinity,
              height: 70.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Color(0x21020000),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 10.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (FFAppState().TestPagesIndex != 1) {
                              FFAppState().TestPagesIndex = 1;
                              FFAppState().update(() {});
                            } else {
                              FFAppState().TestPagesIndex = 0;
                              FFAppState().update(() {});
                            }
                          },
                          text: 'Heute',
                          options: FFButtonOptions(
                            height: 33.1,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconAlignment: IconAlignment.start,
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FFAppState().TestPagesIndex == 1
                                ? Color(0xFFD02718)
                                : Color(0xFFE5E5EA),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: FFAppState().TestPagesIndex == 1
                                      ? Colors.white
                                      : Colors.black,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (FFAppState().TestPagesIndex != 2) {
                              FFAppState().TestPagesIndex = 2;
                              FFAppState().update(() {});
                            } else {
                              FFAppState().TestPagesIndex = 0;
                              FFAppState().update(() {});
                            }
                          },
                          text: 'Morgen',
                          options: FFButtonOptions(
                            height: 33.1,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FFAppState().TestPagesIndex == 2
                                ? Color(0xFFD02718)
                                : Color(0xFFE5E5EA),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: FFAppState().TestPagesIndex == 2
                                      ? Colors.white
                                      : Colors.black,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (FFAppState().TestPagesIndex != 3) {
                              FFAppState().TestPagesIndex = 3;
                              FFAppState().update(() {});
                            } else {
                              FFAppState().TestPagesIndex = 0;
                              FFAppState().update(() {});
                            }
                          },
                          text: 'Wochenende',
                          options: FFButtonOptions(
                            height: 33.1,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FFAppState().TestPagesIndex == 3
                                ? Color(0xFFD02718)
                                : Color(0xFFE5E5EA),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: FFAppState().TestPagesIndex == 3
                                      ? Colors.white
                                      : Colors.black,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          final _datePickedDate = await showDatePicker(
                            context: context,
                            initialDate: getCurrentTimestamp,
                            firstDate: getCurrentTimestamp,
                            lastDate: DateTime(2050),
                            builder: (context, child) {
                              return wrapInMaterialDatePickerTheme(
                                context,
                                child!,
                                headerBackgroundColor: Colors.transparent,
                                headerForegroundColor: Colors.transparent,
                                headerTextStyle: FlutterFlowTheme.of(context)
                                    .customTextStyle1
                                    .override(
                                      font: GoogleFonts.roboto(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .customTextStyle1
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .customTextStyle1
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .customTextStyle1
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .customTextStyle1
                                          .fontStyle,
                                    ),
                                pickerBackgroundColor: Colors.white,
                                pickerForegroundColor: Colors.black,
                                selectedDateTimeBackgroundColor:
                                    Color(0xFFE0EFFF),
                                selectedDateTimeForegroundColor:
                                    Color(0xFF0081FF),
                                actionButtonForegroundColor: Color(0xFF0081FF),
                                iconSize: 24.0,
                              );
                            },
                          );

                          if (_datePickedDate != null) {
                            safeSetState(() {
                              _model.datePicked = DateTime(
                                _datePickedDate.year,
                                _datePickedDate.month,
                                _datePickedDate.day,
                              );
                            });
                          } else if (_model.datePicked != null) {
                            safeSetState(() {
                              _model.datePicked = getCurrentTimestamp;
                            });
                          }
                          FFAppState().TestPagesIndex = 4;
                          safeSetState(() {});
                          FFAppState().selectedDate = FFAppState().selectedDate;
                          safeSetState(() {});
                        },
                        text: valueOrDefault<String>(
                          FFAppState().TestPagesIndex == 4
                              ? dateTimeFormat("d.M.y", _model.datePicked)
                              : 'Datum',
                          'Datum wählen',
                        ),
                        options: FFButtonOptions(
                          height: 33.1,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FFAppState().TestPagesIndex == 4
                              ? Color(0xFFD02718)
                              : Color(0xFFE5E5EA),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: FFAppState().TestPagesIndex == 4
                                        ? Colors.white
                                        : Colors.black,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
            child: Container(
              height: 558.5,
              child: Stack(
                children: [
                  if (valueOrDefault<bool>(
                    FFAppState().TestPagesIndex == 0,
                    true,
                  ))
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFFAFAFA),
                              shape: BoxShape.rectangle,
                            ),
                            child: StreamBuilder<List<EventsRecord>>(
                              stream: queryEventsRecord(
                                queryBuilder: (eventsRecord) => eventsRecord
                                    .orderBy('date')
                                    .orderBy('time'),
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
                                List<EventsRecord> listViewEventsRecordList =
                                    snapshot.data!;
                                if (listViewEventsRecordList.isEmpty) {
                                  return LeerListWidget(
                                    date: '',
                                  );
                                }

                                return ListView.builder(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    7.0,
                                    0,
                                    0,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewEventsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewEventsRecord =
                                        listViewEventsRecordList[listViewIndex];
                                    return Visibility(
                                      visible: listViewEventsRecord.imageUrl != '',
                                      child: EventslListWidget(
                                        key: Key(
                                            'Key1u5_${listViewIndex}_of_${listViewEventsRecordList.length}'),
                                        name: listViewEventsRecord.name,
                                        description: listViewEventsRecord
                                            .shortDescription,
                                        image: listViewEventsRecord.imageUrl,
                                        time: listViewEventsRecord.time,
                                        date: listViewEventsRecord.date,
                                        eventID: listViewEventsRecord,
                                        redHeart: Icon(
                                          FFIcons.kheartfill,
                                          color: Color(0xFFFF0101),
                                          size: 20.0,
                                        ),
                                        heart: Icon(
                                          FFIcons.kheart,
                                          color: Color(0xFF8E8E93),
                                          size: 20.0,
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'eventslListOnPageLoadAnimation1']!),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (FFAppState().TestPagesIndex == 1)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFFAFAFA),
                              shape: BoxShape.rectangle,
                            ),
                            child: StreamBuilder<List<EventsRecord>>(
                              stream: queryEventsRecord(
                                queryBuilder: (eventsRecord) => eventsRecord
                                    .where(
                                      'date',
                                      isEqualTo: dateTimeFormat(
                                          "yyyy-MM-dd", getCurrentTimestamp),
                                    )
                                    .where(
                                      'time',
                                      isGreaterThanOrEqualTo: dateTimeFormat(
                                          "HH:mm:ss", getCurrentTimestamp),
                                    )
                                    .orderBy('time'),
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
                                List<EventsRecord> listViewEventsRecordList =
                                    snapshot.data!;
                                if (listViewEventsRecordList.isEmpty) {
                                  return LeerListWidget(
                                    date: 'Heute',
                                  );
                                }

                                return ListView.builder(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    7.0,
                                    0,
                                    0,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewEventsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewEventsRecord =
                                        listViewEventsRecordList[listViewIndex];
                                    return Visibility(
                                      visible: listViewEventsRecord.imageUrl != '',
                                      child: EventslListWidget(
                                        key: Key(
                                            'Key9ei_${listViewIndex}_of_${listViewEventsRecordList.length}'),
                                        name: listViewEventsRecord.name,
                                        description: listViewEventsRecord
                                            .shortDescription,
                                        image: listViewEventsRecord.imageUrl,
                                        time: listViewEventsRecord.time,
                                        date: listViewEventsRecord.date,
                                        eventID: listViewEventsRecord,
                                        redHeart: Icon(
                                          FFIcons.kheartfill,
                                          color: Color(0xFFFF0101),
                                          size: 20.0,
                                        ),
                                        heart: Icon(
                                          FFIcons.kheart,
                                          color: Color(0xFF8E8E93),
                                          size: 20.0,
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'eventslListOnPageLoadAnimation2']!),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (FFAppState().TestPagesIndex == 2)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFFAFAFA),
                              shape: BoxShape.rectangle,
                            ),
                            child: StreamBuilder<List<EventsRecord>>(
                              stream: queryEventsRecord(
                                queryBuilder: (eventsRecord) => eventsRecord
                                    .where(
                                      'date',
                                      isEqualTo: functions.tomorrowDateString(),
                                    )
                                    .orderBy('time'),
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
                                List<EventsRecord> listViewEventsRecordList =
                                    snapshot.data!;
                                if (listViewEventsRecordList.isEmpty) {
                                  return LeerListWidget(
                                    date: 'Morgen',
                                  );
                                }

                                return ListView.builder(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    7.0,
                                    0,
                                    0,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewEventsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewEventsRecord =
                                        listViewEventsRecordList[listViewIndex];
                                    return Visibility(
                                      visible: listViewEventsRecord.imageUrl != '',
                                      child: EventslListWidget(
                                        key: Key(
                                            'Keyc74_${listViewIndex}_of_${listViewEventsRecordList.length}'),
                                        name: listViewEventsRecord.name,
                                        description: listViewEventsRecord
                                            .shortDescription,
                                        image: listViewEventsRecord.imageUrl,
                                        time: listViewEventsRecord.time,
                                        date: listViewEventsRecord.date,
                                        eventID: listViewEventsRecord,
                                        redHeart: Icon(
                                          FFIcons.kheartfill,
                                          color: Color(0xFFFF0101),
                                          size: 20.0,
                                        ),
                                        heart: Icon(
                                          FFIcons.kheart,
                                          color: Color(0xFF8E8E93),
                                          size: 20.0,
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'eventslListOnPageLoadAnimation3']!),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (FFAppState().TestPagesIndex == 3)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFFAFAFA),
                              shape: BoxShape.rectangle,
                            ),
                            child: StreamBuilder<List<EventsRecord>>(
                              stream: queryEventsRecord(
                                queryBuilder: (eventsRecord) => eventsRecord
                                    .where(
                                      'date',
                                      isGreaterThanOrEqualTo:
                                          functions.nextFridayYMD(),
                                    )
                                    .where(
                                      'date',
                                      isLessThan:
                                          functions.nextMondayAfterWeekendYMD(),
                                    )
                                    .orderBy('date')
                                    .orderBy('time'),
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
                                List<EventsRecord> listViewEventsRecordList =
                                    snapshot.data!;
                                if (listViewEventsRecordList.isEmpty) {
                                  return LeerListWidget(
                                    date: 'Wochenende',
                                  );
                                }

                                return ListView.builder(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    7.0,
                                    0,
                                    0,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewEventsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewEventsRecord =
                                        listViewEventsRecordList[listViewIndex];
                                    return Visibility(
                                      visible: listViewEventsRecord.imageUrl != '',
                                      child: EventslListWidget(
                                        key: Key(
                                            'Keydvt_${listViewIndex}_of_${listViewEventsRecordList.length}'),
                                        name: listViewEventsRecord.name,
                                        description: listViewEventsRecord
                                            .shortDescription,
                                        image: listViewEventsRecord.imageUrl,
                                        time: listViewEventsRecord.time,
                                        date: listViewEventsRecord.date,
                                        eventID: listViewEventsRecord,
                                        redHeart: Icon(
                                          FFIcons.kheartfill,
                                          color: Color(0xFFFF0101),
                                          size: 20.0,
                                        ),
                                        heart: Icon(
                                          FFIcons.kheart,
                                          color: Color(0xFF8E8E93),
                                          size: 20.0,
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'eventslListOnPageLoadAnimation4']!),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (FFAppState().TestPagesIndex == 4)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFFAFAFA),
                              shape: BoxShape.rectangle,
                            ),
                            child: StreamBuilder<List<EventsRecord>>(
                              stream: queryEventsRecord(
                                queryBuilder: (eventsRecord) => eventsRecord
                                    .where(
                                      'date',
                                      isEqualTo: dateTimeFormat(
                                          "yyyy-MM-dd", _model.datePicked),
                                    )
                                    .orderBy('time'),
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
                                List<EventsRecord> listViewEventsRecordList =
                                    snapshot.data!;
                                if (listViewEventsRecordList.isEmpty) {
                                  return LeerListWidget(
                                    date: dateTimeFormat(
                                        "dd.MM.yyyy", _model.datePicked),
                                  );
                                }

                                return ListView.builder(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    7.0,
                                    0,
                                    0,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewEventsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewEventsRecord =
                                        listViewEventsRecordList[listViewIndex];
                                    return Visibility(
                                      visible: listViewEventsRecord.imageUrl != '',
                                      child: EventslListWidget(
                                        key: Key(
                                            'Keyd44_${listViewIndex}_of_${listViewEventsRecordList.length}'),
                                        name: listViewEventsRecord.name,
                                        description: listViewEventsRecord
                                            .shortDescription,
                                        image: listViewEventsRecord.imageUrl,
                                        time: listViewEventsRecord.time,
                                        date: listViewEventsRecord.date,
                                        eventID: listViewEventsRecord,
                                        redHeart: Icon(
                                          FFIcons.kheartfill,
                                          color: Color(0xFFFF0101),
                                          size: 20.0,
                                        ),
                                        heart: Icon(
                                          FFIcons.kheart,
                                          color: Color(0xFF8E8E93),
                                          size: 20.0,
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'eventslListOnPageLoadAnimation5']!),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

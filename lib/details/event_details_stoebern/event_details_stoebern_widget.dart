import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/compenents/kalender_anfrage/kalender_anfrage_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'event_details_stoebern_model.dart';
export 'event_details_stoebern_model.dart';

class EventDetailsStoebernWidget extends StatefulWidget {
  const EventDetailsStoebernWidget({
    super.key,
    String? image,
    String? dateString,
    String? comany,
    String? timeStr,
    String? shortDescription,
    String? longDescription,
    required this.address1,
    required this.zipCode,
    required this.city,
    required this.country,
    this.name,
    this.event,
    this.adresse,
    required this.reHeart,
    required this.heart,
  })  : this.image = image ?? ' ',
        this.dateString = dateString ?? ' ',
        this.comany = comany ?? ' ',
        this.timeStr = timeStr ?? ' ',
        this.shortDescription = shortDescription ?? ' ',
        this.longDescription = longDescription ?? ' ';

  final String image;
  final String dateString;
  final String comany;
  final String timeStr;
  final String shortDescription;
  final String longDescription;
  final String? address1;
  final String? zipCode;
  final String? city;
  final String? country;
  final String? name;
  final EventsRecord? event;
  final String? adresse;
  final Widget? reHeart;
  final Widget? heart;

  @override
  State<EventDetailsStoebernWidget> createState() =>
      _EventDetailsStoebernWidgetState();
}

class _EventDetailsStoebernWidgetState
    extends State<EventDetailsStoebernWidget> {
  late EventDetailsStoebernModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventDetailsStoebernModel());
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
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 80.0,
            decoration: BoxDecoration(
              color: Color(0xFFFAFAFA),
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Text(
                    'Event Details',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .fontStyle,
                          ),
                          fontSize: 17.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .fontStyle,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(80.0, 0.0, 30.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (loggedIn) {
                          if ((currentUserDocument?.favorites.toList() ?? [])
                              .contains(widget.event?.reference.id)) {
                            await currentUserReference!.update({
                              ...mapToFirestore(
                                {
                                  'favorites': FieldValue.arrayRemove(
                                      [widget.event?.reference.id]),
                                },
                              ),
                            });
                            await actions.scheduleEventNotification(
                              widget.name!,
                              widget.shortDescription,
                              widget.timeStr,
                              FFAppState().notificationSwitch,
                              FFAppState().min30 ? 30 : 60,
                              widget.event!.reference.id,
                              false,
                            );
                          } else {
                            await currentUserReference!.update({
                              ...mapToFirestore(
                                {
                                  'favorites': FieldValue.arrayUnion(
                                      [widget.event?.reference.id]),
                                },
                              ),
                            });
                            await actions.scheduleEventNotification(
                              widget.name!,
                              widget.shortDescription,
                              widget.timeStr,
                              FFAppState().notificationSwitch,
                              FFAppState().min30 ? 30 : 60,
                              widget.event!.reference.id,
                              true,
                            );
                          }

                          FFAppState().update(() {});
                          return;
                        } else {
                          if (FFAppState()
                              .favoriteEventIdsGuest
                              .contains(widget.event?.reference.id)) {
                            FFAppState().removeFromFavoriteEventIdsGuest(
                                widget.event!.reference.id);
                            FFAppState().update(() {});
                          } else {
                            FFAppState().addToFavoriteEventIdsGuest(
                                widget.event!.reference.id);
                            FFAppState().update(() {});
                          }

                          FFAppState().update(() {});
                          return;
                        }
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
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
                                0.0, 1.0, 0.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => loggedIn
                                  ? ((currentUserDocument?.favorites
                                                  .toList() ??
                                              [])
                                          .contains(widget.event?.reference.id)
                                      ? widget.reHeart!
                                      : widget.heart!)
                                  : (FFAppState()
                                          .favoriteEventIdsGuest
                                          .contains(widget.event?.reference.id)
                                      ? widget.reHeart!
                                      : widget.heart!),
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
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.network(
                        widget.image,
                        width: double.infinity,
                        height: 260.0,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                          'assets/images/error_image.jpg',
                          width: double.infinity,
                          height: 260.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      widget.name!,
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                            fontSize: 28.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            FFIcons.kcalendar,
                            color: Color(0xFFD12717),
                            size: 16.0,
                          ),
                          Text(
                            functions.formatDateDE(widget.dateString)!,
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  fontSize: 17.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                          ),
                          Icon(
                            FFIcons.kclockfill,
                            color: Color(0xFFD12717),
                            size: 17.0,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 2.0),
                            child: Text(
                              functions.formatTimeFromString(widget.timeStr)!,
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                    color: Color(0xCD57636C),
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                    ),
                    if (widget.event!.onlineBookable ? true : false)
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            FFIcons.kcartfillbadgeplus,
                            color: Color(0xFFD12717),
                            size: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Online buchbar',
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
                                    color: Color(0xFFD12717),
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    if (widget.comany != ''
                        ? true
                        : false)
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            FFIcons.kbuilding2,
                            color: Color(0x9957636C),
                            size: 20.0,
                          ),
                          Text(
                            widget.comany,
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                                  color: Color(0xCD57636C),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
                                ),
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    Builder(
                      builder: (context) => Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.saved =
                                await actions.saveEventAndShowIOSDetails(
                              widget.name!,
                              widget.dateString,
                              widget.timeStr,
                              120,
                              widget.shortDescription,
                              widget.adresse!,
                            );
                            if (_model.saved!) {
                              await showDialog(
                                barrierColor: Color(0x28000000),
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: KalenderAnfrageWidget(),
                                  );
                                },
                              );
                            }

                            safeSetState(() {});
                          },
                          text: 'Zu Kalender hinzufügen',
                          icon: Icon(
                            FFIcons.kcalendarbadgeplus,
                            size: 22.0,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 54.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 3.0, 0.0),
                            iconColor: Colors.white,
                            color: Color(0xFFD12717),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                      child: Text(
                        widget.shortDescription,
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontStyle,
                              ),
                              color: Colors.black,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                              lineHeight: 1.5,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 10.0),
                      child: Text(
                        widget.longDescription,
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontStyle,
                              ),
                              color: Colors.black,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                              lineHeight: 1.5,
                            ),
                      ),
                    ),
                    custom_widgets.AppleMap(
                      width: double.infinity,
                      height: 201.0,
                      address: widget.adresse!,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 264.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 15.0, 19.0),
                              child: Text(
                                'Ähnliche Veranstaltungen',
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                      fontSize: 22.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: StreamBuilder<List<EventsRecord>>(
                                stream: queryEventsRecord(
                                  queryBuilder: (eventsRecord) => eventsRecord
                                      .where(
                                        'date',
                                        isGreaterThanOrEqualTo:
                                            widget.dateString,
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
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<EventsRecord> listViewEventsRecordList =
                                      snapshot.data!;

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: listViewEventsRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewEventsRecord =
                                          listViewEventsRecordList[
                                              listViewIndex];
                                      return Visibility(
                                        visible: (widget.event?.reference.id !=
                                                listViewEventsRecord
                                                    .reference.id) &&
                                            functions.hasCommonCategories(
                                                widget.event?.kategorien,
                                                listViewEventsRecord
                                                    .kategorien) &&
                                            (widget.image != ''),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 12.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                EventDetailsWidget.routeName,
                                                queryParameters: {
                                                  'title': serializeParam(
                                                    listViewEventsRecord.name,
                                                    ParamType.String,
                                                  ),
                                                  'date': serializeParam(
                                                    listViewEventsRecord.date,
                                                    ParamType.String,
                                                  ),
                                                  'time': serializeParam(
                                                    listViewEventsRecord.time,
                                                    ParamType.String,
                                                  ),
                                                  'company': serializeParam(
                                                    listViewEventsRecord
                                                        .company,
                                                    ParamType.String,
                                                  ),
                                                  'shortDes': serializeParam(
                                                    listViewEventsRecord
                                                        .shortDescription,
                                                    ParamType.String,
                                                  ),
                                                  'longDes': serializeParam(
                                                    listViewEventsRecord
                                                        .longDescription,
                                                    ParamType.String,
                                                  ),
                                                  'image': serializeParam(
                                                    listViewEventsRecord
                                                        .imageUrl,
                                                    ParamType.String,
                                                  ),
                                                  'event': serializeParam(
                                                    listViewEventsRecord,
                                                    ParamType.Document,
                                                  ),
                                                  'adresse': serializeParam(
                                                    '${listViewEventsRecord.address1 != '' ? '${listViewEventsRecord.address1}, ' : ' '}${listViewEventsRecord.address1 != '' ? '${listViewEventsRecord.zipCode}, ' : ' '}${listViewEventsRecord.address1 != '' ? '${listViewEventsRecord.city}, ' : ' '}${widget.address1 != null && widget.address1 != '' ? '${listViewEventsRecord.country}' : ' '}',
                                                    ParamType.String,
                                                  ),
                                                  'adresse1': serializeParam(
                                                    listViewEventsRecord
                                                        .address1,
                                                    ParamType.String,
                                                  ),
                                                  'city': serializeParam(
                                                    listViewEventsRecord.city,
                                                    ParamType.String,
                                                  ),
                                                  'country': serializeParam(
                                                    listViewEventsRecord
                                                        .country,
                                                    ParamType.String,
                                                  ),
                                                  'zipCode': serializeParam(
                                                    listViewEventsRecord
                                                        .zipCode,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'event': listViewEventsRecord,
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 180.0,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 7.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      child: Image.network(
                                                        listViewEventsRecord
                                                            .imageUrl,
                                                        width: 180.0,
                                                        height: 120.0,
                                                        fit: BoxFit.cover,
                                                        errorBuilder: (context,
                                                                error,
                                                                stackTrace) =>
                                                            Image.asset(
                                                          'assets/images/error_image.jpg',
                                                          width: 180.0,
                                                          height: 120.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Text(
                                                        listViewEventsRecord
                                                            .name,
                                                        textAlign:
                                                            TextAlign.start,
                                                        maxLines: 2,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      17.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .fontStyle,
                                                                ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      functions.formatDateDE(
                                                          listViewEventsRecord
                                                              .date)!,
                                                      maxLines: 1,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xDD57636C),
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                              ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 5.0),
                                                    child: Text(
                                                      functions
                                                          .formatTimeFromString(
                                                              listViewEventsRecord
                                                                  .time)!,
                                                      maxLines: 1,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xDD57636C),
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                              ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 4.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]
                      .divide(SizedBox(height: 20.0))
                      .addToEnd(SizedBox(height: 90.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

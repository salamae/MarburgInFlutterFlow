import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'eventsl_list_model.dart';
export 'eventsl_list_model.dart';

class EventslListWidget extends StatefulWidget {
  const EventslListWidget({
    super.key,
    this.name,
    this.description,
    this.time,
    this.date,
    this.image,
    required this.redHeart,
    required this.heart,
    this.eventID,
  });

  final String? name;
  final String? description;
  final String? time;
  final String? date;
  final String? image;
  final Widget? redHeart;
  final Widget? heart;
  final EventsRecord? eventID;

  @override
  State<EventslListWidget> createState() => _EventslListWidgetState();
}

class _EventslListWidgetState extends State<EventslListWidget> {
  late EventslListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventslListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          if (Navigator.of(context).canPop()) {
            context.pop();
          }
          context.pushNamed(
            EventDetailsWidget.routeName,
            queryParameters: {
              'title': serializeParam(
                widget.eventID?.name,
                ParamType.String,
              ),
              'date': serializeParam(
                widget.eventID?.date,
                ParamType.String,
              ),
              'time': serializeParam(
                widget.eventID?.time,
                ParamType.String,
              ),
              'company': serializeParam(
                widget.eventID?.company,
                ParamType.String,
              ),
              'shortDes': serializeParam(
                widget.eventID?.shortDescription,
                ParamType.String,
              ),
              'longDes': serializeParam(
                widget.eventID?.longDescription,
                ParamType.String,
              ),
              'image': serializeParam(
                widget.eventID?.imageUrl,
                ParamType.String,
              ),
              'event': serializeParam(
                widget.eventID,
                ParamType.Document,
              ),
              'adresse': serializeParam(
                '${widget.eventID?.address1 != null && widget.eventID?.address1 != '' ? '${widget.eventID?.address1}, ' : ' '}${widget.eventID?.address1 != null && widget.eventID?.address1 != '' ? '${widget.eventID?.zipCode}, ' : ' '}${widget.eventID?.address1 != null && widget.eventID?.address1 != '' ? '${widget.eventID?.city}, ' : ' '}${widget.eventID?.address1 != null && widget.eventID?.address1 != '' ? '${widget.eventID?.country}' : ' '}',
                ParamType.String,
              ),
              'adresse1': serializeParam(
                widget.eventID?.address1,
                ParamType.String,
              ),
              'city': serializeParam(
                widget.eventID?.city,
                ParamType.String,
              ),
              'country': serializeParam(
                widget.eventID?.country,
                ParamType.String,
              ),
              'zipCode': serializeParam(
                widget.eventID?.zipCode,
                ParamType.String,
              ),
            }.withoutNulls,
            extra: <String, dynamic>{
              'event': widget.eventID,
            },
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFAFAFA),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 21.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    widget.image!,
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      'assets/images/error_image.jpg',
                      width: 80.0,
                      height: 80.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                width: 267.4,
                height: 100.0,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                6.0, 0.0, 0.0, 0.0),
                            child: Text(
                              widget.name != null && widget.name != ''
                                  ? widget.name!
                                  : ' ',
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .fontStyle,
                                    ),
                                    color: Color(0xDE000000),
                                    fontSize: 17.0,
                                    letterSpacing: 0.1,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              53.0, 0.0, 0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (loggedIn) {
                                  if ((currentUserDocument?.favorites
                                              .toList() ??
                                          [])
                                      .contains(
                                          widget.eventID?.reference.id)) {
                                    await currentUserReference!.update({
                                      ...mapToFirestore(
                                        {
                                          'favorites': FieldValue.arrayRemove(
                                              [widget.eventID?.reference.id]),
                                        },
                                      ),
                                    });
                                    await actions.scheduleEventNotification(
                                      widget.name!,
                                      widget.description!,
                                      widget.time!,
                                      FFAppState().notificationSwitch,
                                      FFAppState().min30 ? 30 : 60,
                                      widget.eventID!.reference.id,
                                      false,
                                    );
                                  } else {
                                    await currentUserReference!.update({
                                      ...mapToFirestore(
                                        {
                                          'favorites': FieldValue.arrayUnion(
                                              [widget.eventID?.reference.id]),
                                        },
                                      ),
                                    });
                                    await actions.scheduleEventNotification(
                                      widget.name!,
                                      widget.description!,
                                      widget.time!,
                                      FFAppState().notificationSwitch,
                                      FFAppState().min30 ? 30 : 60,
                                      widget.eventID!.reference.id,
                                      true,
                                    );
                                  }

                                  FFAppState().update(() {});
                                  return;
                                } else {
                                  if (FFAppState()
                                      .favoriteEventIdsGuest
                                      .contains(
                                          widget.eventID?.reference.id)) {
                                    FFAppState()
                                        .removeFromFavoriteEventIdsGuest(
                                            widget.eventID!.reference.id);
                                    FFAppState().update(() {});
                                  } else {
                                    FFAppState().addToFavoriteEventIdsGuest(
                                        widget.eventID!.reference.id);
                                    FFAppState().update(() {});
                                  }

                                  FFAppState().update(() {});
                                  return;
                                }
                              },
                              child: loggedIn
                                  ? ((currentUserDocument?.favorites
                                                  .toList() ??
                                              [])
                                          .contains(
                                              widget.eventID?.reference.id)
                                      ? widget.redHeart!
                                      : widget.heart!)
                                  : (FFAppState()
                                          .favoriteEventIdsGuest
                                          .contains(
                                              widget.eventID?.reference.id)
                                      ? widget.redHeart!
                                      : widget.heart!),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                6.0, 0.0, 69.0, 0.0),
                            child: Text(
                              widget.description != null &&
                                      widget.description != ''
                                  ? widget.description!
                                  : ' ',
                              maxLines: 2,
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
                                    color: Color(0x9A3C3C43),
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                    lineHeight: 1.4,
                                  ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              6.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (widget.date != null && widget.date != '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 2.0, 0.0),
                                  child: Icon(
                                    FFIcons.kcalendar,
                                    color: Color(0xFFD12717),
                                    size: 12.0,
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  widget.date != null && widget.date != ''
                                      ? functions.formatDateDE(widget.date!)!
                                      : ' ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                        ),
                                        color: Color(0x9A3C3C43),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    6.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  widget.time != null && widget.time != ''
                                      ? functions
                                          .formatTimeFromString(widget.time!)!
                                      : ' ',
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
                                        color: Color(0x9A3C3C43),
                                        fontSize: 12.0,
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
                            ].divide(SizedBox(width: 4.0)),
                          ),
                        ),
                      ].divide(SizedBox(height: 5.0)),
                    ),
                  ],
                ),
              ),
            ].divide(SizedBox(width: 12.0)),
          ),
        ),
      ),
    );
  }
}

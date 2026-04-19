import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'event_list_fav_model.dart';
export 'event_list_fav_model.dart';

class EventListFavWidget extends StatefulWidget {
  const EventListFavWidget({
    super.key,
    this.name,
    this.description,
    this.image,
    this.id,
    this.date,
    this.time,
  });

  final String? name;
  final String? description;
  final String? image;
  final EventsRecord? id;
  final String? date;
  final String? time;

  @override
  State<EventListFavWidget> createState() => _EventListFavWidgetState();
}

class _EventListFavWidgetState extends State<EventListFavWidget> {
  late EventListFavModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventListFavModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
              widget.id?.name,
              ParamType.String,
            ),
            'date': serializeParam(
              widget.id?.date,
              ParamType.String,
            ),
            'time': serializeParam(
              widget.id?.time,
              ParamType.String,
            ),
            'company': serializeParam(
              widget.id?.company,
              ParamType.String,
            ),
            'shortDes': serializeParam(
              widget.id?.shortDescription,
              ParamType.String,
            ),
            'longDes': serializeParam(
              widget.id?.longDescription,
              ParamType.String,
            ),
            'image': serializeParam(
              widget.id?.imageUrl,
              ParamType.String,
            ),
            'event': serializeParam(
              widget.id,
              ParamType.Document,
            ),
            'adresse': serializeParam(
              '${widget.id?.address1 != null && widget.id?.address1 != '' ? '${widget.id?.address1}, ' : ' '}${widget.id?.address1 != null && widget.id?.address1 != '' ? '${widget.id?.zipCode}, ' : ' '}${widget.id?.address1 != null && widget.id?.address1 != '' ? '${widget.id?.city}, ' : ' '}${widget.id?.address1 != null && widget.id?.address1 != '' ? '${widget.id?.country}' : ' '}',
              ParamType.String,
            ),
            'adresse1': serializeParam(
              widget.id?.address1,
              ParamType.String,
            ),
            'city': serializeParam(
              widget.id?.city,
              ParamType.String,
            ),
            'country': serializeParam(
              widget.id?.country,
              ParamType.String,
            ),
            'zipCode': serializeParam(
              widget.id?.zipCode,
              ParamType.String,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            'event': widget.id,
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFAFAFA),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
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
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
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
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Text(
                                widget.name!,
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
                                      fontSize: 16.5,
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
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: Text(
                            widget.description!,
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
                                  color: Color(0xC057636C),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                  lineHeight: 1.5,
                                ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Row(
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
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                    color: Color(0xC057636C),
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
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xC057636C),
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
                    ].divide(SizedBox(height: 3.0)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 5.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (loggedIn) {
                      await currentUserReference!.update({
                        ...mapToFirestore(
                          {
                            'favorites': FieldValue.arrayRemove(
                                [widget.id?.reference.id]),
                          },
                        ),
                      });
                    } else {
                      FFAppState().removeFromFavoriteEventIdsGuest(
                          widget.id!.reference.id);
                      FFAppState().update(() {});
                    }

                    FFAppState().update(() {});
                  },
                  child: Icon(
                    FFIcons.kheartfill,
                    color: Color(0xFFFF0101),
                    size: 20.0,
                  ),
                ),
              ),
            ].divide(SizedBox(width: 12.0)),
          ),
        ),
      ),
    );
  }
}

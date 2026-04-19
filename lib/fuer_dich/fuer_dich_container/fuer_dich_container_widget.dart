import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'fuer_dich_container_model.dart';
export 'fuer_dich_container_model.dart';

class FuerDichContainerWidget extends StatefulWidget {
  const FuerDichContainerWidget({
    super.key,
    this.image,
    this.name,
    this.company,
    this.time,
    this.description,
    required this.eventID,
    required this.redHeart,
    required this.heart,
  });

  final String? image;
  final String? name;
  final String? company;
  final String? time;
  final String? description;
  final EventsRecord? eventID;
  final Widget? redHeart;
  final Widget? heart;

  @override
  State<FuerDichContainerWidget> createState() =>
      _FuerDichContainerWidgetState();
}

class _FuerDichContainerWidgetState extends State<FuerDichContainerWidget> {
  late FuerDichContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FuerDichContainerModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
      child: Container(
        width: 280.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 7.0),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    child: Image.network(
                      widget.image!,
                      width: 489.4,
                      height: 150.0,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/images/error_image.jpg',
                        width: 489.4,
                        height: 150.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 16.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (loggedIn) {
                            if ((currentUserDocument?.favorites.toList() ?? [])
                                .contains(widget.eventID?.reference.id)) {
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
                                .contains(widget.eventID?.reference.id)) {
                              FFAppState().removeFromFavoriteEventIdsGuest(
                                  widget.eventID!.reference.id);
                              FFAppState().update(() {});
                            } else {
                              FFAppState().addToFavoriteEventIdsGuest(
                                  widget.eventID!.reference.id);
                              FFAppState().update(() {});
                            }

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
                              color: Color(0x56030000),
                              borderRadius: BorderRadius.circular(24.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: AuthUserStreamWidget(
                              builder: (context) => loggedIn
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 15.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: Text(
                            widget.name != null && widget.name != ''
                                ? widget.name!
                                : '',
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      color: Color(0xDE000000),
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Text(
                        widget.time != null && widget.time != ''
                            ? functions.formatTimeFromString(widget.time!)!
                            : ' ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: Color(0xFFD12717),
                              fontSize: 15.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ],
                  ),
                  Text(
                    widget.description != null && widget.description != ''
                        ? widget.description!
                        : ' ',
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontStyle,
                          ),
                          color: Color(0x993C3C43),
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          fontWeight:
                              FlutterFlowTheme.of(context).bodySmall.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodySmall.fontStyle,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (widget.company != null && widget.company != ''
                      ? true
                      : false)
                    Stack(
                      children: [
                        Icon(
                          FFIcons.kbuilding2,
                          color: Color(0x993C3C43),
                          size: 14.0,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              18.0, 0.0, 0.0, 0.0),
                          child: Text(
                            widget.company != null && widget.company != ''
                                ? widget.company!
                                : ' ',
                            maxLines: 1,
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                      color: Color(0x993C3C43),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                ].divide(SizedBox(height: 4.0)),
              ),
            ),
          ].divide(SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}

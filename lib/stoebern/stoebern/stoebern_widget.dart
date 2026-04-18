import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/details/event_details_stoebern/event_details_stoebern_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'stoebern_model.dart';
export 'stoebern_model.dart';

class StoebernWidget extends StatefulWidget {
  const StoebernWidget({
    super.key,
    required this.heart,
    required this.heartfill,
  });

  final Widget? heart;
  final Widget? heartfill;

  @override
  State<StoebernWidget> createState() => _StoebernWidgetState();
}

class _StoebernWidgetState extends State<StoebernWidget> {
  late StoebernModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoebernModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.eventsAll = await queryEventsRecordOnce();
      _model.allEvents = _model.eventsAll!.toList().cast<EventsRecord>();
      safeSetState(() {});
      _model.schufledEvents = await actions.shuffleEvent(
        _model.allEvents.toList(),
      );
      _model.shuffledEvents =
          _model.schufledEvents!.toList().cast<EventsRecord>();
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
    context.watch<FFAppState>();

    return Builder(
      builder: (context) {
        final stoebernEvents = _model.shuffledEvents
            .where((e) => e.hasImageUrl())
            .toList()
            .take(50)
            .toList();

        return Container(
          width: double.infinity,
          height: double.infinity,
          child: CarouselSlider.builder(
            itemCount: stoebernEvents.length,
            itemBuilder: (context, stoebernEventsIndex, _) {
              final stoebernEventsItem = stoebernEvents[stoebernEventsIndex];
              return Visibility(
                visible: stoebernEventsItem.imageUrl != '',
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Color(0x00FFFFFF),
                      barrierColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: Container(
                            height: 810.0,
                            child: EventDetailsStoebernWidget(
                              dateString: stoebernEventsItem.date,
                              timeStr: stoebernEventsItem.time,
                              address1: stoebernEventsItem.address1,
                              zipCode: stoebernEventsItem.zipCode,
                              city: stoebernEventsItem.city,
                              country: stoebernEventsItem.country,
                              image: stoebernEventsItem.imageUrl,
                              comany: stoebernEventsItem.company,
                              shortDescription:
                                  stoebernEventsItem.shortDescription,
                              longDescription:
                                  stoebernEventsItem.longDescription,
                              name: stoebernEventsItem.name,
                              event: stoebernEventsItem,
                              adresse:
                                  '${stoebernEventsItem.address1 != '' ? '${stoebernEventsItem.address1}, ' : ' '}${stoebernEventsItem.address1 != '' ? '${stoebernEventsItem.zipCode}, ' : ' '}${stoebernEventsItem.address1 != '' ? '${stoebernEventsItem.city}, ' : ' '}${stoebernEventsItem.address1 != '' ? '${stoebernEventsItem.country}' : ' '}',
                              reHeart: Icon(
                                FFIcons.kheartfill,
                                color: Color(0xFFD12717),
                                size: 25.0,
                              ),
                              heart: Icon(
                                FFIcons.kheart,
                                size: 25.0,
                              ),
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  onDoubleTap: () async {
                    if (!loggedIn) {
                      if (!FFAppState()
                          .favoriteEventIdsGuest
                          .contains(stoebernEventsItem.reference.id)) {
                        FFAppState().addToFavoriteEventIdsGuest(
                            stoebernEventsItem.reference.id);
                        FFAppState().update(() {});
                      } else {
                        FFAppState().removeFromFavoriteEventIdsGuest(
                            stoebernEventsItem.reference.id);
                        FFAppState().update(() {});
                      }

                      return;
                    } else {
                      if (!(currentUserDocument?.favorites.toList() ?? [])
                          .contains(stoebernEventsItem.reference.id)) {
                        await currentUserReference!.update({
                          ...mapToFirestore(
                            {
                              'favorites': FieldValue.arrayUnion(
                                  [stoebernEventsItem.reference.id]),
                            },
                          ),
                        });
                        await actions.scheduleEventNotification(
                          stoebernEventsItem.name,
                          stoebernEventsItem.shortDescription,
                          stoebernEventsItem.time,
                          FFAppState().notificationSwitch,
                          FFAppState().min30 ? 30 : 60,
                          stoebernEventsItem.reference.id,
                          true,
                        );
                      } else {
                        await currentUserReference!.update({
                          ...mapToFirestore(
                            {
                              'favorites': FieldValue.arrayRemove(
                                  [stoebernEventsItem.reference.id]),
                            },
                          ),
                        });
                        await actions.scheduleEventNotification(
                          stoebernEventsItem.name,
                          stoebernEventsItem.shortDescription,
                          stoebernEventsItem.time,
                          FFAppState().notificationSwitch,
                          FFAppState().min30 ? 30 : 60,
                          stoebernEventsItem.reference.id,
                          false,
                        );
                      }

                      FFAppState().update(() {});
                      return;
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        Image.network(
                          stoebernEventsItem.imageUrl,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                            'assets/images/error_image.jpg',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xD8000000),
                                Color(0x32000000),
                                Color(0xD8000000)
                              ],
                              stops: [0.0, 0.5, 1.0],
                              begin: AlignmentDirectional(0.0, -1.0),
                              end: AlignmentDirectional(0, 1.0),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 40.0, 30.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (!loggedIn) {
                                        if (!FFAppState()
                                            .favoriteEventIdsGuest
                                            .contains(stoebernEventsItem
                                                .reference.id)) {
                                          FFAppState()
                                              .addToFavoriteEventIdsGuest(
                                                  stoebernEventsItem
                                                      .reference.id);
                                          FFAppState().update(() {});
                                        } else {
                                          FFAppState()
                                              .removeFromFavoriteEventIdsGuest(
                                                  stoebernEventsItem
                                                      .reference.id);
                                          FFAppState().update(() {});
                                        }

                                        return;
                                      } else {
                                        if (!(currentUserDocument?.favorites
                                                    .toList() ??
                                                [])
                                            .contains(stoebernEventsItem
                                                .reference.id)) {
                                          await currentUserReference!.update({
                                            ...mapToFirestore(
                                              {
                                                'favorites':
                                                    FieldValue.arrayUnion([
                                                  stoebernEventsItem
                                                      .reference.id
                                                ]),
                                              },
                                            ),
                                          });
                                          await actions
                                              .scheduleEventNotification(
                                            stoebernEventsItem.name,
                                            stoebernEventsItem.shortDescription,
                                            stoebernEventsItem.time,
                                            FFAppState().notificationSwitch,
                                            FFAppState().min30 ? 30 : 60,
                                            stoebernEventsItem.reference.id,
                                            true,
                                          );
                                        } else {
                                          await currentUserReference!.update({
                                            ...mapToFirestore(
                                              {
                                                'favorites':
                                                    FieldValue.arrayRemove([
                                                  stoebernEventsItem
                                                      .reference.id
                                                ]),
                                              },
                                            ),
                                          });
                                          await actions
                                              .scheduleEventNotification(
                                            stoebernEventsItem.name,
                                            stoebernEventsItem.shortDescription,
                                            stoebernEventsItem.time,
                                            FFAppState().notificationSwitch,
                                            FFAppState().min30 ? 30 : 60,
                                            stoebernEventsItem.reference.id,
                                            false,
                                          );
                                        }

                                        FFAppState().update(() {});
                                        return;
                                      }
                                    },
                                    onDoubleTap: () async {
                                      if (!loggedIn) {
                                        if (!FFAppState()
                                            .favoriteEventIdsGuest
                                            .contains(stoebernEventsItem
                                                .reference.id)) {
                                          FFAppState()
                                              .addToFavoriteEventIdsGuest(
                                                  stoebernEventsItem
                                                      .reference.id);
                                          FFAppState().update(() {});
                                        } else {
                                          FFAppState()
                                              .removeFromFavoriteEventIdsGuest(
                                                  stoebernEventsItem
                                                      .reference.id);
                                          FFAppState().update(() {});
                                        }

                                        return;
                                      } else {
                                        if (!(currentUserDocument?.favorites
                                                    .toList() ??
                                                [])
                                            .contains(stoebernEventsItem
                                                .reference.id)) {
                                          await currentUserReference!.update({
                                            ...mapToFirestore(
                                              {
                                                'favorites':
                                                    FieldValue.arrayUnion([
                                                  stoebernEventsItem
                                                      .reference.id
                                                ]),
                                              },
                                            ),
                                          });
                                          await actions
                                              .scheduleEventNotification(
                                            stoebernEventsItem.name,
                                            stoebernEventsItem.shortDescription,
                                            stoebernEventsItem.time,
                                            FFAppState().notificationSwitch,
                                            FFAppState().min30 ? 30 : 60,
                                            stoebernEventsItem.reference.id,
                                            true,
                                          );
                                        } else {
                                          await currentUserReference!.update({
                                            ...mapToFirestore(
                                              {
                                                'favorites':
                                                    FieldValue.arrayRemove([
                                                  stoebernEventsItem
                                                      .reference.id
                                                ]),
                                              },
                                            ),
                                          });
                                          await actions
                                              .scheduleEventNotification(
                                            stoebernEventsItem.name,
                                            stoebernEventsItem.shortDescription,
                                            stoebernEventsItem.time,
                                            FFAppState().notificationSwitch,
                                            FFAppState().min30 ? 30 : 60,
                                            stoebernEventsItem.reference.id,
                                            false,
                                          );
                                        }

                                        FFAppState().update(() {});
                                        return;
                                      }
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 2.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      child: Container(
                                        width: 50.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x79000000),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 1.0, 0.0, 0.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) => loggedIn
                                                ? ((currentUserDocument
                                                                ?.favorites
                                                                .toList() ??
                                                            [])
                                                        .contains(
                                                            stoebernEventsItem
                                                                .reference.id)
                                                    ? widget.heartfill!
                                                    : widget.heart!)
                                                : (FFAppState()
                                                        .favoriteEventIdsGuest
                                                        .contains(
                                                            stoebernEventsItem
                                                                .reference.id)
                                                    ? widget.heartfill!
                                                    : widget.heart!),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 0.0, 25.0, 100.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        functions.stoebernDate(
                                            stoebernEventsItem.date)!,
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.interTight(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xD9FFFFFF),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 1.0, 0.0, 0.0),
                                        child: AutoSizeText(
                                          stoebernEventsItem.name,
                                          maxLines: 2,
                                          minFontSize: 23.0,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                font: GoogleFonts.interTight(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontStyle,
                                                ),
                                                color: Colors.white,
                                                fontSize: 30.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .fontStyle,
                                                lineHeight: 1.1,
                                              ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        stoebernEventsItem.shortDescription,
                                        maxLines: 3,
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
                                              color: Color(0xCBFFFFFF),
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
                                              lineHeight: 1.3,
                                            ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            if (stoebernEventsItem.time != '')
                                              Icon(
                                                FFIcons.kclock,
                                                color: Color(0xDAFFFFFF),
                                                size: 14.0,
                                              ),
                                            Text(
                                              functions.formatTimeFromString(
                                                  stoebernEventsItem.time)!,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.interTight(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xD9FFFFFF),
                                                    fontSize: 13.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                            if (stoebernEventsItem.address1 !=
                                                    '')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Icon(
                                                  FFIcons.kmappinandellipse,
                                                  color: Color(0xD9FFFFFF),
                                                  size: 16.0,
                                                ),
                                              ),
                                            Text(
                                              stoebernEventsItem.address1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.interTight(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xD9FFFFFF),
                                                    fontSize: 13.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            carouselController: _model.carouselController ??=
                CarouselSliderController(),
            options: CarouselOptions(
              initialPage: max(0, min(0, stoebernEvents.length - 1)),
              viewportFraction: 0.83,
              disableCenter: true,
              enlargeCenterPage: false,
              enlargeFactor: 0.0,
              enableInfiniteScroll: false,
              scrollDirection: Axis.vertical,
              autoPlay: false,
              onPageChanged: (index, _) => _model.carouselCurrentIndex = index,
            ),
          ),
        );
      },
    );
  }
}

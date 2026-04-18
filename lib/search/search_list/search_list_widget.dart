import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_list_model.dart';
export 'search_list_model.dart';

class SearchListWidget extends StatefulWidget {
  const SearchListWidget({
    super.key,
    this.image,
    this.name,
    this.description,
    this.kategorien,
    this.adresse,
    this.idGastro,
    this.idPark,
    this.idShoppen,
    this.idAktivity,
    this.idBuchen,
    required this.fillHeart,
    required this.heart,
    this.preis,
  });

  final String? image;
  final String? name;
  final String? description;
  final String? kategorien;
  final String? adresse;
  final GastroRecord? idGastro;
  final ParkRecord? idPark;
  final ShoppingRecord? idShoppen;
  final FreizeitRecord? idAktivity;
  final BuchenRecord? idBuchen;
  final Widget? fillHeart;
  final Widget? heart;
  final String? preis;

  @override
  State<SearchListWidget> createState() => _SearchListWidgetState();
}

class _SearchListWidgetState extends State<SearchListWidget> {
  late SearchListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchListModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 18.0, 11.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          if (widget.idGastro != null) {
            context.pushNamed(
              DetailsWidget.routeName,
              queryParameters: {
                'name': serializeParam(
                  widget.idGastro?.name,
                  ParamType.String,
                ),
                'tag': serializeParam(
                  widget.idGastro?.kategorien,
                  ParamType.String,
                ),
                'longDes': serializeParam(
                  widget.idGastro?.longDescription,
                  ParamType.String,
                ),
                'image': serializeParam(
                  widget.idGastro?.imageUrl,
                  ParamType.String,
                ),
                'openTimesFrom': serializeParam(
                  widget.idGastro?.oeffnungszeiten
                      .map((e) => e.timeFrom)
                      .toList(),
                  ParamType.String,
                  isList: true,
                ),
                'openTimeTo': serializeParam(
                  widget.idGastro?.oeffnungszeiten
                      .map((e) => e.timeTo)
                      .toList(),
                  ParamType.String,
                  isList: true,
                ),
                'adresse1': serializeParam(
                  widget.idGastro?.address1,
                  ParamType.String,
                ),
                'city': serializeParam(
                  widget.idGastro?.city,
                  ParamType.String,
                ),
                'country': serializeParam(
                  widget.idGastro?.country,
                  ParamType.String,
                ),
                'zip': serializeParam(
                  widget.idGastro?.zipCode,
                  ParamType.String,
                ),
                'idGastro': serializeParam(
                  widget.idGastro,
                  ParamType.Document,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                'idGastro': widget.idGastro,
              },
            );

            return;
          } else {
            if (widget.idPark != null) {
              context.pushNamed(
                DetailsWidget.routeName,
                queryParameters: {
                  'name': serializeParam(
                    widget.idPark?.name,
                    ParamType.String,
                  ),
                  'tag': serializeParam(
                    widget.idPark?.kategorien,
                    ParamType.String,
                  ),
                  'longDes': serializeParam(
                    widget.idPark?.longDescription,
                    ParamType.String,
                  ),
                  'image': serializeParam(
                    widget.idPark?.imageUrl,
                    ParamType.String,
                  ),
                  'openTimesFrom': serializeParam(
                    widget.idPark?.oeffnungszeiten
                        .map((e) => e.timeFrom)
                        .toList(),
                    ParamType.String,
                    isList: true,
                  ),
                  'openTimeTo': serializeParam(
                    widget.idPark?.oeffnungszeiten
                        .map((e) => e.timeTo)
                        .toList(),
                    ParamType.String,
                    isList: true,
                  ),
                  'adresse1': serializeParam(
                    widget.idPark?.address1,
                    ParamType.String,
                  ),
                  'city': serializeParam(
                    widget.idPark?.city,
                    ParamType.String,
                  ),
                  'country': serializeParam(
                    widget.idPark?.country,
                    ParamType.String,
                  ),
                  'zip': serializeParam(
                    widget.idPark?.zipCode,
                    ParamType.String,
                  ),
                  'idPark': serializeParam(
                    widget.idPark,
                    ParamType.Document,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  'idPark': widget.idPark,
                },
              );

              return;
            } else {
              if (widget.idShoppen != null) {
                context.pushNamed(
                  DetailsWidget.routeName,
                  queryParameters: {
                    'name': serializeParam(
                      widget.idShoppen?.name,
                      ParamType.String,
                    ),
                    'tag': serializeParam(
                      widget.idShoppen?.kategorien,
                      ParamType.String,
                    ),
                    'longDes': serializeParam(
                      widget.idShoppen?.longDescription,
                      ParamType.String,
                    ),
                    'image': serializeParam(
                      widget.idShoppen?.imageUrl,
                      ParamType.String,
                    ),
                    'openTimesFrom': serializeParam(
                      widget.idShoppen?.oeffnungszeiten
                          .map((e) => e.timeFrom)
                          .toList(),
                      ParamType.String,
                      isList: true,
                    ),
                    'openTimeTo': serializeParam(
                      widget.idShoppen?.oeffnungszeiten
                          .map((e) => e.timeTo)
                          .toList(),
                      ParamType.String,
                      isList: true,
                    ),
                    'adresse1': serializeParam(
                      widget.idShoppen?.address1,
                      ParamType.String,
                    ),
                    'city': serializeParam(
                      widget.idShoppen?.city,
                      ParamType.String,
                    ),
                    'country': serializeParam(
                      widget.idShoppen?.country,
                      ParamType.String,
                    ),
                    'zip': serializeParam(
                      widget.idShoppen?.zipCode,
                      ParamType.String,
                    ),
                    'price': serializeParam(
                      widget.idShoppen?.preisInformation,
                      ParamType.String,
                    ),
                    'idShoppping': serializeParam(
                      widget.idShoppen,
                      ParamType.Document,
                    ),
                  }.withoutNulls,
                  extra: <String, dynamic>{
                    'idShoppping': widget.idShoppen,
                  },
                );

                return;
              } else {
                if (widget.idAktivity != null) {
                  context.pushNamed(
                    DetailsWidget.routeName,
                    queryParameters: {
                      'name': serializeParam(
                        widget.idAktivity?.name,
                        ParamType.String,
                      ),
                      'tag': serializeParam(
                        widget.idAktivity?.kategorien,
                        ParamType.String,
                      ),
                      'longDes': serializeParam(
                        widget.idAktivity?.longDescription,
                        ParamType.String,
                      ),
                      'image': serializeParam(
                        widget.idAktivity?.imageUrl,
                        ParamType.String,
                      ),
                      'openTimesFrom': serializeParam(
                        widget.idAktivity?.oeffnungszeiten
                            .map((e) => e.timeFrom)
                            .toList(),
                        ParamType.String,
                        isList: true,
                      ),
                      'openTimeTo': serializeParam(
                        widget.idAktivity?.oeffnungszeiten
                            .map((e) => e.timeTo)
                            .toList(),
                        ParamType.String,
                        isList: true,
                      ),
                      'adresse1': serializeParam(
                        widget.idAktivity?.address1,
                        ParamType.String,
                      ),
                      'city': serializeParam(
                        widget.idAktivity?.city,
                        ParamType.String,
                      ),
                      'country': serializeParam(
                        widget.idAktivity?.country,
                        ParamType.String,
                      ),
                      'zip': serializeParam(
                        widget.idAktivity?.zipCode,
                        ParamType.String,
                      ),
                      'email': serializeParam(
                        widget.idAktivity?.email,
                        ParamType.String,
                      ),
                      'website': serializeParam(
                        widget.idAktivity?.websiteUrl,
                        ParamType.String,
                      ),
                      'price': serializeParam(
                        widget.idAktivity?.preisInformation,
                        ParamType.String,
                      ),
                      'idFreizeit': serializeParam(
                        widget.idAktivity,
                        ParamType.Document,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      'idFreizeit': widget.idAktivity,
                    },
                  );

                  return;
                } else {
                  if (widget.idBuchen != null) {
                    context.pushNamed(
                      DetailsWidget.routeName,
                      queryParameters: {
                        'name': serializeParam(
                          widget.idBuchen?.name,
                          ParamType.String,
                        ),
                        'longDes': serializeParam(
                          widget.idBuchen?.beschreibung,
                          ParamType.String,
                        ),
                        'image': serializeParam(
                          widget.idBuchen?.bildURL,
                          ParamType.String,
                        ),
                        'adresse1': serializeParam(
                          widget.idBuchen?.strasse,
                          ParamType.String,
                        ),
                        'city': serializeParam(
                          widget.idBuchen?.stadt,
                          ParamType.String,
                        ),
                        'country': serializeParam(
                          widget.idBuchen?.land,
                          ParamType.String,
                        ),
                        'zip': serializeParam(
                          widget.idBuchen?.laendercode,
                          ParamType.String,
                        ),
                        'website': serializeParam(
                          widget.idBuchen?.pageURL,
                          ParamType.String,
                        ),
                        'price': serializeParam(
                          widget.idBuchen?.preis,
                          ParamType.String,
                        ),
                        'idBuchen': serializeParam(
                          widget.idBuchen,
                          ParamType.Document,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'idBuchen': widget.idBuchen,
                      },
                    );

                    return;
                  } else {
                    return;
                  }
                }
              }
            }
          }
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
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
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      5.0,
                      valueOrDefault<double>(
                        (widget.idBuchen != null) &&
                                (widget.preis == null || widget.preis == '')
                            ? 0.0
                            : 16.0,
                        0.0,
                      ),
                      20.0,
                      0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                widget.name!,
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                      font: GoogleFonts.interTight(
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
                          ],
                        ),
                      ),
                      if ((widget.idBuchen != null) &&
                          (widget.preis != null && widget.preis != ''))
                        Text(
                          widget.preis!,
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: Color(0xFFD12717),
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                        ),
                      Text(
                        functions.htmlToText(widget.description!),
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.interTight(
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
                              lineHeight: 1.4,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      if ((widget.idGastro != null) ||
                              (widget.idPark != null) ||
                              (widget.idShoppen != null) ||
                              (widget.idAktivity != null)
                          ? true
                          : false)
                        Text(
                          widget.kategorien!,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFFD32F20),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (widget.adresse != null && widget.adresse != '')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 5.0, 0.0),
                              child: Icon(
                                FFIcons.kmappinandellipse,
                                color: Color(0xC057636C),
                                size: 15.0,
                              ),
                            ),
                          Flexible(
                            child: Text(
                              widget.adresse!,
                              textAlign: TextAlign.start,
                              maxLines: 1,
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
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 7.0)),
                  ),
                ),
              ),
              if (loggedIn &&
                  !(widget.idBuchen != null) &&
                  !(widget.idAktivity != null))
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 67.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (loggedIn) {
                          if (widget.idGastro != null) {
                            if ((currentUserDocument?.favoriteGastro
                                        .toList() ??
                                    [])
                                .contains(widget.idGastro?.reference.id)) {
                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'favoriteGastro': FieldValue.arrayRemove(
                                        [widget.idGastro?.reference.id]),
                                  },
                                ),
                              });
                            } else {
                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'favoriteGastro': FieldValue.arrayUnion(
                                        [widget.idGastro?.reference.id]),
                                  },
                                ),
                              });
                            }

                            FFAppState().update(() {});
                            return;
                          } else {
                            if (widget.idShoppen != null) {
                              if ((currentUserDocument?.favoriteShopping
                                          .toList() ??
                                      [])
                                  .contains(widget.idShoppen?.reference.id)) {
                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'favoriteShopping':
                                          FieldValue.arrayRemove([
                                        widget.idShoppen?.reference.id
                                      ]),
                                    },
                                  ),
                                });
                              } else {
                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'favoriteShopping': FieldValue.arrayUnion(
                                          [widget.idShoppen?.reference.id]),
                                    },
                                  ),
                                });
                              }

                              FFAppState().update(() {});
                              return;
                            } else {
                              if (widget.idPark != null) {
                                if ((currentUserDocument?.favoriteParks
                                            .toList() ??
                                        [])
                                    .contains(widget.idPark?.reference.id)) {
                                  await currentUserReference!.update({
                                    ...mapToFirestore(
                                      {
                                        'favoriteParks': FieldValue.arrayRemove(
                                            [widget.idPark?.reference.id]),
                                      },
                                    ),
                                  });
                                } else {
                                  await currentUserReference!.update({
                                    ...mapToFirestore(
                                      {
                                        'favoriteParks': FieldValue.arrayUnion(
                                            [widget.idPark?.reference.id]),
                                      },
                                    ),
                                  });
                                }

                                FFAppState().update(() {});
                                return;
                              } else {
                                return;
                              }
                            }
                          }
                        } else {
                          return;
                        }
                      },
                      child: loggedIn
                          ? () {
                              if ((currentUserDocument?.favoriteGastro
                                          .toList() ??
                                      [])
                                  .contains(widget.idGastro?.reference.id)) {
                                return widget.fillHeart!;
                              } else if ((currentUserDocument?.favoriteParks
                                          .toList() ??
                                      [])
                                  .contains(widget.idPark?.reference.id)) {
                                return widget.fillHeart!;
                              } else if ((currentUserDocument?.favoriteShopping
                                          .toList() ??
                                      [])
                                  .contains(widget.idShoppen?.reference.id)) {
                                return widget.fillHeart!;
                              } else {
                                return widget.heart!;
                              }
                            }()
                          : () {
                              if (FFAppState()
                                  .favoriteEventIdsGuest
                                  .contains(widget.idGastro?.reference.id)) {
                                return widget.fillHeart!;
                              } else if (FFAppState()
                                  .favoriteEventIdsGuest
                                  .contains(widget.idPark?.reference.id)) {
                                return widget.fillHeart!;
                              } else if (FFAppState()
                                  .favoriteEventIdsGuest
                                  .contains(widget.idShoppen?.reference.id)) {
                                return widget.fillHeart!;
                              } else if (FFAppState()
                                  .favoriteEventIdsGuest
                                  .contains(widget.idAktivity?.reference.id)) {
                                return widget.fillHeart!;
                              } else if (FFAppState()
                                  .favoriteEventIdsGuest
                                  .contains(widget.idBuchen?.reference.id)) {
                                return widget.fillHeart!;
                              } else {
                                return widget.heart!;
                              }
                            }(),
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

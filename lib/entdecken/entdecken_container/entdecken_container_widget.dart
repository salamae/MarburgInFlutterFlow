import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'entdecken_container_model.dart';
export 'entdecken_container_model.dart';

class EntdeckenContainerWidget extends StatefulWidget {
  const EntdeckenContainerWidget({
    super.key,
    this.image,
    this.shortDescription,
    this.adresse,
    this.openTime,
    this.name,
    Color? open,
    required this.heart,
    required this.fillHeart,
    this.idGastro,
    this.idShopping,
    this.idPark,
    this.idBuchen,
    this.idAktivity,
    this.preis,
    this.strasse,
    this.plz,
    this.stadt,
  }) : this.open = open ?? Colors.transparent;

  final String? image;
  final String? shortDescription;
  final String? adresse;
  final String? openTime;
  final String? name;
  final Color open;
  final Widget? heart;
  final Widget? fillHeart;
  final GastroRecord? idGastro;
  final ShoppingRecord? idShopping;
  final ParkRecord? idPark;
  final BuchenRecord? idBuchen;
  final FreizeitRecord? idAktivity;
  final String? preis;
  final String? strasse;
  final String? plz;
  final String? stadt;

  @override
  State<EntdeckenContainerWidget> createState() =>
      _EntdeckenContainerWidgetState();
}

class _EntdeckenContainerWidgetState extends State<EntdeckenContainerWidget> {
  late EntdeckenContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EntdeckenContainerModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
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
            if (widget.idShopping != null) {
              context.pushNamed(
                DetailsWidget.routeName,
                queryParameters: {
                  'name': serializeParam(
                    widget.idShopping?.name,
                    ParamType.String,
                  ),
                  'tag': serializeParam(
                    widget.idShopping?.kategorien,
                    ParamType.String,
                  ),
                  'longDes': serializeParam(
                    widget.idShopping?.longDescription,
                    ParamType.String,
                  ),
                  'image': serializeParam(
                    widget.idShopping?.imageUrl,
                    ParamType.String,
                  ),
                  'openTimesFrom': serializeParam(
                    widget.idShopping?.oeffnungszeiten
                        .map((e) => e.timeFrom)
                        .toList(),
                    ParamType.String,
                    isList: true,
                  ),
                  'openTimeTo': serializeParam(
                    widget.idShopping?.oeffnungszeiten
                        .map((e) => e.timeTo)
                        .toList(),
                    ParamType.String,
                    isList: true,
                  ),
                  'adresse1': serializeParam(
                    widget.idShopping?.address1,
                    ParamType.String,
                  ),
                  'city': serializeParam(
                    widget.idShopping?.city,
                    ParamType.String,
                  ),
                  'country': serializeParam(
                    widget.idShopping?.country,
                    ParamType.String,
                  ),
                  'zip': serializeParam(
                    widget.idShopping?.zipCode,
                    ParamType.String,
                  ),
                  'idShoppping': serializeParam(
                    widget.idShopping,
                    ParamType.Document,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  'idShoppping': widget.idShopping,
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
                        widget.idBuchen?.plz,
                        ParamType.String,
                      ),
                      'idBuchen': serializeParam(
                        widget.idBuchen,
                        ParamType.Document,
                      ),
                      'website': serializeParam(
                        widget.idBuchen?.pageURL,
                        ParamType.String,
                      ),
                      'price': serializeParam(
                        widget.idBuchen?.preis,
                        ParamType.String,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      'idBuchen': widget.idBuchen,
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
                        'idFreizeit': serializeParam(
                          widget.idAktivity,
                          ParamType.Document,
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
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'idFreizeit': widget.idAktivity,
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
          width: 280.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    child: Image.network(
                      widget.image!,
                      width: double.infinity,
                      height: 150.0,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/images/error_image.jpg',
                        width: double.infinity,
                        height: 150.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  if (loggedIn
                      ? ((widget.idGastro != null) ||
                          (widget.idShopping != null) ||
                          (widget.idPark != null))
                      : false)
                    Align(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 16.0, 16.0, 0.0),
                        child: InkWell(
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
                                        'favoriteGastro':
                                            FieldValue.arrayRemove([
                                          widget.idGastro?.reference.id
                                        ]),
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
                                if (widget.idShopping != null) {
                                  if ((currentUserDocument?.favoriteShopping
                                              .toList() ??
                                          [])
                                      .contains(
                                          widget.idShopping?.reference.id)) {
                                    await currentUserReference!.update({
                                      ...mapToFirestore(
                                        {
                                          'favoriteShopping':
                                              FieldValue.arrayRemove([
                                            widget.idShopping?.reference.id
                                          ]),
                                        },
                                      ),
                                    });
                                  } else {
                                    await currentUserReference!.update({
                                      ...mapToFirestore(
                                        {
                                          'favoriteShopping':
                                              FieldValue.arrayUnion([
                                            widget.idShopping?.reference.id
                                          ]),
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
                                        .contains(
                                            widget.idPark?.reference.id)) {
                                      await currentUserReference!.update({
                                        ...mapToFirestore(
                                          {
                                            'favoriteParks':
                                                FieldValue.arrayRemove([
                                              widget.idPark?.reference.id
                                            ]),
                                          },
                                        ),
                                      });
                                    } else {
                                      await currentUserReference!.update({
                                        ...mapToFirestore(
                                          {
                                            'favoriteParks':
                                                FieldValue.arrayUnion([
                                              widget.idPark?.reference.id
                                            ]),
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
                              if (FFAppState()
                                  .favoriteEventIdsGuest
                                  .contains(() {
                                if (widget.idGastro?.reference.id != null &&
                                    widget.idGastro?.reference.id != '') {
                                  return widget.idGastro?.reference.id;
                                } else if (widget.idShopping?.reference.id !=
                                        null &&
                                    widget.idShopping?.reference.id != '') {
                                  return widget.idShopping?.reference.id;
                                } else if (widget.idPark?.reference.id !=
                                        null &&
                                    widget.idPark?.reference.id != '') {
                                  return widget.idPark?.reference.id;
                                } else if (widget.idBuchen?.reference.id !=
                                        null &&
                                    widget.idBuchen?.reference.id != '') {
                                  return widget.idBuchen?.reference.id;
                                } else if (widget.idAktivity?.reference.id !=
                                        null &&
                                    widget.idAktivity?.reference.id != '') {
                                  return widget.idAktivity?.reference.id;
                                } else {
                                  return '';
                                }
                              }())) {
                                FFAppState()
                                    .removeFromFavoriteEventIdsGuest(() {
                                  if (widget.idGastro?.reference.id != null &&
                                      widget.idGastro?.reference.id != '') {
                                    return widget.idGastro!.reference.id;
                                  } else if (widget.idShopping?.reference.id !=
                                          null &&
                                      widget.idShopping?.reference.id != '') {
                                    return widget.idShopping!.reference.id;
                                  } else if (widget.idPark?.reference.id !=
                                          null &&
                                      widget.idPark?.reference.id != '') {
                                    return widget.idPark!.reference.id;
                                  } else if (widget.idBuchen?.reference.id !=
                                          null &&
                                      widget.idBuchen?.reference.id != '') {
                                    return widget.idBuchen!.reference.id;
                                  } else if (widget.idAktivity?.reference.id !=
                                          null &&
                                      widget.idAktivity?.reference.id != '') {
                                    return widget.idAktivity!.reference.id;
                                  } else {
                                    return '';
                                  }
                                }());
                                FFAppState().update(() {});
                              } else {
                                FFAppState().addToFavoriteEventIdsGuest(() {
                                  if (widget.idGastro?.reference.id != null &&
                                      widget.idGastro?.reference.id != '') {
                                    return widget.idGastro!.reference.id;
                                  } else if (widget.idShopping?.reference.id !=
                                          null &&
                                      widget.idShopping?.reference.id != '') {
                                    return widget.idShopping!.reference.id;
                                  } else if (widget.idPark?.reference.id !=
                                          null &&
                                      widget.idPark?.reference.id != '') {
                                    return widget.idPark!.reference.id;
                                  } else if (widget.idBuchen?.reference.id !=
                                          null &&
                                      widget.idBuchen?.reference.id != '') {
                                    return widget.idBuchen!.reference.id;
                                  } else if (widget.idAktivity?.reference.id !=
                                          null &&
                                      widget.idAktivity?.reference.id != '') {
                                    return widget.idAktivity!.reference.id;
                                  } else {
                                    return '';
                                  }
                                }());
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
                                builder: (context) => () {
                                  if ((currentUserDocument?.favoriteGastro
                                              .toList() ??
                                          [])
                                      .contains(
                                          widget.idGastro?.reference.id)) {
                                    return widget.fillHeart!;
                                  } else if ((currentUserDocument?.favoriteParks
                                              .toList() ??
                                          [])
                                      .contains(widget.idPark?.reference.id)) {
                                    return widget.fillHeart!;
                                  } else if ((currentUserDocument
                                              ?.favoriteShopping
                                              .toList() ??
                                          [])
                                      .contains(
                                          widget.idShopping?.reference.id)) {
                                    return widget.fillHeart!;
                                  } else {
                                    return widget.heart!;
                                  }
                                }(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 5.0, 16.0, 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.name != null && widget.name != ''
                          ? widget.name!
                          : ' ',
                      maxLines: widget.idBuchen != null ? 2 : 1,
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            font: GoogleFonts.interTight(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                            ),
                            color: Colors.black,
                            fontSize: 17.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                            lineHeight: 1.29,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.shortDescription != null &&
                              widget.shortDescription != ''
                          ? functions.htmlToText(widget.shortDescription!)
                          : ' ',
                      maxLines: widget.idBuchen != null ? 2 : 1,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            font: GoogleFonts.interTight(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                            color: Color(0x9A3C3C43),
                            fontSize: 15.0,
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
                    if (widget.adresse != null && widget.adresse != '')
                      Stack(
                        children: [
                          Icon(
                            FFIcons.kmappinandellipse,
                            color: Color(0xB33C3C43),
                            size: 14.0,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                18.0, 0.0, 0.0, 0.0),
                            child: Text(
                              widget.adresse != null && widget.adresse != ''
                                  ? widget.adresse!
                                  : ' ',
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
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
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    if (widget.openTime != null && widget.openTime != '')
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.circle_sharp,
                              color: widget.openTime != null &&
                                      widget.openTime != ''
                                  ? widget.open
                                  : Colors.transparent,
                              size: 10.0,
                            ),
                            Text(
                              widget.openTime != null && widget.openTime != ''
                                  ? widget.openTime!
                                  : ' ',
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                    color: widget.open,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontStyle,
                                  ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ].divide(SizedBox(width: 4.0)),
                        ),
                      ),
                    if (widget.preis != null && widget.preis != '')
                      Text(
                        '${widget.preis != null && widget.preis != '' ? 'ab ' : ' '}${widget.preis != null && widget.preis != '' ? widget.preis : ' '}',
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              font: GoogleFonts.interTight(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .fontStyle,
                              ),
                              color: Color(0xFFD12717),
                              fontSize: 15.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    if (widget.strasse != null && widget.strasse != '')
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 1.0, 2.0, 0.0),
                            child: Icon(
                              FFIcons.kmappinandellipse,
                              color: Color(0xB33C3C43),
                              size: 14.0,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              '${widget.strasse != null && widget.strasse != '' ? widget.strasse : ' '}${widget.strasse != null && widget.strasse != '' ? ', ' : ''}${widget.plz != null && widget.plz != '' ? widget.plz : ''}${widget.plz != null && widget.plz != '' ? ', ' : ''}${widget.stadt != null && widget.stadt != '' ? widget.stadt : ''}',
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
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
      ),
    );
  }
}

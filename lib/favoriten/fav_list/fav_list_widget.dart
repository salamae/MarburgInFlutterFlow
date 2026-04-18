import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'fav_list_model.dart';
export 'fav_list_model.dart';

class FavListWidget extends StatefulWidget {
  const FavListWidget({
    super.key,
    this.name,
    this.description,
    this.image,
    this.kategorie,
    this.adresse,
    this.openTime,
    this.open,
    this.idPark,
    this.idShop,
    this.idGastro,
    this.idBuchen,
    this.idAktvity,
  });

  final String? name;
  final String? description;
  final String? image;
  final String? kategorie;
  final String? adresse;
  final String? openTime;
  final Color? open;
  final ParkRecord? idPark;
  final ShoppingRecord? idShop;
  final GastroRecord? idGastro;
  final BuchenRecord? idBuchen;
  final FreizeitRecord? idAktvity;

  @override
  State<FavListWidget> createState() => _FavListWidgetState();
}

class _FavListWidgetState extends State<FavListWidget> {
  late FavListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
              'email': serializeParam(
                widget.idGastro?.email,
                ParamType.String,
              ),
              'website': serializeParam(
                widget.idGastro?.websiteUrl,
                ParamType.String,
              ),
              'price': serializeParam(
                widget.idGastro?.preisInformation,
                ParamType.String,
              ),
            }.withoutNulls,
            extra: <String, dynamic>{
              'idGastro': widget.idGastro,
            },
          );

          return;
        } else {
          if (widget.idShop != null) {
            context.pushNamed(
              DetailsWidget.routeName,
              queryParameters: {
                'name': serializeParam(
                  widget.idShop?.name,
                  ParamType.String,
                ),
                'tag': serializeParam(
                  widget.idShop?.kategorien,
                  ParamType.String,
                ),
                'longDes': serializeParam(
                  widget.idShop?.longDescription,
                  ParamType.String,
                ),
                'image': serializeParam(
                  widget.idShop?.imageUrl,
                  ParamType.String,
                ),
                'openTimesFrom': serializeParam(
                  widget.idShop?.oeffnungszeiten
                      .map((e) => e.timeFrom)
                      .toList(),
                  ParamType.String,
                  isList: true,
                ),
                'openTimeTo': serializeParam(
                  widget.idShop?.oeffnungszeiten
                      .map((e) => e.timeTo)
                      .toList(),
                  ParamType.String,
                  isList: true,
                ),
                'adresse1': serializeParam(
                  widget.idShop?.address1,
                  ParamType.String,
                ),
                'city': serializeParam(
                  widget.idShop?.city,
                  ParamType.String,
                ),
                'country': serializeParam(
                  widget.idShop?.country,
                  ParamType.String,
                ),
                'zip': serializeParam(
                  widget.idShop?.zipCode,
                  ParamType.String,
                ),
                'email': serializeParam(
                  widget.idShop?.email,
                  ParamType.String,
                ),
                'website': serializeParam(
                  widget.idShop?.websiteUrl,
                  ParamType.String,
                ),
                'price': serializeParam(
                  widget.idShop?.preisInformation,
                  ParamType.String,
                ),
                'idShoppping': serializeParam(
                  widget.idShop,
                  ParamType.Document,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                'idShoppping': widget.idShop,
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
                  'email': serializeParam(
                    widget.idPark?.email,
                    ParamType.String,
                  ),
                  'website': serializeParam(
                    widget.idPark?.websiteUrl,
                    ParamType.String,
                  ),
                  'price': serializeParam(
                    widget.idPark?.preisInformation,
                    ParamType.String,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  'idPark': widget.idPark,
                },
              );

              return;
            } else {
              return;
            }
          }
        }
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
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 69.0, 5.0),
                          child: Text(
                            widget.description!,
                            maxLines: 2,
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
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: Text(
                          widget.kategorie!,
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
                                    color: Color(0xFFD84B3E),
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
                      if (widget.adresse != null && widget.adresse != '')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (widget.adresse != null &&
                                  widget.adresse != '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 5.0, 0.0),
                                  child: Icon(
                                    FFIcons.kmappinandellipse,
                                    color: Color(0xC057636C),
                                    size: 15.0,
                                  ),
                                ),
                              Text(
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
                            ],
                          ),
                        ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (widget.openTime != null &&
                              widget.openTime != '')
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
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
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
                      if (widget.idGastro != null) {
                        await currentUserReference!.update({
                          ...mapToFirestore(
                            {
                              'favoriteGastro': FieldValue.arrayRemove(
                                  [widget.idGastro?.reference.id]),
                            },
                          ),
                        });

                        FFAppState().update(() {});
                        return;
                      } else {
                        if (widget.idShop != null) {
                          await currentUserReference!.update({
                            ...mapToFirestore(
                              {
                                'favoriteShopping': FieldValue.arrayRemove(
                                    [widget.idShop?.reference.id]),
                              },
                            ),
                          });

                          FFAppState().update(() {});
                          return;
                        } else {
                          if (widget.idPark != null) {
                            await currentUserReference!.update({
                              ...mapToFirestore(
                                {
                                  'favoriteParks': FieldValue.arrayRemove(
                                      [widget.idPark?.reference.id]),
                                },
                              ),
                            });

                            FFAppState().update(() {});
                            return;
                          } else {
                            return;
                          }
                        }
                      }
                    } else {
                      FFAppState().removeFromFavoriteEventIdsGuest(() {
                        if (widget.idPark != null) {
                          return widget.idPark!.reference.id;
                        } else if (widget.idShop != null) {
                          return widget.idShop!.reference.id;
                        } else if (widget.idGastro != null) {
                          return widget.idGastro!.reference.id;
                        } else if (widget.idBuchen != null) {
                          return widget.idBuchen!.reference.id;
                        } else if (widget.idAktvity != null) {
                          return widget.idAktvity!.reference.id;
                        } else {
                          return '';
                        }
                      }());
                      FFAppState().update(() {});
                      return;
                    }
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

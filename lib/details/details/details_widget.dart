import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'details_model.dart';
export 'details_model.dart';

class DetailsWidget extends StatefulWidget {
  const DetailsWidget({
    super.key,
    this.name,
    this.tag,
    this.longDes,
    this.image,
    this.openTimesFrom,
    this.openTimeTo,
    this.adresse1,
    this.city,
    this.country,
    this.zip,
    this.idGastro,
    this.idShoppping,
    this.idPark,
    this.idFreizeit,
    this.idEvent,
    this.idBuchen,
    this.email,
    this.website,
    this.price,
  });

  final String? name;
  final String? tag;
  final String? longDes;
  final String? image;
  final List<String>? openTimesFrom;
  final List<String>? openTimeTo;
  final String? adresse1;
  final String? city;
  final String? country;
  final String? zip;
  final GastroRecord? idGastro;
  final ShoppingRecord? idShoppping;
  final ParkRecord? idPark;
  final FreizeitRecord? idFreizeit;
  final EventsRecord? idEvent;
  final BuchenRecord? idBuchen;
  final String? email;
  final String? website;
  final String? price;

  static String routeName = 'details';
  static String routePath = '/details';

  @override
  State<DetailsWidget> createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  late DetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFFAFAFA),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(54.0),
          child: AppBar(
            backgroundColor: Color(0xFFFAFAFA),
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                          },
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
                                  0.0, 0.0, 2.0, 0.0),
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 25.0,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Text(
                              widget.name!,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        if (loggedIn
                            ? ((widget.idGastro != null) ||
                                (widget.idShoppping != null) ||
                                (widget.idPark != null))
                            : false)
                          InkWell(
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
                                      .contains(
                                          widget.idGastro?.reference.id)) {
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
                                          'favoriteGastro':
                                              FieldValue.arrayUnion([
                                            widget.idGastro?.reference.id
                                          ]),
                                        },
                                      ),
                                    });
                                  }

                                  FFAppState().update(() {});
                                  return;
                                } else {
                                  if (widget.idShoppping != null) {
                                    if ((currentUserDocument?.favoriteShopping
                                                .toList() ??
                                            [])
                                        .contains(widget
                                            .idShoppping?.reference.id)) {
                                      await currentUserReference!.update({
                                        ...mapToFirestore(
                                          {
                                            'favoriteShopping':
                                                FieldValue.arrayRemove([
                                              widget.idShoppping?.reference.id
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
                                              widget.idShoppping?.reference.id
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
                                  if (widget.idGastro != null) {
                                    return widget.idGastro?.reference.id;
                                  } else if (widget.idShoppping != null) {
                                    return widget.idShoppping?.reference.id;
                                  } else if (widget.idPark != null) {
                                    return widget.idPark?.reference.id;
                                  } else if (widget.idFreizeit != null) {
                                    return widget.idFreizeit?.reference.id;
                                  } else if (widget.idBuchen != null) {
                                    return widget.idBuchen?.reference.id;
                                  } else {
                                    return '';
                                  }
                                }())) {
                                  FFAppState()
                                      .removeFromFavoriteEventIdsGuest(() {
                                    if (widget.idGastro != null) {
                                      return widget.idGastro!.reference.id;
                                    } else if (widget.idShoppping != null) {
                                      return widget.idShoppping!.reference.id;
                                    } else if (widget.idPark != null) {
                                      return widget.idPark!.reference.id;
                                    } else if (widget.idFreizeit != null) {
                                      return widget.idFreizeit!.reference.id;
                                    } else if (widget.idBuchen != null) {
                                      return widget.idBuchen!.reference.id;
                                    } else {
                                      return '';
                                    }
                                  }());
                                  FFAppState().update(() {});
                                } else {
                                  FFAppState().addToFavoriteEventIdsGuest(() {
                                    if (widget.idGastro != null) {
                                      return widget.idGastro!.reference.id;
                                    } else if (widget.idShoppping != null) {
                                      return widget.idShoppping!.reference.id;
                                    } else if (widget.idPark != null) {
                                      return widget.idPark!.reference.id;
                                    } else if (widget.idFreizeit != null) {
                                      return widget.idFreizeit!.reference.id;
                                    } else if (widget.idBuchen != null) {
                                      return widget.idBuchen!.reference.id;
                                    } else {
                                      return '';
                                    }
                                  }());
                                  FFAppState().update(() {});
                                }

                                return;
                              }
                            },
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
                              child: Stack(
                                children: [
                                  if (loggedIn
                                      ? () {
                                          if (widget.idGastro != null) {
                                            return !(currentUserDocument
                                                        ?.favoriteGastro
                                                        .toList() ??
                                                    [])
                                                .contains(widget
                                                    .idGastro?.reference.id);
                                          } else if (widget.idShoppping !=
                                              null) {
                                            return !(currentUserDocument
                                                        ?.favoriteShopping
                                                        .toList() ??
                                                    [])
                                                .contains(widget
                                                    .idShoppping?.reference.id);
                                          } else if (widget.idPark != null) {
                                            return !(currentUserDocument
                                                        ?.favoriteParks
                                                        .toList() ??
                                                    [])
                                                .contains(widget
                                                    .idPark?.reference.id);
                                          } else {
                                            return false;
                                          }
                                        }()
                                      : false)
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 3.0, 0.0, 0.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Icon(
                                            FFIcons.kheart,
                                            color: Color(0xBB000000),
                                            size: 25.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (loggedIn
                                      ? () {
                                          if (widget.idGastro != null) {
                                            return (currentUserDocument
                                                        ?.favoriteGastro
                                                        .toList() ??
                                                    [])
                                                .contains(widget
                                                    .idGastro?.reference.id);
                                          } else if (widget.idShoppping !=
                                              null) {
                                            return (currentUserDocument
                                                        ?.favoriteShopping
                                                        .toList() ??
                                                    [])
                                                .contains(widget
                                                    .idShoppping?.reference.id);
                                          } else if (widget.idPark != null) {
                                            return (currentUserDocument
                                                        ?.favoriteParks
                                                        .toList() ??
                                                    [])
                                                .contains(widget
                                                    .idPark?.reference.id);
                                          } else {
                                            return false;
                                          }
                                        }()
                                      : false)
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 1.0, 0.0, 0.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Icon(
                                            FFIcons.kheartfill,
                                            color: Color(0xFFD12717),
                                            size: 25.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 0.0,
          ),
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                            widget.image!,
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
                      ),
                      Text(
                        widget.name!,
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              font: GoogleFonts.interTight(
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
                      if ((widget.idGastro != null) ||
                          (widget.idShoppping != null) ||
                          (widget.idPark != null) ||
                          (widget.idFreizeit != null))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                FFIcons.ktag,
                                color: Color(0xFF434C53),
                                size: 20.0,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: Text(
                                    widget.tag!,
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
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                        ),
                      if (!(widget.idBuchen != null))
                        Text(
                          widget.longDes!,
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    font: GoogleFonts.interTight(
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
                    ].divide(SizedBox(height: 20.0)),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      custom_widgets.AppleMap(
                        width: double.infinity,
                        height: 200.0,
                        address:
                            '${widget.adresse1}, ${widget.zip}, ${widget.city}, ${widget.country}',
                      ),
                    ],
                  ),
                ),
                if (widget.openTimesFrom != null &&
                    (widget.openTimesFrom)!.isNotEmpty)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: Icon(
                                  FFIcons.kclockfill,
                                  color: Color(0xFFE9453A),
                                  size: 17.0,
                                ),
                              ),
                              Text(
                                'Öffnungszeiten',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Container(
                            width: 120.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFE6F5EA),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 0.0),
                                      child: Icon(
                                        FFIcons.kclock,
                                        color: Color(0x7B14181B),
                                        size: 12.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'Heute:',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.interTight(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0x8F14181B),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                if ((widget.openTimesFrom
                                            ?.elementAtOrNull(0)) !=
                                        null &&
                                    (widget.openTimesFrom
                                            ?.elementAtOrNull(0)) !=
                                        '')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 5.0, 0.0, 0.0),
                                    child: Text(
                                      '${widget.openTimesFrom?.firstOrNull} - ${widget.openTimeTo?.firstOrNull}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.interTight(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF35C75A),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                if ((widget.openTimesFrom
                                            ?.elementAtOrNull(1)) !=
                                        null &&
                                    (widget.openTimesFrom
                                            ?.elementAtOrNull(1)) !=
                                        '')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 0.0, 0.0),
                                    child: Text(
                                      '${widget.openTimesFrom?.elementAtOrNull(1)} - ${widget.openTimeTo?.elementAtOrNull(1)}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.interTight(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF35C75A),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                if ((widget.openTimesFrom
                                            ?.elementAtOrNull(2)) !=
                                        null &&
                                    (widget.openTimesFrom
                                            ?.elementAtOrNull(2)) !=
                                        '')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 0.0, 0.0),
                                    child: Text(
                                      '${widget.openTimesFrom?.elementAtOrNull(2)} - ${widget.openTimeTo?.elementAtOrNull(2)}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.interTight(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF35C75A),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                if ((widget.openTimesFrom
                                            ?.elementAtOrNull(3)) !=
                                        null &&
                                    (widget.openTimesFrom
                                            ?.elementAtOrNull(3)) !=
                                        '')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 0.0, 0.0),
                                    child: Text(
                                      '${widget.openTimesFrom?.elementAtOrNull(3)} - ${widget.openTimeTo?.elementAtOrNull(3)}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.interTight(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF35C75A),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                if ((widget.openTimesFrom
                                            ?.elementAtOrNull(4)) !=
                                        null &&
                                    (widget.openTimesFrom
                                            ?.elementAtOrNull(4)) !=
                                        '')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 0.0, 0.0),
                                    child: Text(
                                      '${widget.openTimesFrom?.elementAtOrNull(4)} - ${widget.openTimeTo?.elementAtOrNull(4)}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.interTight(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF35C75A),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                if ((widget.openTimesFrom
                                            ?.elementAtOrNull(5)) !=
                                        null &&
                                    (widget.openTimesFrom
                                            ?.elementAtOrNull(5)) !=
                                        '')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 0.0, 0.0),
                                    child: Text(
                                      '${widget.openTimesFrom?.elementAtOrNull(5)} - ${widget.openTimeTo?.elementAtOrNull(5)}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.interTight(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF35C75A),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                              ].addToEnd(SizedBox(height: 8.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if ((widget.website != null && widget.website != '') &&
                    !(widget.idBuchen != null))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: Icon(
                                  FFIcons.ksafari,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 18.0,
                                ),
                              ),
                              Text(
                                widget.website!,
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFFD12717),
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 15.0, 0.0),
                                child: Icon(
                                  FFIcons.kenvelope,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 14.0,
                                ),
                              ),
                              Text(
                                widget.email!,
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                if (widget.idBuchen != null)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 27.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (widget.price != null && widget.price != '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 2.0, 10.0, 0.0),
                                  child: Icon(
                                    FFIcons.keurosigncircle,
                                    color: Color(0xFFD12717),
                                    size: 20.0,
                                  ),
                                ),
                              if (widget.price != null && widget.price != '')
                                Text(
                                  widget.price != null && widget.price != ''
                                      ? 'ab ${widget.price}'
                                      : '',
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFFD12717),
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
                          child: Text(
                            widget.longDes!,
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      font: GoogleFonts.interTight(
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
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await launchURL(widget.website!);
                            },
                            text: 'Zur Buchung/Website',
                            icon: Icon(
                              FFIcons.ksafari,
                              size: 18.0,
                            ),
                            options: FFButtonOptions(
                              width: 230.0,
                              height: 41.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFFD12717),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ].addToEnd(SizedBox(height: 50.0)),
            ),
          ),
        ),
      ),
    );
  }
}

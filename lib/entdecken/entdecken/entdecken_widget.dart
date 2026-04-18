import '/backend/backend.dart';
import '/entdecken/entdecken_container/entdecken_container_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'entdecken_model.dart';
export 'entdecken_model.dart';

class EntdeckenWidget extends StatefulWidget {
  const EntdeckenWidget({super.key});

  @override
  State<EntdeckenWidget> createState() => _EntdeckenWidgetState();
}

class _EntdeckenWidgetState extends State<EntdeckenWidget> {
  late EntdeckenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EntdeckenModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.gastrosAll = await queryGastroRecordOnce();
      _model.shopsAll = await queryShoppingRecordOnce();
      _model.parksAll = await queryParkRecordOnce();
      _model.buchenAll = await queryBuchenRecordOnce();
      _model.allGastro = _model.gastrosAll!.toList().cast<GastroRecord>();
      safeSetState(() {});
      _model.allShops = _model.shopsAll!.toList().cast<ShoppingRecord>();
      safeSetState(() {});
      _model.allParks = _model.parksAll!.toList().cast<ParkRecord>();
      safeSetState(() {});
      _model.allBuchen = _model.buchenAll!.toList().cast<BuchenRecord>();
      safeSetState(() {});
      _model.shuffledGastro = await actions.shuffleGastros(
        _model.allGastro.toList(),
      );
      _model.shuffledShops = await actions.shuffleShops(
        _model.allShops.toList(),
      );
      _model.shuffledParks = await actions.shuffleParks(
        _model.allParks.toList(),
      );
      _model.shuffledBuchen = await actions.shuffleBuchen(
        _model.allBuchen.toList(),
      );
      _model.gastroShuffeld =
          _model.shuffledGastro!.toList().cast<GastroRecord>();
      safeSetState(() {});
      _model.shopsShuffeld =
          _model.shuffledShops!.toList().cast<ShoppingRecord>();
      safeSetState(() {});
      _model.parksShuffeld = _model.shuffledParks!.toList().cast<ParkRecord>();
      safeSetState(() {});
      _model.buchenShuffeld =
          _model.shuffledBuchen!.toList().cast<BuchenRecord>();
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
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFAFAFA),
        border: Border.all(
          color: Color(0x21020000),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 79.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 35.0),
                child: Container(
                  height: 328.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 27.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 7.0, 0.0, 0.0),
                              child: Text(
                                'Gastro in Marburg',
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF1C1C1E),
                                      fontSize: 22.0,
                                      letterSpacing: 0.26,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 11.0, 10.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().alles = 'Gastro in Marburg';
                                  safeSetState(() {});

                                  context
                                      .pushNamed(AllesSearchWidget.routeName);
                                },
                                child: Text(
                                  'alles >',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFFD12717),
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 16.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final gastro = _model.gastroShuffeld
                                  .toList()
                                  .take(10)
                                  .toList();

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: gastro.length,
                                itemBuilder: (context, gastroIndex) {
                                  final gastroItem = gastro[gastroIndex];
                                  return EntdeckenContainerWidget(
                                    key: Key(
                                        'Key2ws_${gastroIndex}_of_${gastro.length}'),
                                    image: gastroItem.imageUrl,
                                    shortDescription:
                                        gastroItem.shortDescription,
                                    adresse: gastroItem.address1,
                                    openTime: functions.openStatusTextMulti(
                                        gastroItem.oeffnungszeiten
                                            .map((e) => e.timeFrom)
                                            .toList(),
                                        gastroItem.oeffnungszeiten
                                            .map((e) => e.timeTo)
                                            .toList()),
                                    name: gastroItem.name,
                                    open: functions.isOpenNowMulti(
                                            gastroItem.oeffnungszeiten
                                                .map((e) => e.timeFrom)
                                                .toList(),
                                            gastroItem.oeffnungszeiten
                                                .map((e) => e.timeTo)
                                                .toList())
                                        ? Color(0xFF28A745)
                                        : Color(0xFFDC3645),
                                    heart: Icon(
                                      FFIcons.kheart,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                    fillHeart: Icon(
                                      FFIcons.kheartfill,
                                      color: Color(0xFFFF383C),
                                      size: 20.0,
                                    ),
                                    idGastro: gastroItem,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 35.0),
                child: Container(
                  width: 100.0,
                  height: 324.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 27.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 10.0, 0.0, 0.0),
                              child: Text(
                                'Shoppen in Marburg',
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF1C1C1E),
                                      fontSize: 22.0,
                                      letterSpacing: 0.26,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 10.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().alles = 'Shoppen in Marburg';
                                  safeSetState(() {});

                                  context
                                      .pushNamed(AllesSearchWidget.routeName);
                                },
                                child: Text(
                                  'alles >',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFFD12717),
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final shops = _model.shopsShuffeld
                                  .toList()
                                  .take(10)
                                  .toList();

                              return ListView.builder(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  16.0,
                                  0,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: shops.length,
                                itemBuilder: (context, shopsIndex) {
                                  final shopsItem = shops[shopsIndex];
                                  return EntdeckenContainerWidget(
                                    key: Key(
                                        'Keyhsv_${shopsIndex}_of_${shops.length}'),
                                    image: shopsItem.imageUrl,
                                    shortDescription:
                                        shopsItem.shortDescription,
                                    adresse: shopsItem.address1,
                                    openTime: functions.openStatusTextMulti(
                                        shopsItem.oeffnungszeiten
                                            .map((e) => e.timeFrom)
                                            .toList(),
                                        shopsItem.oeffnungszeiten
                                            .map((e) => e.timeTo)
                                            .toList()),
                                    name: shopsItem.name,
                                    open: functions.isOpenNowMulti(
                                            shopsItem.oeffnungszeiten
                                                .map((e) => e.timeFrom)
                                                .toList(),
                                            shopsItem.oeffnungszeiten
                                                .map((e) => e.timeTo)
                                                .toList())
                                        ? Color(0xFF28A745)
                                        : Color(0xFFDC3645),
                                    heart: Icon(
                                      FFIcons.kheart,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                    fillHeart: Icon(
                                      FFIcons.kheartfill,
                                      color: Color(0xFFFF383C),
                                      size: 20.0,
                                    ),
                                    idShopping: shopsItem,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 25.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(
                      BehringRouteWidget.routeName,
                      extra: <String, dynamic>{
                        '__transition_info__': TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.rightToLeft,
                        ),
                      },
                    );
                  },
                  text: 'Marburger Behring Route',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 300.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconAlignment: IconAlignment.start,
                    iconPadding: EdgeInsets.all(0.0),
                    color: Color(0xFF00315A),
                    textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                          color: Colors.white,
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 35.0),
                child: Container(
                  width: 100.0,
                  height: 330.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 27.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 10.0, 0.0, 0.0),
                              child: Text(
                                'Parks in Marburg',
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF1C1C1E),
                                      fontSize: 22.0,
                                      letterSpacing: 0.26,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 10.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().alles = 'Parks in Marburg';
                                  safeSetState(() {});

                                  context
                                      .pushNamed(AllesSearchWidget.routeName);
                                },
                                child: Text(
                                  'alles >',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFFD12717),
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 100.0,
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final parks = _model.parksShuffeld
                                  .toList()
                                  .take(10)
                                  .toList();

                              return ListView.builder(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  16.0,
                                  0,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: parks.length,
                                itemBuilder: (context, parksIndex) {
                                  final parksItem = parks[parksIndex];
                                  return EntdeckenContainerWidget(
                                    key: Key(
                                        'Key3g6_${parksIndex}_of_${parks.length}'),
                                    image: parksItem.imageUrl,
                                    shortDescription:
                                        parksItem.shortDescription,
                                    adresse: parksItem.address1,
                                    openTime: functions.openStatusTextMulti(
                                        parksItem.oeffnungszeiten
                                            .map((e) => e.timeFrom)
                                            .toList(),
                                        parksItem.oeffnungszeiten
                                            .map((e) => e.timeTo)
                                            .toList()),
                                    name: parksItem.name,
                                    open: functions.isOpenNowMulti(
                                            parksItem.oeffnungszeiten
                                                .map((e) => e.timeFrom)
                                                .toList(),
                                            parksItem.oeffnungszeiten
                                                .map((e) => e.timeTo)
                                                .toList())
                                        ? Color(0xFF28A745)
                                        : Color(0xFFDC3545),
                                    heart: Icon(
                                      FFIcons.kheart,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                    fillHeart: Icon(
                                      FFIcons.kheartfill,
                                      color: Color(0xFFFF383C),
                                      size: 20.0,
                                    ),
                                    idPark: parksItem,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 100.0,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 53.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 10.0, 0.0, 0.0),
                        child: Text(
                          'Sehenswürdigkeiten in\nMarburg ',
                          maxLines: 2,
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF1C1C1E),
                                    fontSize: 22.0,
                                    letterSpacing: 0.26,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 10.0, 0.0),
                        child: Text(
                          'alles >',
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                    color: Color(0xFFD12717),
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 35.0),
                child: Container(
                  height: 370.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 27.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 10.0, 0.0, 0.0),
                              child: Text(
                                'Unterkünfte in Marburg',
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF1C1C1E),
                                      fontSize: 22.0,
                                      letterSpacing: 0.26,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 10.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().alles = 'Unterkünfte in Marburg';
                                  safeSetState(() {});

                                  context
                                      .pushNamed(AllesSearchWidget.routeName);
                                },
                                child: Text(
                                  'alles >',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFFD12717),
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Builder(
                          builder: (context) {
                            final buchen = _model.buchenShuffeld
                                .toList()
                                .take(10)
                                .toList();

                            return ListView.builder(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                0,
                                16.0,
                                0,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: buchen.length,
                              itemBuilder: (context, buchenIndex) {
                                final buchenItem = buchen[buchenIndex];
                                return EntdeckenContainerWidget(
                                  key: Key(
                                      'Keyoss_${buchenIndex}_of_${buchen.length}'),
                                  image: buchenItem.bildURL,
                                  shortDescription: buchenItem.beschreibung,
                                  adresse: '',
                                  name: buchenItem.name,
                                  heart: Icon(
                                    FFIcons.kheart,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                  fillHeart: Icon(
                                    FFIcons.kheartfill,
                                    color: Color(0xFFFF383C),
                                    size: 20.0,
                                  ),
                                  idBuchen: buchenItem,
                                  preis: buchenItem.preis,
                                  strasse: buchenItem.strasse,
                                  plz: buchenItem.plz,
                                  stadt: buchenItem.stadt,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                child: Container(
                  width: 100.0,
                  height: 351.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 27.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 10.0, 0.0, 0.0),
                              child: Text(
                                'Akivitäten',
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF1C1C1E),
                                      fontSize: 22.0,
                                      letterSpacing: 0.26,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 10.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().alles = 'Aktivitäten';
                                  safeSetState(() {});

                                  context
                                      .pushNamed(AllesSearchWidget.routeName);
                                },
                                child: Text(
                                  'alles >',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFFD12717),
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(),
                          child: StreamBuilder<List<FreizeitRecord>>(
                            stream: queryFreizeitRecord(
                              limit: 10,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<FreizeitRecord> listViewFreizeitRecordList =
                                  snapshot.data!;

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: listViewFreizeitRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewFreizeitRecord =
                                      listViewFreizeitRecordList[listViewIndex];
                                  return Visibility(
                                    visible: listViewFreizeitRecord.imageUrl != '',
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 5.0, 0.0),
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
                                            DetailsWidget.routeName,
                                            queryParameters: {
                                              'name': serializeParam(
                                                listViewFreizeitRecord.name,
                                                ParamType.String,
                                              ),
                                              'tag': serializeParam(
                                                listViewFreizeitRecord
                                                    .kategorien,
                                                ParamType.String,
                                              ),
                                              'longDes': serializeParam(
                                                listViewFreizeitRecord
                                                    .longDescription,
                                                ParamType.String,
                                              ),
                                              'image': serializeParam(
                                                listViewFreizeitRecord.imageUrl,
                                                ParamType.String,
                                              ),
                                              'openTimesFrom': serializeParam(
                                                listViewFreizeitRecord
                                                    .oeffnungszeiten
                                                    .map((e) => e.timeFrom)
                                                    .toList(),
                                                ParamType.String,
                                                isList: true,
                                              ),
                                              'openTimeTo': serializeParam(
                                                listViewFreizeitRecord
                                                    .oeffnungszeiten
                                                    .map((e) => e.timeTo)
                                                    .toList(),
                                                ParamType.String,
                                                isList: true,
                                              ),
                                              'adresse1': serializeParam(
                                                listViewFreizeitRecord.address1,
                                                ParamType.String,
                                              ),
                                              'city': serializeParam(
                                                listViewFreizeitRecord.city,
                                                ParamType.String,
                                              ),
                                              'country': serializeParam(
                                                listViewFreizeitRecord.country,
                                                ParamType.String,
                                              ),
                                              'zip': serializeParam(
                                                listViewFreizeitRecord.zipCode,
                                                ParamType.String,
                                              ),
                                              'idFreizeit': serializeParam(
                                                listViewFreizeitRecord,
                                                ParamType.Document,
                                              ),
                                              'email': serializeParam(
                                                listViewFreizeitRecord.email,
                                                ParamType.String,
                                              ),
                                              'website': serializeParam(
                                                listViewFreizeitRecord
                                                    .websiteUrl,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'idFreizeit':
                                                  listViewFreizeitRecord,
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: 280.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                10.0),
                                                        topRight:
                                                            Radius.circular(
                                                                10.0),
                                                      ),
                                                      child: Image.network(
                                                        listViewFreizeitRecord
                                                            .imageUrl,
                                                        width: 488.4,
                                                        height: 150.0,
                                                        fit: BoxFit.fill,
                                                        errorBuilder: (context,
                                                                error,
                                                                stackTrace) =>
                                                            Image.asset(
                                                          'assets/images/error_image.jpg',
                                                          width: 488.4,
                                                          height: 150.0,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 2.0, 15.0, 15.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        listViewFreizeitRecord
                                                                        .name !=
                                                                    ''
                                                            ? listViewFreizeitRecord
                                                                .name
                                                            : ' ',
                                                        maxLines: 1,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyLarge
                                                            .override(
                                                              font: GoogleFonts
                                                                  .interTight(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                              ),
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 17.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                              lineHeight: 1.29,
                                                            ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: Text(
                                                        listViewFreizeitRecord
                                                                        .shortDescription !=
                                                                    ''
                                                            ? listViewFreizeitRecord
                                                                .shortDescription
                                                            : ' ',
                                                        maxLines: 2,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
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
                                                                      0x983C3C43),
                                                                  fontSize:
                                                                      15.0,
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
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: Stack(
                                                        children: [
                                                          if (listViewFreizeitRecord
                                                                      .address1 !=
                                                                  '')
                                                            Icon(
                                                              FFIcons
                                                                  .kmappinandellipse,
                                                              color: Color(
                                                                  0xB33C3C43),
                                                              size: 14.0,
                                                            ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        18.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              listViewFreizeitRecord
                                                                              .address1 !=
                                                                          ''
                                                                  ? listViewFreizeitRecord
                                                                      .address1
                                                                  : ' ',
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .interTight(
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
                                                                        0x983C3C43),
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
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Stack(
                                                      children: [
                                                        if (listViewFreizeitRecord
                                                                    .kategorien !=
                                                                '')
                                                          Icon(
                                                            FFIcons.ktag,
                                                            color: Colors.black,
                                                            size: 14.0,
                                                          ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            listViewFreizeitRecord
                                                                            .kategorien !=
                                                                        ''
                                                                ? listViewFreizeitRecord
                                                                    .kategorien
                                                                : ' ',
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
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
                                                                      0x983C3C43),
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
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 4.0)),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 8.0)),
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

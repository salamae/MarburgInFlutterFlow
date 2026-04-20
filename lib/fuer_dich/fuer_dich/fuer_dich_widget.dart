import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/entdecken/entdecken_container/entdecken_container_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/fuer_dich/fuer_dich_container/fuer_dich_container_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'fuer_dich_model.dart';
export 'fuer_dich_model.dart';

class FuerDichWidget extends StatefulWidget {
  const FuerDichWidget({super.key});

  @override
  State<FuerDichWidget> createState() => _FuerDichWidgetState();
}

class _FuerDichWidgetState extends State<FuerDichWidget> {
  late FuerDichModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FuerDichModel());
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
        border: Border.all(
          color: Color(0x21020000),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 11.0, 0.0, 8.0),
                child: Container(
                  height: 320.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 10.0, 0.0),
                                child: Text(
                                  'Das könnte Dich in ${functions.nextMonthNameFromDateDE(getCurrentTimestamp)} interessieren',
                                  maxLines: 2,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                        color: Color(0xDF000000),
                                        fontSize: 22.0,
                                        letterSpacing: 0.26,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
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
                          child: StreamBuilder<List<EventsRecord>>(
                            stream: queryEventsRecord(
                              queryBuilder: (eventsRecord) => eventsRecord
                                  .where(
                                    'date',
                                    isGreaterThanOrEqualTo: functions
                                        .startFourWeeksFromNowDT()
                                        .toString(),
                                  )
                                  .where(
                                    'date',
                                    isLessThan: functions
                                        .endOneMonthAfterFourWeeksDT()
                                        .toString(),
                                  )
                                  .orderBy('date')
                                  .orderBy('time'),
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
                              List<EventsRecord> listViewEventsRecordList =
                                  snapshot.data!;

                              return ListView.builder(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  16.0,
                                  0,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: listViewEventsRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewEventsRecord =
                                      listViewEventsRecordList[listViewIndex];
                                  return Visibility(
                                    visible:
                                        listViewEventsRecord.imageUrl != '',
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
                                              listViewEventsRecord.company,
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
                                              listViewEventsRecord.imageUrl,
                                              ParamType.String,
                                            ),
                                            'event': serializeParam(
                                              listViewEventsRecord,
                                              ParamType.Document,
                                            ),
                                            'adresse': serializeParam(
                                              '${listViewEventsRecord.address1 != '' ? '${listViewEventsRecord.address1}, ' : ' '}${listViewEventsRecord.address1 != '' ? '${listViewEventsRecord.zipCode}, ' : ' '}${listViewEventsRecord.address1 != '' ? '${listViewEventsRecord.town}, ' : ' '}${listViewEventsRecord.address1 != '' ? '${listViewEventsRecord.country}' : ' '}',
                                              ParamType.String,
                                            ),
                                            'adresse1': serializeParam(
                                              listViewEventsRecord.address1,
                                              ParamType.String,
                                            ),
                                            'city': serializeParam(
                                              listViewEventsRecord.town,
                                              ParamType.String,
                                            ),
                                            'country': serializeParam(
                                              listViewEventsRecord.country,
                                              ParamType.String,
                                            ),
                                            'zipCode': serializeParam(
                                              listViewEventsRecord.zipCode,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'event': listViewEventsRecord,
                                          },
                                        );
                                      },
                                      child: FuerDichContainerWidget(
                                        key: Key(
                                            'Keynel_${listViewIndex}_of_${listViewEventsRecordList.length}'),
                                        image: listViewEventsRecord.imageUrl,
                                        name: listViewEventsRecord.name,
                                        company: listViewEventsRecord.company,
                                        description: listViewEventsRecord
                                            .shortDescription,
                                        time: listViewEventsRecord.time,
                                        eventID: listViewEventsRecord,
                                        redHeart: Icon(
                                          FFIcons.kheartfill,
                                          color: Color(0xFFFF383C),
                                          size: 20.0,
                                        ),
                                        heart: Icon(
                                          FFIcons.kheart,
                                          color: Colors.white,
                                          size: 20.0,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: Container(
                  height: 315.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  'Jetzt geöffnet',
                                  maxLines: 2,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              StreamBuilder<List<GastroRecord>>(
                                stream: queryGastroRecord(),
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
                                  List<GastroRecord> listViewGastroRecordList =
                                      snapshot.data!;

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: listViewGastroRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewGastroRecord =
                                          listViewGastroRecordList[
                                              listViewIndex];
                                      return Visibility(
                                        visible: functions.isOpenNowMulti(
                                                listViewGastroRecord
                                                    .oeffnungszeiten
                                                    .map((e) => e.timeFrom)
                                                    .toList(),
                                                listViewGastroRecord
                                                    .oeffnungszeiten
                                                    .map((e) => e.timeTo)
                                                    .toList()) &&
                                            (listViewGastroRecord.imageUrl !=
                                                    ''),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              DetailsWidget.routeName,
                                              queryParameters: {
                                                'name': serializeParam(
                                                  listViewGastroRecord.name,
                                                  ParamType.String,
                                                ),
                                                'tag': serializeParam(
                                                  listViewGastroRecord
                                                      .kategorien,
                                                  ParamType.String,
                                                ),
                                                'longDes': serializeParam(
                                                  listViewGastroRecord
                                                      .longDescription,
                                                  ParamType.String,
                                                ),
                                                'image': serializeParam(
                                                  listViewGastroRecord.imageUrl,
                                                  ParamType.String,
                                                ),
                                                'openTimesFrom': serializeParam(
                                                  listViewGastroRecord
                                                      .oeffnungszeiten
                                                      .map((e) => e.timeFrom)
                                                      .toList(),
                                                  ParamType.String,
                                                  isList: true,
                                                ),
                                                'openTimeTo': serializeParam(
                                                  listViewGastroRecord
                                                      .oeffnungszeiten
                                                      .map((e) => e.timeTo)
                                                      .toList(),
                                                  ParamType.String,
                                                  isList: true,
                                                ),
                                                'adresse1': serializeParam(
                                                  listViewGastroRecord.address1,
                                                  ParamType.String,
                                                ),
                                                'city': serializeParam(
                                                  listViewGastroRecord.city,
                                                  ParamType.String,
                                                ),
                                                'country': serializeParam(
                                                  listViewGastroRecord.country,
                                                  ParamType.String,
                                                ),
                                                'zip': serializeParam(
                                                  listViewGastroRecord.zipCode,
                                                  ParamType.String,
                                                ),
                                                'idGastro': serializeParam(
                                                  listViewGastroRecord,
                                                  ParamType.Document,
                                                ),
                                                'email': serializeParam(
                                                  listViewGastroRecord.email,
                                                  ParamType.String,
                                                ),
                                                'website': serializeParam(
                                                  listViewGastroRecord
                                                      .websiteUrl,
                                                  ParamType.String,
                                                ),
                                                'price': serializeParam(
                                                  listViewGastroRecord
                                                      .preisInformation,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'idGastro':
                                                    listViewGastroRecord,
                                              },
                                            );
                                          },
                                          child: EntdeckenContainerWidget(
                                            key: Key(
                                                'Key1yo_${listViewIndex}_of_${listViewGastroRecordList.length}'),
                                            image:
                                                listViewGastroRecord.imageUrl,
                                            shortDescription:
                                                listViewGastroRecord
                                                    .shortDescription,
                                            adresse:
                                                listViewGastroRecord.address1,
                                            openTime:
                                                functions.openStatusTextMulti(
                                                    listViewGastroRecord
                                                        .oeffnungszeiten
                                                        .map((e) => e.timeFrom)
                                                        .toList(),
                                                    listViewGastroRecord
                                                        .oeffnungszeiten
                                                        .map((e) => e.timeTo)
                                                        .toList()),
                                            name: listViewGastroRecord.name,
                                            open: functions.isOpenNowMulti(
                                                    listViewGastroRecord
                                                        .oeffnungszeiten
                                                        .map((e) => e.timeFrom)
                                                        .toList(),
                                                    listViewGastroRecord
                                                        .oeffnungszeiten
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
                                            idGastro: listViewGastroRecord,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              StreamBuilder<List<ShoppingRecord>>(
                                stream: queryShoppingRecord(
                                  limit: 5,
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
                                  List<ShoppingRecord>
                                      listViewShoppingRecordList =
                                      snapshot.data!;

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        listViewShoppingRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewShoppingRecord =
                                          listViewShoppingRecordList[
                                              listViewIndex];
                                      return Visibility(
                                        visible: functions.isOpenNowMulti(
                                                listViewShoppingRecord
                                                    .oeffnungszeiten
                                                    .map((e) => e.timeFrom)
                                                    .toList(),
                                                listViewShoppingRecord
                                                    .oeffnungszeiten
                                                    .map((e) => e.timeTo)
                                                    .toList()) &&
                                            (listViewShoppingRecord
                                                        .imageUrl !=
                                                    ''),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              DetailsWidget.routeName,
                                              queryParameters: {
                                                'name': serializeParam(
                                                  listViewShoppingRecord.name,
                                                  ParamType.String,
                                                ),
                                                'tag': serializeParam(
                                                  listViewShoppingRecord
                                                      .kategorien,
                                                  ParamType.String,
                                                ),
                                                'longDes': serializeParam(
                                                  listViewShoppingRecord
                                                      .longDescription,
                                                  ParamType.String,
                                                ),
                                                'image': serializeParam(
                                                  listViewShoppingRecord
                                                      .imageUrl,
                                                  ParamType.String,
                                                ),
                                                'openTimesFrom': serializeParam(
                                                  listViewShoppingRecord
                                                      .oeffnungszeiten
                                                      .map((e) => e.timeFrom)
                                                      .toList(),
                                                  ParamType.String,
                                                  isList: true,
                                                ),
                                                'openTimeTo': serializeParam(
                                                  listViewShoppingRecord
                                                      .oeffnungszeiten
                                                      .map((e) => e.timeTo)
                                                      .toList(),
                                                  ParamType.String,
                                                  isList: true,
                                                ),
                                                'adresse1': serializeParam(
                                                  listViewShoppingRecord
                                                      .address1,
                                                  ParamType.String,
                                                ),
                                                'city': serializeParam(
                                                  listViewShoppingRecord.city,
                                                  ParamType.String,
                                                ),
                                                'country': serializeParam(
                                                  listViewShoppingRecord
                                                      .country,
                                                  ParamType.String,
                                                ),
                                                'zip': serializeParam(
                                                  listViewShoppingRecord
                                                      .zipCode,
                                                  ParamType.String,
                                                ),
                                                'email': serializeParam(
                                                  listViewShoppingRecord.email,
                                                  ParamType.String,
                                                ),
                                                'website': serializeParam(
                                                  listViewShoppingRecord
                                                      .websiteUrl,
                                                  ParamType.String,
                                                ),
                                                'price': serializeParam(
                                                  listViewShoppingRecord
                                                      .preisInformation,
                                                  ParamType.String,
                                                ),
                                                'idShoppping': serializeParam(
                                                  listViewShoppingRecord,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'idShoppping':
                                                    listViewShoppingRecord,
                                              },
                                            );
                                          },
                                          child: EntdeckenContainerWidget(
                                            key: Key(
                                                'Key8zx_${listViewIndex}_of_${listViewShoppingRecordList.length}'),
                                            image:
                                                listViewShoppingRecord.imageUrl,
                                            shortDescription:
                                                listViewShoppingRecord
                                                    .shortDescription,
                                            adresse:
                                                listViewShoppingRecord.address1,
                                            openTime:
                                                functions.openStatusTextMulti(
                                                    listViewShoppingRecord
                                                        .oeffnungszeiten
                                                        .map((e) => e.timeFrom)
                                                        .toList(),
                                                    listViewShoppingRecord
                                                        .oeffnungszeiten
                                                        .map((e) => e.timeTo)
                                                        .toList()),
                                            name: listViewShoppingRecord.name,
                                            open: functions.isOpenNowMulti(
                                                    listViewShoppingRecord
                                                        .oeffnungszeiten
                                                        .map((e) => e.timeFrom)
                                                        .toList(),
                                                    listViewShoppingRecord
                                                        .oeffnungszeiten
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
                                            idShopping: listViewShoppingRecord,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ].addToEnd(SizedBox(width: 16.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Stack(
                    children: [
                      if (!loggedIn && !(FFAppState().parkingLots.isNotEmpty))
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 0.0, 15.0),
                                  child: Text(
                                    'Deine Parkplätze',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xDD000000),
                                          fontSize: 20.0,
                                          letterSpacing: 0.38,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 15.0, 0.0, 25.0),
                                  child: Text(
                                    'Du hast noch keine Parkplätze favorisiert.',
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
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (loggedIn &&
                          !((currentUserDocument?.favoriteParkingLots
                                      .toList() ??
                                  [])
                              .isNotEmpty))
                        AuthUserStreamWidget(
                          builder: (context) => Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 20.0, 0.0, 15.0),
                                    child: Text(
                                      'Deine Parkplätze',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xDD000000),
                                            fontSize: 20.0,
                                            letterSpacing: 0.38,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 15.0, 0.0, 25.0),
                                    child: Text(
                                      'Du hast noch keine Parkplätze favorisiert.',
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
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (loggedIn &&
                          ((currentUserDocument?.favoriteParkingLots
                                      .toList() ??
                                  [])
                              .isNotEmpty))
                        AuthUserStreamWidget(
                          builder: (context) => Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 20.0),
                                    child: Text(
                                      'Deine Parkplätze',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xDD000000),
                                            fontSize: 20.0,
                                            letterSpacing: 0.38,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  StreamBuilder<List<ParkingRecord>>(
                                    stream: queryParkingRecord(),
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
                                      List<ParkingRecord>
                                          listViewParkingRecordList =
                                          snapshot.data!;

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewParkingRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewParkingRecord =
                                              listViewParkingRecordList[
                                                  listViewIndex];
                                          return Visibility(
                                            visible: (currentUserDocument
                                                        ?.favoriteParkingLots
                                                        .toList() ??
                                                    [])
                                                .contains(listViewParkingRecord
                                                    .reference.id),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/parken.png',
                                                          width: 28.0,
                                                          height: 28.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      listViewParkingRecord
                                                          .parkhaus,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xDD000000),
                                                            fontSize: 17.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                    Flexible(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                        child: Text(
                                                          listViewParkingRecord
                                                                      .frei ==
                                                                  '---'
                                                              ? '0'
                                                              : listViewParkingRecord
                                                                  .frei,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF34C759),
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.38,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Divider(
                                                  thickness: 0.5,
                                                  indent: 40.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            ProflileComponentWidget.routeName,
                                            queryParameters: {
                                              'pageTitle': serializeParam(
                                                'Parkplätze',
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          width: 210.0,
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Color(0xFFD8D8DB),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 5.0, 0.0),
                                                child: Icon(
                                                  Icons.search_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 20.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Text(
                                                  'Alle Parkplätze finden',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (!loggedIn && (FFAppState().parkingLots.isNotEmpty))
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 20.0),
                                  child: Text(
                                    'Deine Parkplätze',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xDD000000),
                                          fontSize: 20.0,
                                          letterSpacing: 0.38,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                StreamBuilder<List<ParkingRecord>>(
                                  stream: queryParkingRecord(),
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
                                    List<ParkingRecord>
                                        listViewParkingRecordList =
                                        snapshot.data!;

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewParkingRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewParkingRecord =
                                            listViewParkingRecordList[
                                                listViewIndex];
                                        return Visibility(
                                          visible: FFAppState()
                                              .parkingLots
                                              .contains(listViewParkingRecord
                                                  .reference.id),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                20.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/parken.png',
                                                        width: 28.0,
                                                        height: 28.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    listViewParkingRecord
                                                        .parkhaus,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xDD000000),
                                                          fontSize: 17.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  Flexible(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child: Text(
                                                        listViewParkingRecord
                                                                    .frei ==
                                                                '---'
                                                            ? '0'
                                                            : listViewParkingRecord
                                                                .frei,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleSmall
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                              color: Color(
                                                                  0xFF34C759),
                                                              fontSize: 20.0,
                                                              letterSpacing:
                                                                  0.38,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Divider(
                                                thickness: 0.5,
                                                indent: 40.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          ProflileComponentWidget.routeName,
                                          queryParameters: {
                                            'pageTitle': serializeParam(
                                              'Parkplätze',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width: 210.0,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: Color(0xFFD8D8DB),
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 5.0, 0.0),
                                              child: Icon(
                                                Icons.search_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 20.0,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Text(
                                                'Alle Parkplätze finden',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Reise.png',
                            width: 120.0,
                            height: 120.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 10.0, 0.0, 15.0),
                        child: Text(
                          'Aktivitäten',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            17.0, 0.0, 17.0, 50.0),
                        child: Text(
                          'Entdecke spannende Freizeitaktivitäten in Marburg.',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFFA1A1A0),
                                    fontSize: 17.0,
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
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Reise.png',
                            width: 120.0,
                            height: 120.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 10.0, 0.0, 15.0),
                        child: Text(
                          'Reise Planen',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 50.0),
                        child: Text(
                          'Plane deine nächste Reise oder Mitfahrgelegenheit in Marburg.',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFFA1A1A0),
                                    fontSize: 17.0,
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
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 30.0, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/klein.png',
                            width: 120.0,
                            height: 120.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 10.0, 0.0, 15.0),
                        child: Text(
                          'Kleinanzeigen',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 1.0, 50.0),
                        child: Text(
                          'Finde oder inseriere Kleinanzeigen für Marburg und Umgebung.',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFFA1A1A0),
                                    fontSize: 16.0,
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
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 40.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 30.0, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/entdecken.png',
                            width: 120.0,
                            height: 120.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 10.0, 0.0, 15.0),
                        child: Text(
                          'Verwalte dein Geschäft',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 50.0),
                        child: Text(
                          'Registriere dein Geschäft und nutze tolle Funktionen für Gewerbetreibende.',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFFA1A1A0),
                                    fontSize: 17.0,
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

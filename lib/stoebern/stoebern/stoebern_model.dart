import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'stoebern_widget.dart' show StoebernWidget;
import 'package:flutter/material.dart';

class StoebernModel extends FlutterFlowModel<StoebernWidget> {
  ///  Local state fields for this component.

  List<EventsRecord> allEvents = [];
  void addToAllEvents(EventsRecord item) => allEvents.add(item);
  void removeFromAllEvents(EventsRecord item) => allEvents.remove(item);
  void removeAtIndexFromAllEvents(int index) => allEvents.removeAt(index);
  void insertAtIndexInAllEvents(int index, EventsRecord item) =>
      allEvents.insert(index, item);
  void updateAllEventsAtIndex(int index, Function(EventsRecord) updateFn) =>
      allEvents[index] = updateFn(allEvents[index]);

  List<EventsRecord> shuffledEvents = [];
  void addToShuffledEvents(EventsRecord item) => shuffledEvents.add(item);
  void removeFromShuffledEvents(EventsRecord item) =>
      shuffledEvents.remove(item);
  void removeAtIndexFromShuffledEvents(int index) =>
      shuffledEvents.removeAt(index);
  void insertAtIndexInShuffledEvents(int index, EventsRecord item) =>
      shuffledEvents.insert(index, item);
  void updateShuffledEventsAtIndex(
          int index, Function(EventsRecord) updateFn) =>
      shuffledEvents[index] = updateFn(shuffledEvents[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in stoebern widget.
  List<EventsRecord>? eventsAll;
  // Stores action output result for [Custom Action - shuffleEvent] action in stoebern widget.
  List<EventsRecord>? schufledEvents;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

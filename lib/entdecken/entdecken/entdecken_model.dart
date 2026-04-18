import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'entdecken_widget.dart' show EntdeckenWidget;
import 'package:flutter/material.dart';

class EntdeckenModel extends FlutterFlowModel<EntdeckenWidget> {
  ///  Local state fields for this component.

  List<GastroRecord> allGastro = [];
  void addToAllGastro(GastroRecord item) => allGastro.add(item);
  void removeFromAllGastro(GastroRecord item) => allGastro.remove(item);
  void removeAtIndexFromAllGastro(int index) => allGastro.removeAt(index);
  void insertAtIndexInAllGastro(int index, GastroRecord item) =>
      allGastro.insert(index, item);
  void updateAllGastroAtIndex(int index, Function(GastroRecord) updateFn) =>
      allGastro[index] = updateFn(allGastro[index]);

  List<ShoppingRecord> allShops = [];
  void addToAllShops(ShoppingRecord item) => allShops.add(item);
  void removeFromAllShops(ShoppingRecord item) => allShops.remove(item);
  void removeAtIndexFromAllShops(int index) => allShops.removeAt(index);
  void insertAtIndexInAllShops(int index, ShoppingRecord item) =>
      allShops.insert(index, item);
  void updateAllShopsAtIndex(int index, Function(ShoppingRecord) updateFn) =>
      allShops[index] = updateFn(allShops[index]);

  List<ParkRecord> allParks = [];
  void addToAllParks(ParkRecord item) => allParks.add(item);
  void removeFromAllParks(ParkRecord item) => allParks.remove(item);
  void removeAtIndexFromAllParks(int index) => allParks.removeAt(index);
  void insertAtIndexInAllParks(int index, ParkRecord item) =>
      allParks.insert(index, item);
  void updateAllParksAtIndex(int index, Function(ParkRecord) updateFn) =>
      allParks[index] = updateFn(allParks[index]);

  List<BuchenRecord> allBuchen = [];
  void addToAllBuchen(BuchenRecord item) => allBuchen.add(item);
  void removeFromAllBuchen(BuchenRecord item) => allBuchen.remove(item);
  void removeAtIndexFromAllBuchen(int index) => allBuchen.removeAt(index);
  void insertAtIndexInAllBuchen(int index, BuchenRecord item) =>
      allBuchen.insert(index, item);
  void updateAllBuchenAtIndex(int index, Function(BuchenRecord) updateFn) =>
      allBuchen[index] = updateFn(allBuchen[index]);

  List<GastroRecord> gastroShuffeld = [];
  void addToGastroShuffeld(GastroRecord item) => gastroShuffeld.add(item);
  void removeFromGastroShuffeld(GastroRecord item) =>
      gastroShuffeld.remove(item);
  void removeAtIndexFromGastroShuffeld(int index) =>
      gastroShuffeld.removeAt(index);
  void insertAtIndexInGastroShuffeld(int index, GastroRecord item) =>
      gastroShuffeld.insert(index, item);
  void updateGastroShuffeldAtIndex(
          int index, Function(GastroRecord) updateFn) =>
      gastroShuffeld[index] = updateFn(gastroShuffeld[index]);

  List<ShoppingRecord> shopsShuffeld = [];
  void addToShopsShuffeld(ShoppingRecord item) => shopsShuffeld.add(item);
  void removeFromShopsShuffeld(ShoppingRecord item) =>
      shopsShuffeld.remove(item);
  void removeAtIndexFromShopsShuffeld(int index) =>
      shopsShuffeld.removeAt(index);
  void insertAtIndexInShopsShuffeld(int index, ShoppingRecord item) =>
      shopsShuffeld.insert(index, item);
  void updateShopsShuffeldAtIndex(
          int index, Function(ShoppingRecord) updateFn) =>
      shopsShuffeld[index] = updateFn(shopsShuffeld[index]);

  List<ParkRecord> parksShuffeld = [];
  void addToParksShuffeld(ParkRecord item) => parksShuffeld.add(item);
  void removeFromParksShuffeld(ParkRecord item) => parksShuffeld.remove(item);
  void removeAtIndexFromParksShuffeld(int index) =>
      parksShuffeld.removeAt(index);
  void insertAtIndexInParksShuffeld(int index, ParkRecord item) =>
      parksShuffeld.insert(index, item);
  void updateParksShuffeldAtIndex(int index, Function(ParkRecord) updateFn) =>
      parksShuffeld[index] = updateFn(parksShuffeld[index]);

  List<BuchenRecord> buchenShuffeld = [];
  void addToBuchenShuffeld(BuchenRecord item) => buchenShuffeld.add(item);
  void removeFromBuchenShuffeld(BuchenRecord item) =>
      buchenShuffeld.remove(item);
  void removeAtIndexFromBuchenShuffeld(int index) =>
      buchenShuffeld.removeAt(index);
  void insertAtIndexInBuchenShuffeld(int index, BuchenRecord item) =>
      buchenShuffeld.insert(index, item);
  void updateBuchenShuffeldAtIndex(
          int index, Function(BuchenRecord) updateFn) =>
      buchenShuffeld[index] = updateFn(buchenShuffeld[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in entdecken widget.
  List<GastroRecord>? gastrosAll;
  // Stores action output result for [Firestore Query - Query a collection] action in entdecken widget.
  List<ShoppingRecord>? shopsAll;
  // Stores action output result for [Firestore Query - Query a collection] action in entdecken widget.
  List<ParkRecord>? parksAll;
  // Stores action output result for [Firestore Query - Query a collection] action in entdecken widget.
  List<BuchenRecord>? buchenAll;
  // Stores action output result for [Custom Action - shuffleGastros] action in entdecken widget.
  List<GastroRecord>? shuffledGastro;
  // Stores action output result for [Custom Action - shuffleShops] action in entdecken widget.
  List<ShoppingRecord>? shuffledShops;
  // Stores action output result for [Custom Action - shuffleParks] action in entdecken widget.
  List<ParkRecord>? shuffledParks;
  // Stores action output result for [Custom Action - shuffleBuchen] action in entdecken widget.
  List<BuchenRecord>? shuffledBuchen;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

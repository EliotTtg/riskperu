import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _sidebar = false;
  bool get sidebar => _sidebar;
  set sidebar(bool value) {
    _sidebar = value;
  }

  List<String> _listComent = [];
  List<String> get listComent => _listComent;
  set listComent(List<String> value) {
    _listComent = value;
  }

  void addToListComent(String value) {
    listComent.add(value);
  }

  void removeFromListComent(String value) {
    listComent.remove(value);
  }

  void removeAtIndexFromListComent(int index) {
    listComent.removeAt(index);
  }

  void updateListComentAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listComent[index] = updateFn(_listComent[index]);
  }

  void insertAtIndexInListComent(int index, String value) {
    listComent.insert(index, value);
  }

  bool _stateConfirmation = false;
  bool get stateConfirmation => _stateConfirmation;
  set stateConfirmation(bool value) {
    _stateConfirmation = value;
  }

  List<String> _shoppingcart = [];
  List<String> get shoppingcart => _shoppingcart;
  set shoppingcart(List<String> value) {
    _shoppingcart = value;
  }

  void addToShoppingcart(String value) {
    shoppingcart.add(value);
  }

  void removeFromShoppingcart(String value) {
    shoppingcart.remove(value);
  }

  void removeAtIndexFromShoppingcart(int index) {
    shoppingcart.removeAt(index);
  }

  void updateShoppingcartAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    shoppingcart[index] = updateFn(_shoppingcart[index]);
  }

  void insertAtIndexInShoppingcart(int index, String value) {
    shoppingcart.insert(index, value);
  }
}

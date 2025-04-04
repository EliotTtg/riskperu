import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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

  final _respuestasManager = StreamRequestManager<List<RespuestasRecord>>();
  Stream<List<RespuestasRecord>> respuestas({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<RespuestasRecord>> Function() requestFn,
  }) =>
      _respuestasManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearRespuestasCache() => _respuestasManager.clear();
  void clearRespuestasCacheKey(String? uniqueKey) =>
      _respuestasManager.clearRequest(uniqueKey);

  final _usersAnswersManager = StreamRequestManager<List<UsersAnswersRecord>>();
  Stream<List<UsersAnswersRecord>> usersAnswers({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<UsersAnswersRecord>> Function() requestFn,
  }) =>
      _usersAnswersManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUsersAnswersCache() => _usersAnswersManager.clear();
  void clearUsersAnswersCacheKey(String? uniqueKey) =>
      _usersAnswersManager.clearRequest(uniqueKey);

  final _respuestaStateManager =
      StreamRequestManager<List<RespuestaStateRecord>>();
  Stream<List<RespuestaStateRecord>> respuestaState({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<RespuestaStateRecord>> Function() requestFn,
  }) =>
      _respuestaStateManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearRespuestaStateCache() => _respuestaStateManager.clear();
  void clearRespuestaStateCacheKey(String? uniqueKey) =>
      _respuestaStateManager.clearRequest(uniqueKey);
}

import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class TransportationProvider with ChangeNotifier{
  List _methodsList = [];
  //int _queryPage = 1;
  UnmodifiableListView get methodsList => UnmodifiableListView(_methodsList);

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> fetchMethods() async {
    setLoading(true);
    final String response = await rootBundle.loadString('assets/dummy_data.json');
    final data = await json.decode(response);
    debugPrint('dummy data = $data');
    _methodsList = data["methods"];
    setLoading(false);
    notifyListeners();
  }
}
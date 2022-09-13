import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../../data/datasources/dio/api_response.dart';
import '../../data/datasources/dio/dio_client.dart';

class DCLTNDocumentsProvider extends ChangeNotifier{
  List _documentsList = [];

  UnmodifiableListView get documentsList => UnmodifiableListView(_documentsList);

  final DioClient _dioClient = DioClient();
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getDCLTNDocuments({required int portCD, required double dcltnLSN, required int routePortCode }) async {
    setLoading(true);
    Map<String, dynamic> _body = {
      'PortCD': portCD,
      'DcltnlSN': dcltnLSN,
      'routePortCode': routePortCode,
    };
    APIResponse res = await _dioClient.publicGet(
        '/whatever/the/endpoint/is',
        data: _body);
    if (res.code >= 400) {
      _documentsList = [];
    }
    _documentsList = res.data;
    setLoading(false);
    notifyListeners();
  }

  //TODO: Call the Api inside any stateful widget using the below line of code
//  context.read<DCLTNDocumentsProvider>().getDCLTNDocuments();

}
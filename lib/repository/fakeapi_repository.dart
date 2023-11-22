

import 'package:dio/dio.dart';

import '../model/fakeapi_model.dart';

class FakeApiRepository {

  var _dio = Dio();

  FakeApiRepository () {
    _dio = Dio();
    _dio.options.baseUrl = "https://fakestoreapi.com/";
  }

  Future<FakeApiListModel> getHomeItems() async {
    var url = "products?limit=6";
    var res = await _dio.get(url);

    return FakeApiListModel.fromJson(res.data);
  }

  Future<FakeApiListModel> getAllItems() async {
    var url = "https://fakestoreapi.com/products";
    var res = await _dio.get(url);

    return FakeApiListModel.fromJson(res.data);
  }

  Future<FakeApiListModel> getCategoryItem(String category) async {
    var url = "https://fakestoreapi.com/products/category/$category";
    var res = await _dio.get(url);
    return FakeApiListModel.fromJson(res.data);
  }

}
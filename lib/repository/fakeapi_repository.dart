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
    var url = "products";
    var res = await _dio.get(url);

    return FakeApiListModel.fromJson(res.data);
  }

  Future<FakeApiListModel> getCategoryItem(String category) async {
    var url = "products/category/$category";
    var res = await _dio.get(url);
    return FakeApiListModel.fromJson(res.data);
  }

  //tem de usar a classe FakeApiItem, para retornar um unico item,
  //ao invés da lista "results" que o "ListModel" gera
  //precisa ser um item unico, pois é feito um map no controller
  //que para cada retorno da repository, esse item é inserido numa lista
  //no proprio controller
  Future<FakeApiItem> getCartItems(int id) async {
    var url = "products/$id";
    var res = await _dio.get(url);
    return FakeApiItem.fromJson(res.data);
  }

}
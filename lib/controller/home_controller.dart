import 'package:flutter/material.dart';
import 'package:marketplace/model/fakeapi_model.dart';
import 'package:marketplace/repository/fakeapi_repository.dart';

class HomeController extends ChangeNotifier {

  FakeApiRepository fakeApiRepository = FakeApiRepository();

  var _homeItems = FakeApiListModel([]);
  FakeApiListModel get homeItems => _homeItems;

  var _allItems = FakeApiListModel([]);
  FakeApiListModel get allItems => _allItems;

  var _categoryItems = FakeApiListModel([]);
  FakeApiListModel get categoryItems => _categoryItems;

  //fazendo a chamada http do repository,
  //para preencher a tela inicial com o retorno da api
  Future<void> getHomeitems() async {
    _homeItems = await fakeApiRepository.getHomeItems();
    //notificando os ouvintes desse controller para as mudanças (atualizar a lista)
    notifyListeners();
  }

  Future<void> getAllitems() async {
    if(allItems.results.isEmpty) {
      _allItems = await fakeApiRepository.getAllItems();
      notifyListeners();
    } return;
  }

  Future<void> getCategpryitem(String category) async {
      _categoryItems = await fakeApiRepository.getCategoryItem(category);
      notifyListeners();
  }

  //limpando a lista, visto que todas as categorias compartilham a mesma lista
  void clearCategoryList() {
    _categoryItems.results.clear();
  }

}
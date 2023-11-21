import 'package:flutter/material.dart';
import 'package:marketplace/model/fakeapi_model.dart';
import 'package:marketplace/repository/fakeapi_repository.dart';

class HomeController extends ChangeNotifier {

  FakeApiRepository fakeApiRepository = FakeApiRepository();

  var _homeItems = FakeApiListModel([]);
  FakeApiListModel get homeItems => _homeItems;

  //fazendo a chamada http do repository,
  //para preencher a tela inicial com o retorno da api
  Future<void> getHomeitems() async {
    _homeItems = await fakeApiRepository.getHomeItems();
    print(homeItems.results.length);
    //notificando os ouvintes desse controller para as mudanças (atualizar a lista)
    notifyListeners();
  }

  Future<void> getAllitems() async {
    _homeItems = await fakeApiRepository.getHomeItems();
    notifyListeners();
  }




}
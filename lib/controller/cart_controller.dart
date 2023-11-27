import 'package:flutter/material.dart';
import 'package:marketplace/model/fakeapi_model.dart';
import 'package:hive/hive.dart';

class CartController extends ChangeNotifier {

  FakeApiItem cardInfo = FakeApiItem(qnty: 1);

  final _itemList = FakeApiListModel([]);
  FakeApiListModel get itemList => _itemList;

  double _totalValue = 0;
  double get totalValue => _totalValue;

  void saveTotalValue () {

   // SharedPreferences prefs = await SharedPreferences.getInstance();


  }

  void insertItem (FakeApiItem fakeApiItem) {

    //vendo se o item já existe no carrinho
    if(itemList.results.contains(fakeApiItem)) {
      //pegando o index do item na lista
      int index = itemList.results.indexOf(fakeApiItem);
      //incrementando mais um item
      itemList.results[index].qnty++;
    } else {
      itemList.results.add(fakeApiItem);
    }

    getTotalValue();

    notifyListeners();

  }

  void increment(FakeApiItem fakeApiItem) {
     int index = itemList.results.indexOf(fakeApiItem);
     itemList.results[index].qnty++;
     getTotalValue();
     notifyListeners();
  }

  void decrement(FakeApiItem fakeApiItem){
    int index = _itemList.results.indexOf(fakeApiItem);

      if (_itemList.results[index].qnty > 1) {
        _itemList.results[index].qnty--;
      } else {
        _itemList.results.removeAt(index);
      }

    getTotalValue();

    notifyListeners();
  }

  void getTotalValue () {

      //zerando o valor para ter uma melhor consistencia dos valores
      _totalValue = 0;

      //pra cada item do mapa, ele pega o valor, multiplica pela quantidade,
      //e atribui a quantidade
      _itemList.results.forEach((element) {

        double teste = 0;

        _totalValue = _totalValue + (element.price! * element.qnty) ;

        notifyListeners();
      });

  }


  }
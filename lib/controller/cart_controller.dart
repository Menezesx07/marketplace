import 'package:flutter/material.dart';
import 'package:marketplace/model/fakeapi_model.dart';
import 'package:hive/hive.dart';
import '../repository/fakeapi_repository.dart';

class CartController extends ChangeNotifier {

  FakeApiRepository fakeApiRepository = FakeApiRepository();

  //vai ser usado nessa box, o ID do item como key,
  //e o value vai ser a quantidade daquele mesmo item no carrinho
  //ao iniciar o app, a lista do hive é sincronizada com a local
  final _cartBox = Hive.box('cartBox');

  FakeApiItem cardInfo = FakeApiItem(qnty: 1);

  //lista local
  final _itemList = FakeApiListModel([]);
  FakeApiListModel get itemList => _itemList;

  double _totalValue = 0;
  double get totalValue => _totalValue;

  int hiveNum = 0;

  //remover
  void hiveRefresh() {
    List<dynamic> chaves = _cartBox.keys.toList();
    List<dynamic> valores = _cartBox.values.toList();

    hiveNum = chaves.length;
    notifyListeners();
    print(chaves);
    print(valores);
  }

   getHiveItemCart() async {
    //pegando todos os itens da lista no hive
    List<dynamic> chaves = _cartBox.keys.toList();

    print("antes: ${itemList.results.length}");

    //future await para segurar o codigo até terminar o map
    //não sei o motivo, mas tem de usar os 2 await
    await Future.wait(chaves.map((element) async {
      //fazendo a chamada pra api de cada ID individual do hive,
      //e sincronizando com a lista local
      cardInfo = await fakeApiRepository.getCartItems(element);
      //atribuindo a quantidade de itens
      cardInfo.qnty = _cartBox.get(cardInfo.id);
      //adicionado o item a lista local
      _itemList.results.add(cardInfo);

    }));

    print("depois: ${itemList.results.length}");

    getTotalValue();
    notifyListeners();

  }


  void insertItem(FakeApiItem fakeApiItem) {

    cardInfo = fakeApiItem;
    int qnty = 1;

    //vendo se o item já existe no carrinho
    if(itemList.results.contains(cardInfo.id)) {
        //pegando o index do item na lista
        int index = itemList.results.indexOf(fakeApiItem);
        //incrementando mais um item localmente
        qnty = ++itemList.results[index].qnty;
        //sincronizando com o hive
        _cartBox.put(cardInfo.id, qnty);
    //caso não exista, é adicionado a lista local, e no hive
    } else {
        _cartBox.put(cardInfo.id, qnty);
        itemList.results.add(fakeApiItem);
    }

    getTotalValue();
    notifyListeners();

  }

  void increment(FakeApiItem fakeApiItem) {

    cardInfo = fakeApiItem;
     //pegando o index do item na lista local
     int index = itemList.results.indexOf(fakeApiItem);
     //incrementando localmente
     int qnty = ++itemList.results[index].qnty;
     //sincronizando com o hive
     _cartBox.put(cardInfo.id, qnty);

     getTotalValue();
     notifyListeners();
  }

  void decrement(FakeApiItem fakeApiItem){

    cardInfo = fakeApiItem;
    //pegando o index do item na lista local
    int index = _itemList.results.indexOf(fakeApiItem);
      //se o contador for maior que 1, ele apenas decrementa o item
      if (_itemList.results[index].qnty > 1) {
        int qnty = --itemList.results[index].qnty;
        _cartBox.put(cardInfo.id, qnty);
       //mas caso o contador for menor que 1, como não da para ficar 0, é removido
      } else {
        //removendo o item localmente e sincroniazndo com o hive
        _itemList.results.removeAt(index);
        _cartBox.delete(cardInfo.id);
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
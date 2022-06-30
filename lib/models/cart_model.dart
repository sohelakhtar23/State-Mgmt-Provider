import 'package:flutter/foundation.dart';

class CartModel extends ChangeNotifier {
  final List<String> _itemsId = [];

  List<String> get items => _itemsId;
  int get total => _itemsId.length;

  void add(String item) {
    _itemsId.add(item);
    notifyListeners();
  }

  void remove(String item) {
    _itemsId.remove(item);
    notifyListeners();
  }
}

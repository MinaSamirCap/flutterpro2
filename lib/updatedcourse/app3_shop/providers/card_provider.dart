import 'package:flutter/foundation.dart';

class CardItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CardItem(this.id, this.title, this.quantity, this.price);
}

class Card with ChangeNotifier {
  Map<String, CardItem> _items;

  Map<String, CardItem> get items {
    return {..._items};
  }


  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      /// change quantity ...
      _items.update(productId, (oldItem)=>CardItem(oldItem.id, oldItem.title, oldItem.quantity + 1, oldItem.price));
    } else {
      _items.putIfAbsent(productId,
          () => CardItem(DateTime.now().toString(), title, 1, price));
    }
  }
}

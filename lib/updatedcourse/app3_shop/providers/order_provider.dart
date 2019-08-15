import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'cart_provider.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem(this.id, this.amount, this.products, this.dateTime);
}

class Order with ChangeNotifier {
  List<OrderItem> _orders = [];
  final String authToken;

  Order(this.authToken, this._orders);

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> fetchAndSetOrders() async {
    final url = 'https://fluttersetup-88480.firebaseio.com/orders.json?auth=$authToken';
    final response = await http.get(url);

    final List<OrderItem> loadedOrders = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((orderId, orderData) {
      loadedOrders.add(OrderItem(
          orderId,
          orderData['amount'],
          (orderData['products'] as List<dynamic>)
              .map((item) => CartItem(
                  item['id'], item['title'], item['quantity'], item['price']))
              .toList(),
          DateTime.parse(orderData['dateTime'])));
    });

    _orders = loadedOrders;
    notifyListeners();
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url = 'https://fluttersetup-88480.firebaseio.com/orders.json?auth=$authToken';
    final timestamp = DateTime.now();

    final response = await http.post(url,
        body: json.encode({
          'amount': total,
          'dateTime': timestamp.toIso8601String(),
          'products': cartProducts
              .map((item) => {
                    'id': item.id,
                    'price': item.price,
                    'quantity': item.quantity,
                    'title': item.title
                  })
              .toList()
        }));

    _orders.insert(
        0,
        OrderItem(json.decode(response.body)['name'], total, cartProducts,
            timestamp));

    notifyListeners();
  }
}

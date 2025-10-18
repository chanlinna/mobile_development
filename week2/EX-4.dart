enum DeliveryStatus {delivered, pickup}

class Product {
  final String name;
  final double _price;
  int _quantity;

  Product({required this.name, required double price, required int quantity}): _price = price, _quantity = quantity;

  double get price => _price;
  int get quantity => _quantity;

  //check if the products is out of stock
  bool get isOutOfStock => _quantity == 0;

  //decrease the quantity when customer order
  void decreaseQuantity(int qnt) {
    if (isOutOfStock) {
      throw Exception("$name is out of stock");
    }
    if (qnt <= 0) return;
    if (qnt > _quantity) {
      throw Exception("Not enough stock for $name");
    }

    _quantity -= qnt;

    if (_quantity == 0) {
      print("$name is now out of stock!");
    }
  }

  void restock(int qnt) {
    if (qnt <= 0) {
      throw Exception("Restock amount must be positive");
    }
    _quantity += qnt;
    print("$name restocked by $qnt units. New stock: $_quantity");
  }

  @override
  String toString() => "$name - \$${_price} (${_quantity > 0 ? 'Stock: $_quantity' : 'Out of stock'})";
}
class OrderItem {
  final Product product;
  final int orderQuantity;

  OrderItem({ required this.product, required this.orderQuantity})
  {
    product.decreaseQuantity(orderQuantity);
  }

  //total price of a product
  double get totalPrice => product.price * orderQuantity;

  @override
  String toString() => '${product.name} x $orderQuantity = \$${totalPrice}';

}

class Customer {
  final String name;


  Customer(this.name);
}

class Address{
  final String _street;
  final String _city;
  final String _zipCode;

  Address(this._street, this._city, this._zipCode);

  String get street => _street;
  String get city => _city;
  String get zipCode => _zipCode;

  @override
  String toString(){
    return '$_street, $_city, $_zipCode';
  }
}
class Delivery {
  final DeliveryStatus type;
  final Address? address;

  Delivery(this.type, this.address);

  Delivery.delivered(Address address): this(DeliveryStatus.delivered, address);

  Delivery.pickup(): this(DeliveryStatus.pickup, null);

  @override
  String toString() {
    if (type == DeliveryStatus.pickup) {
      return "Pickup";
    } else {
      return "Delivered to $address";
    }
  }
}


class Order {
  final List<OrderItem> items;
  Customer customer;
  final Delivery delivery;

  Order(this.items, this.customer, this.delivery);

  Order.delivered(List<OrderItem> items, Customer customer, Address address)
      : this(items, customer, Delivery.delivered(address));

  Order.pickup(List<OrderItem> items, Customer customer)
      : this(items, customer, Delivery.pickup());

  //when customer order more items
  void addItem(OrderItem newItem) {
    for (var item in items) {
      if (item.product == newItem.product) {
        item.product.decreaseQuantity(newItem.orderQuantity);

        final updatedItem = OrderItem(
          product: item.product,
          orderQuantity: item.orderQuantity + newItem.orderQuantity,
        );

        //replace the old one with the update
        final index = items.indexOf(item);
        items[index] = updatedItem;
        return;
      }
    }

    items.add(newItem);
  }

  double getTotalAmount(){
    double total=0;
    for(var i in items){
      total += i.totalPrice;
    }
    return total;
  }

  void cancel() {
    for (var item in items) {
      item.product.restock(item.orderQuantity);
    }
    items.clear();
    print("Order canceled. All items returned to stock.");
  }


  @override
  String toString() {
    final itemList = items.map((i) => '  • ${i.toString()}').join('\n');
    final divider = '-' * 40;

    return '''
      $divider
      Order Summary
      Customer: ${customer.name}
      Delivery: $delivery
      $divider
      Items:
      $itemList
      $divider
      Total: \$${getTotalAmount().toStringAsFixed(2)}
      $divider
      ''';
  }
}

void main() {
  var customer1 = Customer("V");
  var customer2 = Customer("K");

  var product1 = Product(name:"Laptop", price:1200, quantity: 10);
  var product2 = Product(name:"Mouse", price:25, quantity: 20);

  var address = Address("123 Main St", "Phnom Penh", "12000");

  var order1 = Order.delivered(
      [OrderItem(product: product1, orderQuantity: 7), OrderItem(product: product2, orderQuantity: 2)], customer1, address);

  var order2 = Order.pickup(
      [OrderItem(product: product1, orderQuantity: 3), OrderItem(product: product2, orderQuantity: 2)], customer2);

  var newItem = OrderItem(product: product2, orderQuantity: 2);
  order2.addItem(newItem);

  product1.restock(10);
  print(order1);
  print(order2);

}



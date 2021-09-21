import 'item.dart';

class Inventory {
  static List<Item> _inventory = [];

  static bool addItem(Item newItem) {
    _inventory.add(newItem);
    return true;
  }

  static void increaseQty(int qty, int index) {
    _inventory[index].addQty(qty);
  }

  static bool decreaseQty(int qty, int index) {
    return _inventory[index].subQty(qty);
  }

  static void deleteItem(int itemIndex) {
    _inventory.removeAt(itemIndex);
  }

  static void showItem() {
    for (var item in _inventory) {
      print(item.showItem());
    }
  }

  static int searchItem(String itemId) {
    for (var i = 0; i < _inventory.length; i++) {
      if (_inventory[i].id == itemId) return i;
    }
    return -1;
  }

  static int itemCounter() => _inventory.length;
}

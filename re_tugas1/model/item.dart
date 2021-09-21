class Item {
  String _id;
  String _itemName;
  int _qty;

  Item(this._id, this._itemName, this._qty);

  String get id => _id;

  void addQty(int qty) {
    this._qty += qty;
  }

  bool subQty(int qty) {
    if (this._qty < qty) return false;
    else this._qty -= qty;
    return true;
  }

  String showItem() {
    return ''
        '\nID   : $_id'
        '\nNama : $_itemName'
        '\nStok : $_qty';
  }
}

class Atm {
  final String _cardNumber;
  final String _name;
  int _balance;

  Atm(
    this._cardNumber,
    this._name,
    this._balance,
  );

  String get cardNumber => _cardNumber;
  String get name => _name;
  int get balance => _balance;

  void transferBalance(Atm cardDestination, int amount) {
    _balance -= amount;
    cardDestination._balance += amount;
  }

  void withdrawBalance(int amount) {
    _balance -= amount;
  }

  void depositBalance(int amount) {
    _balance += amount;
  }
}

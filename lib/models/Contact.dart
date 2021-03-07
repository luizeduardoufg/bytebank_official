class Contact {
  final int _id;
  final String _name;
  final String _accountNumber;

  Contact(this._id, this._name, this._accountNumber);

  get id => _id;
  get name => _name;
  get accountNumber => _accountNumber;

  @override
  String toString() {
    return 'Contact{name: $_name, accountNumber: $_accountNumber}';
  }
}

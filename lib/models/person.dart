class Person {
  String _personName;
  String _personMessage;
  String _smallPicture;

  Person(this._personName, this._personMessage,this._smallPicture);
  
  String get personName => _personName;

  set personName(String value) {
    _personName = value;
  }

  String get personMessage => _personMessage;

  set personMessage(String value) {
    _personMessage = value;
  }
  
  String get smallPicture => _smallPicture;

  set smallPicture(String value) {
    _smallPicture = value;
  }

  
}

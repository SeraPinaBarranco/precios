import 'package:flutter/foundation.dart';

class MyProvider with ChangeNotifier {
  int _numero = 0;

  
  setNumero()  {
    _numero += 1 ;
    notifyListeners();
  }

  int get getNumero => _numero;
  
}

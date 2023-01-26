import 'package:flutter/cupertino.dart';

class NavbarProvider extends ChangeNotifier{
  int currentIndex = 1;
  void changeNaveBar(int index){
      currentIndex = index;
      notifyListeners();
  }
}
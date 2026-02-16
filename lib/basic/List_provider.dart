import 'package:flutter/widgets.dart';

class ListProvider extends ChangeNotifier {
  List<Map<String, dynamic>> data = [];

  List<Map<String, dynamic>> get getData => data;

  void increment(Map<String, dynamic> num) {
    data.add(num);
    notifyListeners();
  }

  void update(Map<String, dynamic> updateData, index) {
    data[index] = updateData;
    notifyListeners();
  }

  void delete(index) {
    data.removeAt(index);
    notifyListeners();




  }
}

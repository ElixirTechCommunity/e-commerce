import 'package:http/http.dart' as http;
import 'dart:convert';

// List<Map<String, dynamic>> allListCart = [
//   {
//     'id': 1,
//     'name': 'Air Jordan',
//     'image': 'assets/items_images/airjordan.png',
//     'price': 2500
//   },
//   {'id': 2, 'name': 'Air Jordan', 'image': 'assets/items_images/airjordan.png'},
//   {'id': 3, 'name': 'Air Jordan', 'image': 'assets/items_images/airjordan.png'},
//   {'id': 4, 'name': 'Air Jordan', 'image': 'assets/items_images/airjordan.png'},
//   {'id': 5, 'name': 'Air Jordan', 'image': 'assets/items_images/airjordan.png'},
//   {'id': 6, 'name': 'Air Jordan', 'image': 'assets/items_images/airjordan.png'},
// ];

Future getCartItems() async {
  try {
    final result = await http.get(
      Uri.parse("https://fakestoreapi.com/products"),
    );
    final data = jsonDecode(result.body);
    return data;
  } catch (e) {
    rethrow;
  }
}



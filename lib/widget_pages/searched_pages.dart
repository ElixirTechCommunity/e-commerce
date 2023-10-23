import 'package:flutter/material.dart';
import 'package:online_shopping_app/widget_pages/cart_page_widget.dart';

class SearchedPage extends StatelessWidget {
  const SearchedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // leading: GestureDetector(
          //   onTap: () {
          //     Navigator.of(context)
          //         .pop();
          //   },
          //   child: const Icon(
          //     Icons.arrow_back,
          //     color: Color.fromARGB(158, 0, 0, 0),
          //     size: 40,
          //   ),
          // ),
          title: const Text(
            "Let's Shop",
          ),
          actions: [
            IconButton(
              iconSize: 40,
              color: Colors.black,
              splashColor: const Color.fromARGB(255, 253, 0, 84),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const CartPage()));
              },
              icon: const Icon(Icons.shopping_bag_outlined),
            ),
          ],
        ),
      ),
    );
  }
}

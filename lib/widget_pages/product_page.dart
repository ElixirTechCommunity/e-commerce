import 'package:flutter/material.dart';
// import 'package:online_shopping_app/all_lists_detail/all_list_chipdetail.dart';
import 'package:online_shopping_app/cart_provider.dart';
import 'package:online_shopping_app/widget_pages/cart_page_widget.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  final Map<String, dynamic> product;
  const ProductPage({super.key, required this.product});

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
      body: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                // width: double.infinity,
                child: Card(
                  color: const Color.fromARGB(255, 231, 211, 218),
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  child: Text(
                    product['title'].toString(),
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                // width: double.infinity,
                child: Card(
                  color: const Color.fromARGB(255, 231, 211, 218),
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  child: Text(
                    product['description'].toString(),
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 450,
                  width: 400,
                  child: Card(
                      color: const Color.fromARGB(255, 231, 211, 218),
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      child: Image.network(product['image'].toString())),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Rs.${product['price'] * 5}",
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    backgroundColor: Color.fromARGB(255, 203, 181, 188)),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 198, 37, 90))),
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .addItem(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Item Added To Cart")));
                  },
                  child: const Text(
                    "Add To Cart",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'TitleFont',
                        fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

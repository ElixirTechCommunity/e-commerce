import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:online_shopping_app/all_lists_detail/all_list_chipdetail.dart';
import 'package:online_shopping_app/cart_provider.dart';
import 'package:online_shopping_app/widget_pages/home_page_widget.dart';
// import 'package:online_shopping_app/widget_pages/home_page_widget.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    // print(cart);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            child: const Icon(
              Icons.arrow_back,
              color: Color.fromARGB(158, 0, 0, 0),
              size: 40,
            ),
          ),
          title: const Text(
            "Let's Shop",
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      style: ListTileStyle.list,
                      leading: CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(255, 214, 205, 208),
                        radius: 30,
                        backgroundImage:
                            NetworkImage(cart[index]['image'].toString()),
                      ),
                      title: Text(cart[index]['title'].toString()),
                      subtitle: Text("Rs. ${cart[index]['price'] * 5}"),
                      titleTextStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                      trailing: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Remove Item"),
                                  content: const Text(
                                      "Are You Sure You Want TO Remove Item?"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Provider.of<CartProvider>(context,
                                                  listen: false)
                                              .removeItem(cart[index]);
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          "Yes",
                                          style: TextStyle(color: Colors.red),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          "No",
                                          style: TextStyle(color: Colors.green),
                                        ))
                                  ],
                                );
                              });
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Color.fromRGBO(229, 57, 53, 1),
                          size: 35,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

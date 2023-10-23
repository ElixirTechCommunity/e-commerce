import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_shopping_app/all_lists_detail/all_list_chipdetail.dart';
import 'package:online_shopping_app/layout_widget/chip_options.dart';
import 'package:lottie/lottie.dart';
import 'package:online_shopping_app/widget_pages/cart_page_widget.dart';
import 'package:online_shopping_app/widget_pages/product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageWidget();
}

// int check = 0;
const border = OutlineInputBorder(
    gapPadding: 20,
    borderRadius: BorderRadius.all(
      Radius.circular(50),
    ),
    borderSide: BorderSide(color: Color.fromARGB(255, 216, 168, 184)));

// var foundList = [];

class _HomePageWidget extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCartItems(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> fetchedItems) {
        if (fetchedItems.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: Lottie.asset("assets/loading.json")),
          );
        }
        final data = fetchedItems.data;

        TextEditingController searchedItem = TextEditingController();
        // print(data);
        return SafeArea(
          child: Scaffold(
            ///To Be Change
            ///Leading Icon  has to be changed with json lottie
            ///On clicking this theme of app will change to purple
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.filter_vintage_rounded,
                  color: Colors.pink,
                  size: 40,
                ),
              ),
              title: const Text(
                "Let's Shop",
              ),
              actions: [
                IconButton(
                  iconSize: 40,
                  color: Colors.black,
                  splashColor: const Color.fromARGB(255, 253, 0, 84),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CartPage()));
                  },
                  icon: const Icon(Icons.shopping_bag_outlined),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: SizedBox(
                      height: 60,

                      ///TextField
                      ///
                      ///
                      ///
                      ///
                      ///
                      child: TextField(
                        controller: searchedItem,
                        // onSubmitted: (value) {
                        //   if (value.trim().isNotEmpty) {
                        //     var foundData = data.where((element) =>
                        //         element['description']
                        //             .toString()
                        //             .contains(value));
                        //     print(value);
                        //     print(foundData);
                        //   }
                        // },
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        onTapOutside: (event) =>
                            FocusScope.of(context).requestFocus(FocusNode()),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              size: 25,
                              weight: 600,
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 215, 190, 198),
                            hintText: "Bag",
                            enabledBorder: border,
                            focusedBorder: border),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (int i = 0; i < items.length; i++) ...[
                          const SizedBox(
                            width: 5,
                          ),
                          SlidingChipOption(chipName: items[i]),
                        ]
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return ProductPage(product: data[index]);
                            }));
                          },
                          child: Card(
                            color: const Color.fromARGB(255, 213, 121, 151),
                            margin: const EdgeInsets.only(bottom: 12),
                            child: Column(
                              children: [
                                // Text(data[index]['id'].toString()),
                                Text(
                                  data[index]['title'].toString(),
                                  style: const TextStyle(fontSize: 30),
                                ),
                                Image.network(
                                  data[index]['image'].toString(),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

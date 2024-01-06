import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tubes_market_hewan/data/data.dart';
import 'package:tubes_market_hewan/screen/product_detail.dart';
import 'package:tubes_market_hewan/style/color.dart';
import 'package:tubes_market_hewan/style/custom_container.dart';
import 'package:tubes_market_hewan/style/text.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final db = FirebaseFirestore.instance;
  TextEditingController searchController = TextEditingController();
  var searchName = "";
  bool isDescending = false;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 50,
            decoration: boxWhiteBorderRounded,
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchName = value;
                });
              },
              controller: searchController,
              style: text14_6navy,
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                prefixIcon: FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 18,
                  color: navy,
                ),
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 35,
                  minHeight: 15,
                ),
                suffixIcon: InkWell(
                  onTap: () => setState(() {
                    isDescending = !isDescending;
                  }),
                  child: FaIcon(
                    isDescending
                        ? FontAwesomeIcons.filterCircleDollar
                        : FontAwesomeIcons.filter,
                    size: 18,
                    color: navy,
                  ),
                ),
                suffixIconConstraints: const BoxConstraints(
                  minWidth: 35,
                  minHeight: 15,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: StreamBuilder(
                stream: db
                    .collection("product")
                    .where("name", isGreaterThanOrEqualTo: searchName)
                    .where("name", isLessThanOrEqualTo: "$searchName\uf7ff")
                    .orderBy("name", descending: isDescending)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Error"),
                    );
                  }
                  var data = snapshot.data!.docs;
                  return GridView.builder(
                    itemCount: data.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 250.0,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemBuilder: (context, index) {
                      // return Text(data[index]['name']);
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetail(
                                    data: ProductData(
                                        id: data[index].id,
                                        image: data[index]['image'],
                                        name: data[index]['name'],
                                        price: data[index]['price'],
                                        desc: data[index]['desc'],
                                        stock: data[index]['stock'])),
                              ));
                        },
                        child: Container(
                          decoration: cardContainer,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 150,
                                width: mediaQuery.size.width / 2,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(data[index]['image']),
                                      fit: BoxFit.cover),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index]['name'],
                                      style: text12_6navy,
                                    ),
                                    Text(
                                      "Rp ${data[index]['price']}",
                                      style: text14_6navy,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}

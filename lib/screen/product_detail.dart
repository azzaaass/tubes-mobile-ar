import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tubes_market_hewan/data/data.dart';
import 'package:tubes_market_hewan/style/color.dart';
import 'package:tubes_market_hewan/style/custom_container.dart';
import 'package:tubes_market_hewan/style/text.dart';

class ProductDetail extends StatefulWidget {
  final ProductData data;
  const ProductDetail({super.key, required this.data});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: FaIcon(
                    FontAwesomeIcons.arrowLeft,
                    size: 20,
                    color: navy,
                  ),
                ),
                const Spacer(),
                FaIcon(
                  FontAwesomeIcons.share,
                  size: 20,
                  color: navy,
                ),
                const SizedBox(
                  width: 15,
                ),
                FaIcon(
                  FontAwesomeIcons.bagShopping,
                  size: 20,
                  color: navy,
                ),
              ],
            ),
          ),
          Container(
            height: mediaQuery.size.height / 2.5,
            width: mediaQuery.size.width,
            child: Image.network(
              widget.data.image,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rp ${widget.data.price}",
                    style: text18_6navy,
                  ),
                  Text(
                    widget.data.name,
                    style: text16_4navy,
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    widget.data.desc,
                    style: text16_4navy,
                  ),
                ],
              ),
            ),
          )
        ],
      )),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20.0),
        child: Row(children: [
          Container(
            height: 50,
            width: 50,
            decoration: boxWhiteBorderRounded,
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.comment,
                size: 20,
                color: navy,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: InkWell(
              onTap: () async {
                final db = FirebaseFirestore.instance;
                final uid = FirebaseAuth.instance.currentUser?.uid;
                db.collection("product").doc(widget.data.id).collection("fav").doc(uid).set({});
              },
              child: Container(
                height: 50,
                decoration: boxNavyRounded,
                child: Center(
                    child: Text(
                  "Add to bag",
                  style: text14_6white,
                )),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

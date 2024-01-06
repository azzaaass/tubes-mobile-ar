import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tubes_market_hewan/style/color.dart';
import 'package:tubes_market_hewan/style/text.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              FaIcon(
                FontAwesomeIcons.dove,
                size: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Ichlick",
                style: text25_5navy,
              ),
              const Spacer(),
              const FaIcon(
                FontAwesomeIcons.solidEnvelopeOpen,
                size: 20,
                color: navy,
              ),
              const SizedBox(
                width: 15,
              ),
              const FaIcon(
                FontAwesomeIcons.bagShopping,
                size: 20,
                color: navy,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

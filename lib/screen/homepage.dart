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
        Row(
          children: [
            Text(
              "ppppxxx",
              style: text25_5navy,
            ),
            const Spacer(),
            const FaIcon(FontAwesomeIcons.solidEnvelopeOpen, color: navy,),
            const SizedBox(width: 15,),
            const FaIcon(FontAwesomeIcons.bagShopping, color: navy,),
          ],
        ),
      ],
    );
  }
}

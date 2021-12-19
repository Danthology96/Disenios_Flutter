import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/models/shoe_model.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';

class ShoeDescriptionPage extends StatelessWidget {
  const ShoeDescriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    changeStatusLight();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Hero(
                tag: 'shoePreview',
                child: ShoeSizePreview(
                  fullscreen: true,
                ),
              ),
              Positioned(
                top: 80,
                child: FloatingActionButton(
                  onPressed: () {
                    changeStatusDark();
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 50,
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  highlightElevation: 0,
                ),
              ),
            ],
          ),
          Expanded(
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 20,
                      ),
                      ShoeDescription(
                        title: 'Nike Air Max 720',
                        description:
                            "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                      ),
                      _BuyNowSection(),
                      _ColorsAndPlus(),
                      _LikeCartSettingsButtons(),
                    ],
                  ))),
        ],
      ),
    );
  }
}

class _LikeCartSettingsButtons extends StatelessWidget {
  const _LikeCartSettingsButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _RoundedButton(
            icon: Icon(
              Icons.star,
              color: Colors.red,
              size: 25,
            ),
          ),
          _RoundedButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.grey.withOpacity(0.4),
              size: 25,
            ),
          ),
          _RoundedButton(
            icon: Icon(
              Icons.settings,
              color: Colors.grey.withOpacity(0.4),
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}

class _RoundedButton extends StatelessWidget {
  const _RoundedButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              spreadRadius: -5,
              blurRadius: 20,
              offset: Offset(0, 10))
        ],
      ),
      child: icon,
    );
  }
}

class _ColorsAndPlus extends StatelessWidget {
  const _ColorsAndPlus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: const [
                Positioned(
                  left: 66,
                  child: _ButtonColor(
                    color: Color(0xffC6D642),
                    index: 4,
                    url: 'assets/imgs/verde.png',
                  ),
                ),
                Positioned(
                  left: 44,
                  child: _ButtonColor(
                    color: Color(0xffFFAD29),
                    index: 3,
                    url: 'assets/imgs/amarillo.png',
                  ),
                ),
                Positioned(
                  left: 22,
                  child: _ButtonColor(
                    color: Color(0xff2099F1),
                    index: 2,
                    url: 'assets/imgs/azul.png',
                  ),
                ),
                _ButtonColor(
                  color: Color(0xff364D56),
                  index: 1,
                  url: 'assets/imgs/negro.png',
                ),
              ],
            ),
          ),
          // Spacer(),
          const BuyNowButton(
            text: 'More related items',
            width: 170,
            height: 30,
            color: Color(0xffFFc675),
          ),
        ],
      ),
    );
  }
}

class _ButtonColor extends StatelessWidget {
  const _ButtonColor({
    Key? key,
    required this.color,
    required this.index,
    required this.url,
  }) : super(key: key);

  final Color color;
  final int index;
  final String url;
  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          shoeModel.assetImageUrl = url;
        },
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _BuyNowSection extends StatelessWidget {
  const _BuyNowSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            const Text(
              '\$80.0',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Bounce(
              delay: Duration(seconds: 1),
              from: 8,
              child: const BuyNowButton(
                text: 'Buy Now',
                width: 120,
                height: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

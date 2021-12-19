import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/shoe_model.dart';
import 'package:shoes_app/src/pages/shoe_description_page.dart';

class ShoeSizePreview extends StatelessWidget {
  const ShoeSizePreview({Key? key, this.fullscreen = false}) : super(key: key);
  final bool? fullscreen;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullscreen!) {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (BuildContext context) =>
                      const ShoeDescriptionPage()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (fullscreen!) ? 5 : 30,
          vertical: (fullscreen!) ? 0 : 15,
        ),
        child: Container(
          width: double.infinity,
          height: (fullscreen!) ? 370 : 350,
          decoration: BoxDecoration(
            color: const Color(0xffFFCF53),
            borderRadius: (fullscreen!)
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))
                : BorderRadius.circular(40),
          ),
          child: Column(
            children: [
              // zapato con su sombra
              const _ShoeWithShadow(),

              if (!fullscreen!) Expanded(child: const _ShoeSize()),
              if (!fullscreen!) SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShoeSize extends StatelessWidget {
  const _ShoeSize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _ShoeSizeBox(number: 7),
          _ShoeSizeBox(number: 7.5),
          _ShoeSizeBox(number: 8),
          _ShoeSizeBox(number: 8.5),
          _ShoeSizeBox(number: 9),
          _ShoeSizeBox(number: 9.5),
        ],
      ),
    );
  }
}

class _ShoeSizeBox extends StatelessWidget {
  const _ShoeSizeBox({
    Key? key,
    required this.number,
  }) : super(key: key);

  final double number;

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);

    return GestureDetector(
      onTap: () {
        shoeModel.shoeSize = number;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          number.toString().replaceAll('.0', ''),
          style: TextStyle(
            color: (number == shoeModel.shoeSize)
                ? Colors.white
                : const Color(0xffF1A23A),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        width: 40,
        height: 40,
        decoration: (number == shoeModel.shoeSize)
            ? BoxDecoration(
                color: const Color(0xffF1A23A),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                    BoxShadow(
                        color: Color(0xffF1A23A),
                        blurRadius: 10,
                        offset: Offset(0, 5)),
                  ])
            : BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [BoxShadow()]),
      ),
    );
  }
}

class _ShoeWithShadow extends StatelessWidget {
  const _ShoeWithShadow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);

    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Stack(
        children: [
          const Positioned(bottom: 15, right: 0, child: _ShoeShadow()),
          Image(image: AssetImage(shoeModel.assetImageUrl)),
        ],
      ),
    );
  }
}

class _ShoeShadow extends StatelessWidget {
  const _ShoeShadow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 200,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(color: Color(0xffEAA14E), blurRadius: 25)
          ],
        ),
      ),
    );
  }
}

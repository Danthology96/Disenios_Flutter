import 'package:flutter/material.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';

class ShoePage extends StatelessWidget {
  const ShoePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    changeStatusDark();
    return Scaffold(
      body: Column(
        children: [
          const CustomAppbar(text: 'For you'),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: const [
                  Hero(
                      tag: 'shoePreview',
                      child: Material(child: ShoeSizePreview())),
                  ShoeDescription(
                      title: 'Nike Air Max 720',
                      description:
                          "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so."),
                ],
              ),
            ),
          ),
          const AddtoCartButton(amount: 180),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_shoes/res/strings/strings.dart';
import 'package:flutter_shoes/utils/status_bar.dart';

import 'widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    changeStatusDark();
    return Scaffold(
        body: Column(
      children: [
        const CustomAppBar(title: 'For you'),
        const SizedBox(height: 20),
        Expanded(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Hero(tag: 'shoe-1', child: ShoePreview()),
              ShoeDescription(
                  title: AppStrings.title, description: AppStrings.description),
            ],
          ),
        )),
        const AddShoppingCart(price: 180.0)
      ],
    ));
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoes/res/strings/strings.dart';
import 'package:flutter_shoes/utils/status_bar.dart';
import 'package:flutter_shoes/view/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../viewmodels/shoe/shoe_viewmodel.dart';

class DescriptionView extends StatelessWidget {
  const DescriptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    changeStatusLight();
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            const Hero(tag: 'shoe-1', child: ShoePreview(fullScreen: true)),
            Positioned(
                top: 70,
                left: 5,
                child: FloatingActionButton(
                  onPressed: () {
                    changeStatusDark();
                    Navigator.pop(context);
                  },
                  elevation: 0,
                  highlightElevation: 0,
                  backgroundColor: Colors.transparent,
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 50,
                  ),
                ))
          ],
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              ShoeDescription(
                  title: AppStrings.title, description: AppStrings.description),
              const _BuyNow(),
              const SizedBox(
                height: 20,
              ),
              const _ColorsAndMore(),
              const SizedBox(
                height: 30,
              ),
              const _LikeCartSettingsButtons()
            ],
          ),
        ))
      ],
    ));
  }
}

class _LikeCartSettingsButtons extends StatelessWidget {
  const _LikeCartSettingsButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _ShadowButton(
              icon: Icon(
            Icons.star,
            color: Colors.yellow,
            size: 25,
          )),
          _ShadowButton(
              icon: Icon(
            Icons.add_shopping_cart,
            color: Colors.grey.withOpacity(0.4),
            size: 25,
          )),
          _ShadowButton(
              icon: Icon(
            Icons.settings,
            color: Colors.grey.withOpacity(0.4),
            size: 25,
          )),
        ],
      ),
    );
  }
}

class _ShadowButton extends StatelessWidget {
  final Icon icon;
  const _ShadowButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black54,
                spreadRadius: -5,
                blurRadius: 20,
                offset: Offset(0, 10))
          ]),
      child: icon,
    );
  }
}

class _ColorsAndMore extends StatelessWidget {
  const _ColorsAndMore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
              child: Stack(
            children: const [
              Positioned(
                  left: 90,
                  child: _ColorsButton(
                      color: Color(0xffC6D642),
                      index: 4,
                      urlImage: 'assets/imgs/verde.png')),
              Positioned(
                  left: 60,
                  child: _ColorsButton(
                      color: Color(0xffFFAD29),
                      index: 3,
                      urlImage: 'assets/imgs/amarillo.png')),
              Positioned(
                  left: 30,
                  child: _ColorsButton(
                      color: Color(0xff2099F1),
                      index: 2,
                      urlImage: 'assets/imgs/azul.png')),
              _ColorsButton(
                  color: Color(0xff364D56),
                  index: 1,
                  urlImage: 'assets/imgs/negro.png'),
            ],
          )),
          CustomButton(
            textButton: 'More related items',
            height: 30,
            width: 170,
            color: Colors.orange.withOpacity(0.5),
          )
        ],
      ),
    );
  }
}

class _ColorsButton extends StatelessWidget {
  final Color color;
  final int index;
  final String urlImage;
  const _ColorsButton({
    Key? key,
    required this.color,
    required this.index,
    required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 200),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final shoeViewModel =
              Provider.of<ShoeViewModel>(context, listen: false);
          shoeViewModel.assetImage = urlImage;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _BuyNow extends StatelessWidget {
  const _BuyNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          const Text('\$180.0',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const Spacer(),
          Bounce(
            delay: const Duration(milliseconds: 500),
            from: 10,
            child: const CustomButton(
              textButton: 'Buy Now',
              width: 130,
              height: 40,
            ),
          )
        ],
      ),
    );
  }
}

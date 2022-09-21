import 'package:flutter/material.dart';
import 'package:flutter_shoes/view/description_view.dart';
import 'package:flutter_shoes/viewmodels/shoe/shoe_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../res/colors/colors.dart';

class ShoePreview extends StatelessWidget {
  final bool fullScreen;
  const ShoePreview({
    super.key,
    this.fullScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const DescriptionView()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (fullScreen) ? 5 : 30, vertical: 5),
        child: Container(
          width: double.infinity,
          height: (fullScreen) ? 420 : 430,
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(50)),
          child: Column(
            children: [
              const _ShoeWithShadow(),
              if (!fullScreen) const _ShoeSizes()
            ],
          ),
        ),
      ),
    );
  }
}

class _ShoeSizes extends StatelessWidget {
  const _ShoeSizes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _SizeContain(size: 7),
          _SizeContain(size: 7.5),
          _SizeContain(size: 8),
          _SizeContain(size: 8.5),
          _SizeContain(size: 9),
          _SizeContain(size: 9.5),
        ],
      ),
    );
  }
}

class _SizeContain extends StatelessWidget {
  final double size;
  const _SizeContain({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoeViewModel = Provider.of<ShoeViewModel>(context);
    return GestureDetector(
      onTap: () {
        final shoeViewModel = Provider.of<ShoeViewModel>(context, listen: false);
        shoeViewModel.size = size;
      },
      child: Container(
        width: 45,
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: (size == shoeViewModel.size)
                ? AppColors.accentColor
                : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              if (size == shoeViewModel.size)
                BoxShadow(
                    color: AppColors.accentColor,
                    blurRadius: 10,
                    offset: const Offset(0, 5))
            ]),
        child: Text(
          size.toString().replaceAll('.0', ''),
          style: TextStyle(
              color: (size == shoeViewModel.size)
                  ? Colors.white
                  : AppColors.accentColor,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _ShoeWithShadow extends StatelessWidget {
  const _ShoeWithShadow();

  @override
  Widget build(BuildContext context) {
    final shoeViewModel = Provider.of<ShoeViewModel>(context);
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children:  [
          const Positioned(bottom: 20, right: 0, child: _ShoeShadow()),
          Image(image: AssetImage(shoeViewModel.assetImage))
        ],
      ),
    );
  }
}

class _ShoeShadow extends StatelessWidget {
  const _ShoeShadow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 125,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(color: AppColors.shadowColor, blurRadius: 40)
            ]),
      ),
    );
  }
}

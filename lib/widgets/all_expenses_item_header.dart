import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllExpensesItemHeader extends StatelessWidget {
  const AllExpensesItemHeader({
    super.key,
    required this.image,
    this.imageBackgroundC,
    this.imageColor,
    this.arrowColor,
  });
  final String image;
  final Color? imageBackgroundC, imageColor, arrowColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              width: 60,
              height: 60,
              // padding: const EdgeInsets.all(14), this make SVG icons disappear..

              //  instead of padding  put SvgPicture.asset(image) in Center Widget...
              decoration: ShapeDecoration(
                color: imageBackgroundC ?? Color(0xFFFAFAFA),
                shape: OvalBorder(),
              ),
              child: Center(
                child: SvgPicture.asset(
                  image,
                  colorFilter: ColorFilter.mode(
                    imageColor ?? const Color(0xff4eb7f2),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        // SizedBox(width: 12), // Instead of Spacer
        Transform.rotate(
          angle: -1.57079633 * 2,
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: arrowColor ?? Color(0xff064060),
            // 1end solution : color: imageColor == null ? Color(0xff064060) : Colors.white,
          ),
        ),
      ],
    );
  }
}

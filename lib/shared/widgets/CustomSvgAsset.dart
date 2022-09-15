import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgAsset extends StatelessWidget {
  String path;
  Color color;
  CustomSvgAsset({Key? key, required this.path, this.color = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/svgs/$path.svg",
      color: color,
    );
  }
}

import 'package:flutter/material.dart';

class LodingImageWidget extends StatelessWidget {
  const LodingImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('assets/images/loading2.gif',fit: BoxFit.none),
    );
  }
}

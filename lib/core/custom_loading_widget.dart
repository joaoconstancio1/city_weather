import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        key: const Key('custom_loading_center'),
        child: SpinKitCircle(
          color: Colors.blue,
          size: 50.0,
        ));
  }
}

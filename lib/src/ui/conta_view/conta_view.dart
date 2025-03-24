import 'package:flutter/material.dart';
import 'package:images_app/src/util/colors/app_colors.dart';

class ContaView extends StatelessWidget {
  const ContaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Conta'),
      ),
      backgroundColor: AppColors().colorBg,
    );
  }
}

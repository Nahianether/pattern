import 'package:flutter/material.dart';

import '../../components/widgets/appbar/appbar.dart';
import '../../components/widgets/bottom_navbar/bottom_navbar.dart';
import 'components/screen3_body.dart';


class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, kToolbarHeight),
          child: KAppBar(),
      ),
      body: Body(),
      bottomNavigationBar: KBottomNavBar(),
    );
  }
}

import 'package:flutter/material.dart';

import '../widget/app_drawer.dart';
import 'home_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      drawer: AppDrawer(),
      body: HomeView(),
    );
  }
}

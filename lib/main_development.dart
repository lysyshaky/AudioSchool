import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'app/view/app.dart';
import 'bootstrap.dart';
import 'feautres/authentication/provider/auth_provider.dart';

void main() {
  bootstrap(() async {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: App(),
    );
  });
}

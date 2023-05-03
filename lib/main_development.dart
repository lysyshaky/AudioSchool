import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'app/view/app.dart';
import 'bootstrap.dart';
import 'feautres/authentication/provider/auth_provider.dart';
import 'feautres/theme/theme_data.dart';

void main() {
  bootstrap(() async {
    return ChangeNotifierProvider(
      create: (context) => ThemeNotifier(false),
      child: App(),
    );
  });
}

import 'package:flutter/material.dart';
import 'package:my_products/config/inject.dart';
import 'package:my_products/config/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Inject().initialize();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp.router(
      routerConfig: Routes.router,
      ),
    );
  }
}

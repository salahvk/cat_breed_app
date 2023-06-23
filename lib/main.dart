import 'package:cat_breed_app/config/route_manager.dart';
import 'package:cat_breed_app/data/providers/data_provider.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FastCachedImageConfig.init(clearCacheAfter: const Duration(days: 15));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataProvider()),
      ],
      child: MaterialApp(
        title: 'Cat Brochure App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: Routes.splashScreen,
        onGenerateRoute: RouteGenerator.getRoute,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wsmco_task/presentation/pages/shipping_means_page.dart';
import 'package:wsmco_task/presentation/provider/dclt_documents_provider.dart';
import 'package:wsmco_task/presentation/provider/transportation_provider.dart';
import 'core/strings/strings.dart';
import 'core/themes/light_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => TransportationProvider()),
    ChangeNotifierProvider(create: (_) => DCLTNDocumentsProvider())
  ], child: MaterialApp(debugShowCheckedModeBanner: false,
      title: kCompanyName,
      theme: lightTheme, home: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: ShippingMeansPage(),
    );
  }
}

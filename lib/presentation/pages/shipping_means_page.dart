import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wsmco_task/presentation/pages/documents_page.dart';
import 'package:wsmco_task/presentation/widgets/spaces.dart';
import '../../core/strings/assets.dart';
import '../../core/strings/strings.dart';
import '../../core/themes/theme_constants.dart';
import '../provider/transportation_provider.dart';
import '../widgets/icons.dart';
import '../widgets/wsmco_table.dart';

class ShippingMeansPage extends StatefulWidget {
  const ShippingMeansPage({Key? key}) : super(key: key);

  @override
  State<ShippingMeansPage> createState() => _ShippingMeansPageState();
}

class _ShippingMeansPageState extends State<ShippingMeansPage> {
  int currentIndex = 0;
  List<String> headerRowTitles = ['',
    kSerialNumber,
    kTransportationName,
    kTransportationType,
    kNationality,
    kOrderStatus,
    kReviewer,
    kSuspectInformation,
    kProcedures];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(kLogo, fit: BoxFit.cover),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                  child: Row(
                    children: [
                      accentIcon(Icons.switch_left_sharp),
                      addHorizontalSpace(5),
                      const Text(
                        kEditPermission,
                        style: TextStyle(color: kAccentColor),
                      ),
                    ],
                  )),
            )
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        kTransportationMeans,
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(color: kPrimaryColor),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          accentIcon(Icons.tune),
                         const Text(
                            kFilter,
                            style: TextStyle(fontSize: 20, color: kAccentColor),
                          )
                        ],
                      ),
                      addHorizontalSpace(30),
                      InkWell(
                        onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DocumentsPage()));},
                        child: Container(
                            alignment: Alignment.center,
                            height: 60,
                            width: 170,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: kAccentColor,
                                ),
                                color: kAccentColor,
                                borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                            child: const Text(
                              kSelectReviewer,
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            )),
                      )
                    ],
                  ),
                ),
                addHorizontalSpace(30),
                const TabBar(
                    indicatorColor: kAccentColor,
                    labelColor: kPrimaryColor,
                    labelStyle: TextStyle(fontSize: 18),
                    tabs: [
                      Tab(text: kPendingShippingMeans),
                      Tab(text: kArrivedShippingMeans),
                      Tab(text: kTransformedShippingMeans),
                    ]),
                addVerticalSpace(30),
                RichText(
                  text: TextSpan(
                    text: kNumberOfShippingMeans,
                    style: Theme.of(context).textTheme.headlineSmall,
                    children: <TextSpan>[
                      const TextSpan(
                          text: ' : '),
                      TextSpan(
                          text:
                          '${context.read<TransportationProvider>().methodsList.length}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kAccentColor)),
                    ],
                  ),
                ),
                addVerticalSpace(30),

                /// Remember to put the first label an empty string to represent the check box
                WSMCOTable(headers: headerRowTitles, transportations: context.read<TransportationProvider>().methodsList,),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              border: Border.all(
                color: kBorderColor,
                width: 2,
              )),
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center, // Optional
            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly, // Change to your own spacing
            children: [
              iconNavigationBarItem(
                  index: 0,
                  label: kTransportationMeans,
                  icon: Icons.newspaper),
              iconNavigationBarItem(
                  index: 1, label: kMyWorkList, icon: Icons.preview),
              iconNavigationBarItem(
                  index: 2,
                  label: kLiveOrders,
                  icon: Icons.border_all_rounded),
              iconNavigationBarItem(
                  index: 3, label: kIncidentReport, icon: Icons.file_open),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      context.read<TransportationProvider>().fetchMethods();
    });
    super.initState();
  }

  Widget iconNavigationBarItem(
      {required int index, required String label, required IconData? icon}) {
    return Row(
      children: [
        Icon(
          icon,
          color: currentIndex == index ? kAccentColor : kPrimaryColor,
        ),
        Text(
          label,
          style: TextStyle(
              color: currentIndex == index ? kAccentColor : kPrimaryColor),
        )
      ],
    );
  }
}
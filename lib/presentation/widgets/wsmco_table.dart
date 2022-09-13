import 'package:flutter/material.dart';
import 'package:wsmco_task/core/strings/strings.dart';
import 'package:wsmco_task/presentation/widgets/status_container.dart';

import '../../core/themes/theme_constants.dart';
import '../../data/models/method_model.dart';

/// headers MUST equal the number of the children columns
/// I suppose this to work for APIs with the same data model
/// Fetch the rows data before calling this Widget and then pass them to this transportations @param
class WSMCOTable extends StatefulWidget {
  final List<String> headers;
  final List transportations;
  const WSMCOTable({Key? key, required this.headers, required this.transportations}) : super(key: key);

  @override
  State<WSMCOTable> createState() => _WSMCOTableState();
}

class _WSMCOTableState extends State<WSMCOTable> {
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return ListView.builder(
          shrinkWrap: true,
          itemCount: widget.transportations.length,
          itemBuilder: (BuildContext context, int index) {
            MethodModel model =
            MethodModel.fromJson(widget.transportations[index]);
            return Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              // give each column in the table a fraction (to adapt to various screen sizes)
              columnWidths: const {
                0: FractionColumnWidth(.1),
                1: FractionColumnWidth(.1),
                2: FractionColumnWidth(.1),
                3: FractionColumnWidth(.1),
                4: FractionColumnWidth(.1),
                5: FractionColumnWidth(.1),
                6: FractionColumnWidth(.2),
                7: FractionColumnWidth(.09),
                8: FractionColumnWidth(.11),
              },
              children: [
                // first table row

                if(index == 0) TableRow(children: [for(var header in widget.headers) Text(header)]),
                TableRow(
                  decoration: BoxDecoration(
                      borderRadius:const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: kBorderColor, width: 2, )
                  ),
                  children: [
                    Checkbox(value: isChecked, onChanged: (value){ setState(() {
                      isChecked = value!;
                    },);}, activeColor: kAccentColor, checkColor: Colors.white,),
                    Text('${model.sn}'),
                    Text(model.transportation),
                    Text(model.type),
                    Text(model.nationality),
                    Text(model.status),
                    Text(model.reviewer),
                    StatusContainer(label: model.isSuspect == 1 ? kSuspect : kNotFound, isDanger: model.isSuspect == 1 ? true : false),
                    toolsButton()
                  ],
                ),
                // space each row
              ],
            );}
      );
  }

  Widget toolsButton(){
    return const Icon(Icons.text_snippet_outlined);
  }
}

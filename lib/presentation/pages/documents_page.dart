import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wsmco_task/core/themes/styles.dart';
import 'package:wsmco_task/core/themes/theme_constants.dart';
import 'package:wsmco_task/data/models/documents_model.dart';
import 'package:wsmco_task/presentation/provider/dclt_documents_provider.dart';
import 'package:wsmco_task/presentation/widgets/spaces.dart';

import '../../core/strings/assets.dart';
import '../../core/strings/strings.dart';

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({Key? key}) : super(key: key);

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(kLogo, fit: BoxFit.cover),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  kDocumentInfo,
                  style: h2,
                ),
                addVerticalSpace(10),
                const Divider(
                  thickness: 4,
                  color: kBorderColor,
                ),
                addVerticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    keyValueText(key: kDocumentType, value: kImportDocument),
                    keyValueText(key: kDocumentNumber, value: '7539842'),
                    keyValueText(key: kDocumentDate, value: '09-13-2022'),
                  ],
                ),
                addVerticalSpace(100),
                const Text(
                  kDocuments,
                  style: h2,
                ),
                addVerticalSpace(10),
    Consumer<DCLTNDocumentsProvider>(
      builder: (context, docs, child) => ListView.builder(
      shrinkWrap: true,
      itemCount: 3, //TODO: Static number for testing purpose
      //itemCount: docs.documentsList.length, // We use this when there's actual api response
      itemBuilder: (BuildContext context, int index) {
        // We use this when there's actual api response
        // DocumentModel model = DocumentModel.fromJson(docs.documentsList[index]);
        return documentItem();
      }),
    ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget keyValueText({required String key, required String value}) {
    return Row(
      children: [
        Text(
          key,
          style: h3Grey,
        ),
        addHorizontalSpace(10),
        Text(
          value,
          style: h3,
        )
      ],
    );
  }

  Widget documentItem() {
    //TODO: Make this a stateless widget and assign its local variables later when the api is in use
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: kBorderColor,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(kDocumentImage),
            addHorizontalSpace(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  kFileNamePlaceHolder,
                  style: h2,
                ),
                addVerticalSpace(12),
                const Text(kNotes, style: h4),
                const Text(
                  kFileDescriptionPlaceHolder,
                  style: h4,
                ),
              ],
            ),
            addHorizontalSpace(20),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  '13-9-2022',
                  style: h4Grey,
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: const [
                    Text(
                      kShowFile,
                      style: h1,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: kAccentColor,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

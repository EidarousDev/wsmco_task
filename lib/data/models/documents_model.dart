class DocumentModel {
  final String fileName;
  final String docType;
  final String remarks;
  final String fullPath;

  DocumentModel(
      {required this.fileName,
      required this.docType,
      required this.remarks,
      required this.fullPath});

  factory DocumentModel.fromJson(Map<String, dynamic> json) => DocumentModel(
      fileName: json['org_file_name'] ?? '',
      docType: json['doc_type'] ?? '',
      remarks: json['remarks'] ?? '',
      fullPath: json['full_path'] ?? '');
}

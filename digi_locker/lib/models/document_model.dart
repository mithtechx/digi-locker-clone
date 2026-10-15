class DocumentItem {
  final String title;
  final String subtitle;
  final String docNumber;
  final String category;
  final String holderName;
  final String additionalInfo;

  const DocumentItem({
    required this.title,
    required this.subtitle,
    required this.docNumber,
    required this.category,
    required this.holderName,
    required this.additionalInfo,
  });
}
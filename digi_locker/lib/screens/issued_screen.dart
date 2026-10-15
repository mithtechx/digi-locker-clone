import 'package:flutter/material.dart';
import '../models/document_model.dart';
import 'document_detail_screen.dart';

class IssuedScreen extends StatelessWidget {
  const IssuedScreen({super.key});

  final List<DocumentItem> issuedDocs = const [
    DocumentItem(
      title: "Aadhaar Card",
      subtitle: "Unique Identification Authority of India (UIDAI)",
      docNumber: "XXXXXXXX3667",
      category: "Identity",
      holderName: "Parth Gopal Sonune",
      additionalInfo: "S/O Gopal Madan Sonune, Deshmukh LayOut, Waard Noa 18, Chikhli, Behind Goverment Milk Centar, Chikhli, Buldana, Maharashtra, 443201",
    ),
    DocumentItem(
      title: "Driving License",
      subtitle: "Ministry of Road Transport and Highways",
      docNumber: "MH28 20250006119",
      category: "Transport",
      holderName: "PARTH G SONUNE",
      additionalInfo: "Authorization to Drive: LMV,MCWG\nDate of Issue: 2025-04-09\nDOB: 2004-02-18\nS/W/D: GOPAL SONUNE\nBlood Group: B+\nDate of Expiry: 2047-02-17\nPermanent Address: DESHMUKH LAYOUT WARD NO 18, CHIKHLI (M CI), Chikhli,Buldana,MH, 443201\nPresent Address: DESHMUKH LAYOUT WARD NO 18, CHIKHLI (M CI), Chikhli,Buldana,MH, 443201",
    ),
    DocumentItem(
      title: "PAN Card",
      subtitle: "Income Tax Department",
      docNumber: "UBSPS4727R",
      category: "Taxation",
      holderName: "PARTH GOPAL SONUNE",
      additionalInfo: "Gender: MALE\nDOB: 18-02-2004\nPan Number: UBSPS4727R",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF3F3DDF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(16, 50, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Issued Documents",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "DigiLocker 'Issued Documents' are at par with original documents as per IT ACT, 2000",
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "My Issued Document(${issuedDocs.length})",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: issuedDocs.length,
              itemBuilder: (context, index) {
                final doc = issuedDocs[index];
                
                // Use dl_logo.png for both Driving License and PAN Card
                String assetPath = '';
                if (doc.title.contains("Aadhaar")) {
                  assetPath = 'assets/aadhaar_logo.png';
                } else {
                  assetPath = 'assets/dl_logo.png';
                }

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 4, offset: const Offset(0, 2)),
                        ],
                      ),
                      child: Image.asset(
                        assetPath,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          doc.title.contains("Aadhaar") ? Icons.fingerprint : Icons.badge,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    title: Text(doc.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(doc.subtitle, maxLines: 2, overflow: TextOverflow.ellipsis),
                    trailing: const Icon(Icons.more_vert),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DocumentDetailScreen(document: doc),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
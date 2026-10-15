import 'package:flutter/material.dart';
import '../models/document_model.dart';

class DocumentDetailScreen extends StatelessWidget {
  final DocumentItem document;

  const DocumentDetailScreen({super.key, required this.document});

  void _openFullScreenQR(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black54,
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.8, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
              ),
              child: FullScreenQrDialog(documentTitle: document.title),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String titleLower = document.title.toLowerCase();
    bool isAadhaar = titleLower.contains("aadhaar");
    bool isDriving = titleLower.contains("driving");
    bool isPan = titleLower.contains("pan");

    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBar(
        title: Text(document.title),
        backgroundColor: const Color(0xFF3F3DDF),
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage("assets/p.png"),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        child: Column(
          children: [
            Card(
              elevation: 3,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade300, width: 0.8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TOP HEADER SECTION BASED ON DOCUMENT TYPE
                    if (isAadhaar) ...[
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: Image.asset(
                          'assets/aadhaar_header.png',
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                          errorBuilder: (context, error, stackTrace) => const Text(
                            "[ aadhaar_header.png missing ]",
                            style: TextStyle(color: Colors.red, fontSize: 11),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(height: 1, thickness: 1, color: Colors.black12),
                      const SizedBox(height: 14),
                    ] else ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.account_balance, size: 28, color: Colors.black87),
                          Text(
                            document.title.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(height: 1, thickness: 1, color: Colors.black12),
                      const SizedBox(height: 14),
                    ],

                    // CONTENT LAYOUT FOR AADHAAR
                    if (isAadhaar) ...[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 88,
                            height: 110,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400, width: 1),
                              image: const DecorationImage(
                                image: AssetImage("assets/p.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  document.holderName,
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                                ),
                                const SizedBox(height: 6),
                                const Text("2004-02-18", style: TextStyle(fontSize: 13.5, color: Colors.black87)),
                                const SizedBox(height: 4),
                                const Text("MALE", style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w500, color: Colors.black87)),
                                const SizedBox(height: 6),
                                Text(document.docNumber, style: const TextStyle(fontSize: 15.5, fontWeight: FontWeight.bold, color: Colors.black)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Divider(height: 1, thickness: 1, color: Colors.black12),
                      const SizedBox(height: 10),
                      const Text("Address", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54)),
                      const SizedBox(height: 4),
                      Text(document.additionalInfo, style: const TextStyle(fontSize: 12.5, height: 1.4, color: Colors.black87)),
                    ],

                    // CONTENT LAYOUT FOR DRIVING LICENSE
                    if (isDriving) ...[
                      _buildKeyValueRow("NAME", document.holderName),
                      _buildKeyValueRow("License No.", document.docNumber),
                      _buildKeyValueRow("Authorization to Drive", "LMV,MCWG"),
                      _buildKeyValueRow("Date of Issue", "2025-04-09"),
                      _buildKeyValueRow("DOB", "2004-02-18"),
                      _buildKeyValueRow("S/W/D", "GOPAL SONUNE"),
                      _buildKeyValueRow("BLOOD GROUP", "B+"),
                      _buildKeyValueRow("Date of Expiry", "2047-02-17"),
                      _buildKeyValueRow("Permanent Address", "DESHMUKH LAYOUT WARD NO 18, CHIKHLI (M CI), Chikhli,Buldana,MH, 443201"),
                      _buildKeyValueRow("Present Address", "DESHMUKH LAYOUT WARD NO 18, CHIKHLI (M CI), Chikhli,Buldana,MH, 443201"),
                    ],

                    // CONTENT LAYOUT FOR PAN CARD
                    if (isPan) ...[
                      _buildKeyValueRow("Name", document.holderName),
                      _buildKeyValueRow("Gender", "MALE"),
                      _buildKeyValueRow("DOB", "18-02-2004"),
                      _buildKeyValueRow("Pan Number", document.docNumber),
                    ],

                    const SizedBox(height: 20),

                    // FOOTER ROW: BADGE & QR CODE
                    if (isDriving) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () => _openFullScreenQR(context),
                                child: SizedBox(
                                  width: 72,
                                  height: 72,
                                  child: Image.asset(
                                    'assets/aadhaar_qr.png',
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.qr_code_2, size: 50),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 2),
                              const Text("Tap to Zoom", style: TextStyle(fontSize: 9.5, color: Colors.grey)),
                            ],
                          ),
                          Container(
                            width: 85,
                            height: 105,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400, width: 1),
                              image: const DecorationImage(
                                image: AssetImage("assets/p.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Center(
                        child: SizedBox(
                          height: 55,
                          child: Image.asset(
                            'assets/digilocker_badge.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ] else ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 55,
                            child: Image.asset(
                              'assets/digilocker_badge.png',
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) => Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF3F3DDF),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text("Powered by DigiLocker", style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () => _openFullScreenQR(context),
                                child: SizedBox(
                                  width: 72,
                                  height: 72,
                                  child: Image.asset(
                                    'assets/aadhaar_qr.png',
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.qr_code_2, size: 50),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 2),
                              const Text("Tap to Zoom", style: TextStyle(fontSize: 9.5, color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                    ],

                    // AADHAAR FOOTER SLOGAN
                    if (isAadhaar) ...[
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: const BoxDecoration(
                          border: Border(top: BorderSide(color: Colors.redAccent, width: 0.8)),
                        ),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, letterSpacing: 0.8),
                            children: [
                              TextSpan(text: "मेरा ", style: TextStyle(color: Colors.black87)),
                              TextSpan(text: "आधार", style: TextStyle(color: Colors.red)),
                              TextSpan(text: ", मेरी पहचान", style: TextStyle(color: Colors.black87)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // SHARE FOOTER
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Tell your friends and family about DigiLocker",
                  style: TextStyle(fontSize: 13, color: Color(0xFF3F3DDF), fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.share, color: Colors.black87, size: 20),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyValueRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(
              label,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ),
          const Text(" : ", style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 13, color: Colors.black87, height: 1.3),
            ),
          ),
        ],
      ),
    );
  }
}

class FullScreenQrDialog extends StatelessWidget {
  final String documentTitle;

  const FullScreenQrDialog({super.key, required this.documentTitle});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 15, offset: Offset(0, 5)),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "$documentTitle QR Code",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 240,
              height: 240,
              child: Image.asset(
                'assets/aadhaar_qr.png',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.qr_code_2, size: 180),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Scan to verify secure mock identity",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3F3DDF),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 40),
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Close"),
            ),
          ],
        ),
      ),
    );
  }
}
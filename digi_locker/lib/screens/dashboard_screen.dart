import 'package:flutter/material.dart';
import '../models/document_model.dart';
import 'document_detail_screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final List<DocumentItem> documents = [
    DocumentItem(
      title: "Aadhaar Card",
      subtitle: "Unique Identification Authority (Mock)",
      docNumber: "XXXX-XXXX-9876",
      category: "Identity",
      holderName: "Student Developer",
      additionalInfo: "DOB: 15/08/2004\nGender: Male / Female\nAddress: College Campus, India",
    ),
    DocumentItem(
      title: "PAN Card",
      subtitle: "Income Tax Department (Mock)",
      docNumber: "ABCDE1234F",
      category: "Taxation",
      holderName: "Student Developer",
      additionalInfo: "Father's Name: Senior Developer\nStatus: Verified (Mock)",
    ),
    DocumentItem(
      title: "Driving License",
      subtitle: "Transport Department (Mock)",
      docNumber: "MH-12-2026-0005678",
      category: "Transport",
      holderName: "Student Developer",
      additionalInfo: "Vehicle Class: LMV, MCWOG\nValid Till: 2042",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DigiIocker (College Project)"),
        backgroundColor: Colors.blue.shade800,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Issued Documents",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  final doc = documents[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue.shade100,
                        child: Icon(Icons.badge, color: Colors.blue.shade800),
                      ),
                      title: Text(
                        doc.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("${doc.subtitle}\nNo: ${doc.docNumber}"),
                      isThreeLine: true,
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
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
            ),
          ],
        ),
      ),
    );
  }
}
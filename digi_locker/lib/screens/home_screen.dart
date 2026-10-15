import 'package:flutter/material.dart';
import '../models/document_model.dart';
import 'issued_screen.dart'; // Import IssuedScreen to navigate there

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Purple Header Section
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.shield, color: Colors.white, size: 24),
                          SizedBox(width: 6),
                          Icon(Icons.description, color: Colors.white, size: 22),
                          SizedBox(width: 8),
                          Text(
                            "DigiLocker",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                      const CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white24,
                        child: Icon(Icons.refresh, color: Colors.white, size: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome, Parth Gopal Sonune!",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "DigiLocker 'Issued Documents' are at par with original documents as per IT ACT, 2000",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const CircleAvatar(
                          radius: 26,
                          backgroundImage: AssetImage("assets/p.png"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Issued Document",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Redirects to Issued Screen when "See All" is clicked
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const IssuedScreen()),
                          );
                        },
                        child: const Text("See All", style: TextStyle(color: Colors.white, fontSize: 15)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  
                  // Redirects to Issued Screen when the Aadhaar card preview is tapped
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const IssuedScreen()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.12),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.06),
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Image.asset(
                              'assets/aadhaar_logo.png',
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) => const Icon(Icons.fingerprint, color: Colors.orange, size: 36),
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Aadhaar Card",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "XXXXXXXX3667",
                                  style: TextStyle(color: Colors.black54, fontSize: 13, fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Unique Identification Authority of India (UIDAI)",
                                  style: TextStyle(color: Colors.grey, fontSize: 11),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),

            // Access UMANG Promotional Banner Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Access UMANG in DigiLocker",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3F3DDF),
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            "Your one-stop destination for all Government services.",
                            style: TextStyle(fontSize: 13, color: Colors.black54, height: 1.3),
                          ),
                          const SizedBox(height: 14),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: () {},
                            child: const Text("Access UMANG", style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.phone_android, size: 50, color: Color(0xFF3F3DDF)),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // DigiLocker Utility Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "DigiLocker Utility",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  const SizedBox(height: 12),
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.9,
                    children: [
                      _buildUtilityCard(Icons.security, "Authenticator"),
                      _buildUtilityCard(Icons.folder, "Drive"),
                      _buildUtilityCard(Icons.badge, "Verifiable Credential"),
                      _buildUtilityCard(Icons.admin_panel_settings, "Govt. Employee"),
                      _buildUtilityCard(Icons.people, "Nominee"),
                      _buildUtilityCard(Icons.verified_user, "My Consent"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildUtilityCard(IconData icon, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: const Color(0xFF3F3DDF), size: 30),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/app_drawer.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  static const Color orange = Color(0xFFFF8C00);
  static const String endpoint =
      "https://my-portfolio-backend-eight-xi.vercel.app/api/contact";

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final msgCtrl = TextEditingController();

  bool isSending = false;

  bool _isValidEmail(String s) {
    final r = RegExp(r"^[^\s@]+@[^\s@]+\.[^\s@]+$");
    return r.hasMatch(s.trim());
  }

  void _snack(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Future<void> _send() async {
    final name = nameCtrl.text.trim();
    final email = emailCtrl.text.trim();
    final msg = msgCtrl.text.trim();

    if (name.isEmpty || email.isEmpty || msg.isEmpty) {
      _snack("Please fill all fields");
      return;
    }
    if (!_isValidEmail(email)) {
      _snack("Please enter a valid email");
      return;
    }
    if (msg.length < 10) {
      _snack("Message is too short");
      return;
    }

    setState(() => isSending = true);

    try {
      final res = await http.post(
        Uri.parse(endpoint),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"name": name, "email": email, "message": msg}),
      );

      if (!mounted) return;

      if (res.statusCode == 200) {
        _snack("Message sent");
        nameCtrl.clear();
        emailCtrl.clear();
        msgCtrl.clear();
        FocusScope.of(context).unfocus();
      } else {
        String err = "Failed to send";
        try {
          final data = jsonDecode(res.body);
          if (data is Map && data["error"] != null) err = data["error"].toString();
        } catch (_) {}
        _snack("Error: $err");
      }
    } catch (e) {
      if (!mounted) return;
      _snack("Network error. Try again.");
    } finally {
      if (mounted) setState(() => isSending = false);
    }
  }
  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    msgCtrl.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Contact", style: TextStyle(fontWeight: FontWeight.w900)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Header(isSending: isSending),

                const SizedBox(height: 18),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Colors.white),
                    boxShadow: const [
                      BoxShadow(color: Colors.black38, blurRadius: 26, offset: Offset(0, 14))
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Send a Message",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900 , color: orange)),
                      const SizedBox(height: 10),
                      const Text(
                        "Your message will be delivered directly to my Gmail.",
                        style: TextStyle(color: Colors.black, height: 1.6),
                      ),
                      const SizedBox(height: 14),

                      _Input(controller: nameCtrl, hint: "Your name"),
                      const SizedBox(height: 10),
                      _Input(controller: emailCtrl, hint: "Your email"),
                      const SizedBox(height: 10),
                      _Input(controller: msgCtrl, hint: "Your message", maxLines: 5),
                      const SizedBox(height: 12),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: orange,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                          ),
                          onPressed: isSending ? null : _send,
                          child: isSending
                              ? const SizedBox(
                                  height: 22,
                                  width: 22,
                                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black),
                                )
                              : const Text("Send", style: TextStyle(fontWeight: FontWeight.w900)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class _Header extends StatelessWidget {
  final bool isSending;
  const _Header({required this.isSending});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white),
        gradient: LinearGradient(
          colors: [
            const Color(0xFFFF8C00),
            Colors.white,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Let’s work together",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
          const SizedBox(height: 6),
          Text(
            isSending
                ? "Sending..."
                : "Send a message and it will reach my Gmail directly.",
            style: const TextStyle(color: Colors.white70, height: 1.7),
          ),
        ],
      ),
    );
  }
}

class _Input extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  const _Input({required this.controller, required this.hint, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(fontWeight: FontWeight.w700),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.orange),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0x44FF8C00)),
        ),
      ),
    );
  }
}
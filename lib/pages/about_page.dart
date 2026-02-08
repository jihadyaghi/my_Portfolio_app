import 'package:flutter/material.dart';
import 'package:myportfolio_app/widgets/app_drawer.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  static const Color orange = Color(0xFFFF8C00);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("About",style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: ConstrainedBox(
            constraints:const BoxConstraints(maxWidth: 900),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Colors.white),
                    gradient: LinearGradient(colors: [orange,Colors.white])
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi I'm Jihad Yaghie",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text(
                        "Computer Science student and software developer focused on building clean, "
                        "responsive, and scalable applications. I care about good UX, readable code, "
                        "and turning ideas into real products.",
                        style: TextStyle(color: Colors.white,height: 1.7),
                        )
                    ],
                  ),
                ),
                const SizedBox(height: 16),

              ],
            ), 
            ),
        ),
      ),
    );
  }
}
class _InfoCard extends StatelessWidget{
  final IconData icon;
  final String title;
  final List<String>lines;
  const _InfoCard({
    required this.icon,
    required this.title,
    required this.lines
  });
  @override
  Widget build(BuildContext context) {
    const orange = Color(0xFFFF8C00);
    return Container(
      width: 420,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white),
        boxShadow: const [
          BoxShadow(color: Colors.black,blurRadius: 26,offset: Offset(0, 14))
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: orange,
                  border: Border.all(color: orange)
                ),
                child: Icon(icon,color: orange),
              ),
              const SizedBox(height: 12),
              
            ],
          )
        ],
      ),
    );
  }
}
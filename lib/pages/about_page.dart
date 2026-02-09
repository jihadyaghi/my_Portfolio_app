import 'package:flutter/material.dart';
import 'package:myportfolio_app/widgets/app_drawer.dart';
import 'package:url_launcher/url_launcher.dart';
class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  static const Color orange = Color(0xFFFF8C00);
  Future<void> _downloadCV() async{
    final uri = Uri.parse("/Jihad_Yaghi.pdf");
    await launchUrl(uri,mode: LaunchMode.platformDefault);
  }
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
                      Text("Hi, I'm Jihad Yaghie",style: TextStyle(color: Colors.black, fontSize: 24,fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text(
                        "Computer Science student and software developer focused on building clean, "
                        "responsive, and scalable applications. I care about good UX, readable code, "
                        "and turning ideas into real products.",
                        style: TextStyle(color: Colors.grey,height: 1.7 , fontWeight: FontWeight.bold),
                        )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 14,
                  runSpacing: 14,
                  children: [
                    _InfoCard(
                      icon: Icons.school_rounded,
                       title: "Education",
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Computer Science",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold)),
                            SizedBox(height: 6),
                            Text("Lebanon",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold)),
                            SizedBox(height: 6),
                            Text("Expected Grduation:2026",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold))
                          ],
                        )
                          ),
                    _InfoCard(
                      icon: Icons.track_changes_rounded,
                      title: "Focus",
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Front-End (Flutter/React)",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold)),
                          SizedBox(height: 6),
                          Text("Backend (Node.js/Express)",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold)),
                          SizedBox(height: 6),
                          Text("Databases (MySQL)",style:TextStyle(color: Colors.grey,fontWeight: FontWeight.bold)),
                        ],
                      )
                        ),
                        _InfoCard(
                      icon: Icons.track_changes_rounded,
                      title: "Tools",
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Git & GitHub",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold)),
                          SizedBox(height: 6),
                          Text("Vercel / Deployment",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold)),
                          SizedBox(height: 6),
                          Text("REST APIs",style:TextStyle(color: Colors.grey,fontWeight: FontWeight.bold)),
                        ],
                      )
                        ),
                         ],
                ),
                const SizedBox(height: 20),
                const Text("Highlights" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                const _TimelineItem(
                  title: "Build real projects",
                   desc: "I create complete apps from UI to API , focusing on clean structure and maintainability."
                   ),
                const _TimelineItem(
                    title: "Strong fundamentals",
                     desc: "Good understanding of OS , Databases , and problem solving-useful for building scalable apps."
                     ),
                const _TimelineItem(
                  title: "Professinol mindset",
                   desc: "I write readable code , use Git properly, and design responsive UIs that look good on mobile & web."
                   ),
                SizedBox(height: 18),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: orange,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
                      ),
                      onPressed: ()=>Navigator.pushReplacementNamed(context, "/projects"),
                       child: const Text("View Projects",style: TextStyle(fontWeight: FontWeight.bold)),
                       ),
                       OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color:Colors.white),
                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
                        ),
                        onPressed: ()=>Navigator.pushReplacementNamed(context, "/contact"),
                         child: const Text("Contact Me",style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white))
                         ),
                         OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.white),
                            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 14),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
                          ),
                          onPressed: _downloadCV,
                          icon: const Icon(Icons.download_rounded),
                           label: const Text("Download CV",style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white))
                           )
                  ],
                )
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
  final Widget content;
   const _InfoCard({
    required this.icon,
    required this.title,
    required this.content
  });
  @override
  Widget build(BuildContext context) {
    const orange = Color(0xFFFF8C00);
    return Container(
      width: 420,
      padding: const EdgeInsets.all(18),
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
                child: Icon(icon,color: Colors.white),
              ),
              const SizedBox(width: 15),
              Text(title,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16)),
              ],
          ),
          const SizedBox(height: 14),
          content
        ],
      ),
    );
  }
}
class _TimelineItem extends StatelessWidget{
  final String title;
  final String desc;
  const _TimelineItem({
    required this.title,
    required this.desc
  });
  @override
  Widget build(BuildContext context) {
    const orange = Color(0xFFFF8C00);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 12,
            height: 12,
            margin: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              color: orange,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: orange,blurRadius: 18)]
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style: TextStyle(fontWeight: FontWeight.bold , color: Colors.black)),
                const SizedBox(height: 6),
                Text(desc,style: TextStyle(color: Colors.grey,height: 1.6,fontWeight: FontWeight.bold))
              ],
            ) 
            )
        ],
      ),
    );
  }
}
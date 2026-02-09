import 'package:flutter/material.dart';
import 'package:myportfolio_app/widgets/app_drawer.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  static const Color orange = Color(0xFFFF8C00);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Skills",style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Header(),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 14,
                  runSpacing: 14,
                  children: [
                    _SkillCard(
                      title: "Frontend",
                      icon: Icons.web_rounded,
                      items: [
                        "Flutter",
                        "React",
                        "HTML",
                        "CSS",
                        "Responsive UI"
                      ]
                    ),
                    _SkillCard(
                      title: "Backend",
                      icon: Icons.settings_rounded,
                      items: [
                        "Node.js",
                        "Express",
                        "REST APIs",
                        "Auth / JWT(basic)"
                      ]
                    ),
                    _SkillCard(
                      title: "Database",
                      icon: Icons.storage_rounded,
                      items: [
                        "MySQL",
                        "ERD & SQL Queries",
                        "CRUD & Relations"
                      ]
                    ),
                    _SkillCard(
                      title: "Tools",
                      icon: Icons.handyman_rounded,
                      items: [
                        "Git & GitHub",
                        "Vercel(Deploy)",
                        "VsCode",
                        "Postman"
                      ]
                    )
                  ],
                ),
                const SizedBox(height: 18),
                const Text("Skill Levels",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const _LevelBar(label: "Flutter UI", value: 0.78),
                const _LevelBar(label: "React", value: 0.72),
                const _LevelBar(label: "Node.js / Express", value: 0.65),
                const _LevelBar(label: "MySQL", value: 0.70),
                const _LevelBar(label: "Git / GitHub", value: 0.75),
                const SizedBox(height: 18),
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
                        side: BorderSide(color: Colors.white),
                        padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
                      ),
                      onPressed: ()=>Navigator.pushReplacementNamed(context, "/contact"),
                      child: const Text("Contact Me",style: TextStyle(fontWeight: FontWeight.bold))
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
class _Header extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    const Color orange = Color(0xFFFF8C00);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white),
        gradient: LinearGradient(
          colors:[
            orange,
            Colors.white
          ] 
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Skills & Tools",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.black)),
          SizedBox(height: 8),
          Text("A quick overview of the technologies I use to build web and mobile applications.",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold , height: 1.7)),
        ],
      ),
    );
  }
}
class _SkillCard extends StatelessWidget{
  final String title;
  final IconData icon;
  final List<String>items;
  const _SkillCard({
    required this.title,
    required this.icon,
    required this.items
  });
  @override
  Widget build(BuildContext context) {
    const Color orange = Color(0xFFFF8C00);
    return Container(
      width: 480,
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
                child: Icon(icon,color: Colors.white),
              ),
              const SizedBox(width: 12),
              Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black)),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children:items.map((s)=>_Chip(text: s)).toList(),
          )
        ],
      ),
    );
  }
}
class _Chip extends StatelessWidget{
  final String text;
  const _Chip({required this.text});
  @override
  Widget build(BuildContext context) {
    const Color orange = Color(0xFFFF8C00);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              color: orange,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: orange,blurRadius: 14)
              ]
            ),
          ),
          const SizedBox(width: 8),
          Text(text,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey)),
        ],
      ),
    );
  }
}
class _LevelBar extends StatelessWidget{
  final String label;
  final double value;
  const _LevelBar({
    required this.label,
    required this.value
  });
  @override
  Widget build(BuildContext context) {
    const Color orange = Color(0xFFFF8C00);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,style: TextStyle(fontWeight: FontWeight.bold , color: Colors.black)),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: value.clamp(0, 1),
              minHeight: 10,
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation(orange),
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
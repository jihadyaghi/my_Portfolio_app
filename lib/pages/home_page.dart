import 'package:flutter/material.dart';
import 'package:myportfolio_app/widgets/app_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const orange = Color(0xFFFF8C00);
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text("Jihad Yaghie" , style: TextStyle(fontWeight: FontWeight.w900)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 750),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 170,
                  height: 170,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [orange,Color(0xFFFFB347)]),
                    boxShadow: [
                      BoxShadow(color: orange,blurRadius: 40,offset: const Offset(0, 16))
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white,width: 3),
                      image: const DecorationImage(
                        image: AssetImage("assets/profile.jpeg"),fit: BoxFit.cover)
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text("Software Developer",style: TextStyle(fontSize: 22 , fontWeight: FontWeight.w900)),
                const SizedBox(height: 10),
                const Text(
                  "Computer Science student passionate about building clean, responsive apps. "
                  "I enjoy turning ideas into real products and writing readable code.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70,height: 1.7,fontSize: 14),
                  ),
                const SizedBox(height: 18),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    ElevatedButton( style: ElevatedButton.styleFrom(
                      backgroundColor: orange,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 18 , vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
                    ),
                     onPressed:()=>Navigator.pushReplacementNamed(context, "/projects") ,
                      child: const Text("View Projects" , style: TextStyle(fontWeight: FontWeight.w900))
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white24),
                          padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
                        ),
                        onPressed: ()=>Navigator.pushReplacementNamed(context, "/contact"),
                        child: const Text("Contact" , style: TextStyle(fontWeight: FontWeight.w900 , color: Colors.white))
                        )
                  ],
                ),
                const SizedBox(height: 18),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: [
                    _Chip("Flutter"),
                    _Chip("Dart"),
                    _Chip("React"),
                    _Chip("Node.js"),
                    _Chip("MySQL"),
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
class _Chip extends StatelessWidget {
  final String text;
  const _Chip(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12 , vertical: 9),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.orange)
      ),
      child: Text(text,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 12)),
    );
  }
}
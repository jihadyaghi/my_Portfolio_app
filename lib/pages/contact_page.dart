import 'package:flutter/material.dart';
import 'package:myportfolio_app/widgets/app_drawer.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  static const String email = "jihadyaghie@gmail.com";
  static const String phone = "+961 81670212";
  static const String github = "https://github.com/jihadyaghi";
  static const String linkedin = "https://www.linkedin.com/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Contact" , style: TextStyle(fontWeight: FontWeight.w900)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 900),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              ],
            ), 
            ),
        ),
      ),
    );
  }
}
class _Header extends StatelessWidget{
  const _Header();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white),
        gradient: LinearGradient(
          colors:[
            const Color(0xFFFF8C00),
            Colors.white
          ] 
          ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Let's work together" , style: TextStyle(fontSize: 24 , fontWeight: FontWeight.w900)),
          SizedBox(height: 6),
          Text("Reach out via email or WhatsApp. I respond fast and I’m open to internships and real projects.",
          style: TextStyle(color: Colors.white70 , height: 1.7),
          )
        ],
      ),
    );
  }
}
class _ContactCard extends StatelessWidget{
  final IconData icon;
  final String title;
  final String value;
  final String primaryText;
  final VoidCallback onPrimary;
  final String secondaryText;
  final VoidCallback onSecondary;
  const _ContactCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.primaryText,
    required this.onPrimary,
    required this.secondaryText,
    required this.onSecondary
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
        boxShadow: const [BoxShadow(color: Colors.black,blurRadius: 26 , offset: Offset(0, 14))]
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
              const SizedBox(width: 12),
              Expanded(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,style: const TextStyle(fontWeight: FontWeight.w900,fontSize: 15)),
                    const SizedBox(height: 2),
                    Text(value,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),)
                  ],
                ) 
                )
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child:ElevatedButton( style: ElevatedButton.styleFrom(
                  backgroundColor: orange,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsetsDirectional.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
                ),
                 onPressed: onPrimary , 
                 child: Text(primaryText,style: TextStyle(fontWeight: FontWeight.w900)),
                 ) 
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton( style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: BorderSide(color: Colors.white),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
                  ),
                  onPressed: onSecondary ,
                   child: Text(secondaryText,style: const TextStyle(fontWeight: FontWeight.w900))
                   )
                  )
            ],
          )
        ],
      ),
    );
  }
}
class _Input extends StatelessWidget{
  final String hint;
  final int maxLines;
  const _Input({required this.hint,this.maxLines = 1});
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      style: const TextStyle(fontWeight: FontWeight.w700),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.w700),
        filled: true,
        fillColor: Colors.white,
      
      ),
    );
  }
}
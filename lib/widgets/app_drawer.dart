
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  Widget _item(BuildContext context,IconData icon,String title,String route){
  return ListTile(
leading: Icon(icon,color: const Color(0xFFFF8C00)),
title: Text(title,style: const TextStyle(fontWeight: FontWeight.w800)),
onTap: (){
  Navigator.pop(context);
  Navigator.pushReplacementNamed(context, route);
},
  );
}
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0B0D12),
      child: SafeArea(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Color(0xFFFF8C00),
                    child: Text("JY",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900)),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Jihad Yaghie",style: TextStyle(fontWeight: FontWeight.w900 , fontSize: 16)),
                      SizedBox(height: 4),
                      Text("Software Developer" , style: TextStyle(color: Colors.white70,fontWeight: FontWeight.w700))
                    ],
                  )
                ],
              ),
              ),
              const Divider(color: Colors.white12),
              _item(context,Icons.person,"About","/about"),
              _item(context, Icons.star, "Skills","/skills"),
              _item(context, Icons.work, "Projects", "/projects"),
              _item(context, Icons.mail, "Contact", "/contact"),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.all(14),
                child: Text("@ 2026 Jihad Yaghie",style: TextStyle(color: Colors.white54 , fontWeight: FontWeight.w700),), 
                )    
              ],
        ) 
        ),
    );
  }
}
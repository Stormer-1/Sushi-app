import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/themes/colors.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: primaryColor,
      
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            // drawer header
            DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: primaryColor,
              ),
              child: Row(
                children: [
                  // icon
                  Icon(
                    Icons.fastfood,
                    color: Colors.white.withOpacity(0.5),
                    size: 30,
                  ),
      
                  const SizedBox(width: 10),
      
                  // text
                  Text(
                    "Sushi Mania!",
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 25,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
      
            // home list tile
            ListTile(
              // contentPadding: EdgeInsets.all(20),
              leading: Icon(
                Icons.home,
                size: 20,
                color: Colors.white.withOpacity(0.7),
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              onTap: () {},
            ),
      
            // about list tile
            ListTile(
              leading: Icon(
                Icons.info,
                size: 20,
                color: Colors.white.withOpacity(0.7),
              ),
              title: Text(
                "About",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

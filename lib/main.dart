import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const KexingHome(),
      routes: {
        '/trabajos': (context) => TrabajosPage(),
      },
    );
  }
}

class KexingHome extends StatelessWidget {
  const KexingHome({super.key});
  final String whatsappUrl = 'https://wa.me/6565310943'; // cambia por tu número
  final String facebookUrl = 'https://www.facebook.com/profile.php?id=61577368476985&notif_id=1750390962711393&notif_t=follower_invite&ref=notif&locale=es_LA';
  final String igUrl = 'https://www.instagram.com/nexyra.studio/?next=%2F';
   Future<void> _openUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'No se pudo abrir $url';
    }
  }

  @override
Widget build(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;

  return Scaffold(
    backgroundColor: Colors.black,
    body: SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.07,
              vertical: screenHeight * 0.04,
            ),
            child: Column(
              children: [

                // Imagen
                CircleAvatar(
                  radius: screenWidth * 0.15,
                  backgroundImage: AssetImage('assets/logo.png'),
                ),

                SizedBox(height: screenHeight * 0.03),

                // Título
                Text(
                  'NEXYRA',
                  style: TextStyle(
                    fontSize: screenWidth * 0.08,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyanAccent,
                  ),
                ),

                SizedBox(height: screenHeight * 0.01),

                // Subtítulo
                Text(
                  'Creamos tu estilo\ntu haces la historia.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    color: Colors.cyanAccent,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: screenHeight * 0.05),

                // Botones adaptativos
                CustomNeonButton(
                  icon: Icons.chat,
                  text: 'Escríbenos al WhatsApp',
                  borderColor: Colors.cyanAccent,
                  textColor: Colors.cyanAccent,
                  onTap: () => _openUrl(whatsappUrl),
                ),
                SizedBox(height: screenHeight * 0.025),

                CustomNeonButton(
                  icon: Icons.facebook,
                  text: 'Síguenos en Facebook',
                  borderColor: Colors.purpleAccent,
                  textColor: Colors.purpleAccent,
                  onTap: () => _openUrl(facebookUrl),
                ),
                SizedBox(height: screenHeight * 0.025),

                CustomNeonButton(
                  icon: Icons.camera_alt,
                  text: 'Síguenos en Instagram',
                  borderColor: Colors.cyanAccent,
                  textColor: Colors.cyanAccent,
                  onTap: () => _openUrl(igUrl),
                ),
                SizedBox(height: screenHeight * 0.025),

                CustomNeonButton(
                  icon: Icons.support_agent,
                  text: 'Nuestros proyectos',
                  borderColor: Colors.purpleAccent,
                  textColor: Colors.purpleAccent,
                  onTap: () {
                    Navigator.pushNamed(context, '/trabajos');
                  },
                ),

                SizedBox(height: screenHeight * 0.04),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
}

class CustomNeonButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color borderColor;
  final Color textColor;
  final VoidCallback onTap;

  const CustomNeonButton({
    super.key,
    required this.icon,
    required this.text,
    required this.borderColor,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: borderColor),
            const SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class TrabajosPage extends StatelessWidget {
  final List<String> ejemplos = [
    'Diseño de invitación para XV años',
    'Página web para tienda de ropa',
    'Banner promocional para evento escolar',
    // Puedes añadir más
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nuestros trabajos')),
      body: ListView.builder(
        itemCount: ejemplos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.check_circle_outline),
            title: Text(ejemplos[index]),
          );
        },
      ),
    );
  }
}


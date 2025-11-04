import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Asegúrate de tener este import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Asegúrate de tener este import

// --- LA PANTALLA PRINCIPAL ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Lista de imágenes (reemplaza esto con tus nombres de archivo)
  final List<String> dummyImages = const [

    'assets/images/img1.png',

    'assets/images/img2.png',

    'assets/images/img3.png',

    'assets/images/img4.png',

    'assets/images/img5.png',

    'assets/images/img6.png',

    'assets/images/img7.png',

    'assets/images/img8.png',

    'assets/images/img9.png',

    'assets/images/img10.png',

    'assets/images/img11.png',

    'assets/images/img12.png',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Usamos un ScrollConfiguration para quitar el "glow" de scroll en web
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          child: Center(
            // Centramos y limitamos el ancho máximo para profesionalismo en web
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                children: [
                  // 1. HEADER (TÍTULO)
                  _Header(),

                  // 2. TEXTO INTRODUCTORIO (¡ACTUALIZADO!)
                  _IntroText(),

                  // 3. TEXTO DE TÉCNICAS (¡NUEVO!)
                  _TechniquesText(),

                  // 4. ENCABEZADO DE GALERÍA
                  _GalleryHeader(),
                  
                  // 5. GALERÍA DE IMÁGENES
                  _ImageGallery(images: dummyImages),
                  
                  // 6. FOOTER (CONTACTO)
                  _Footer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// --- WIDGETS INTERNOS DE LA PANTALLA ---

// --- 1. HEADER ---
class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 24.0),
      child: Text(
        'Taller de Cerámica Ricardo Rojas',
        textAlign: TextAlign.center,
        // Usamos la fuente Lora (serif) para el título, como en el logo
        style: GoogleFonts.lora(
          fontSize: 48,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF6D5F5C),
        ),
      ),
    );
  }
}

// --- 2. TEXTO INTRODUCTORIO (¡ACTUALIZADO!) ---
class _IntroText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const Color colorTexto = Color(0xFF6D5F5C);
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0).copyWith(bottom: 50.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700), // Limitamos ancho del texto
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            // Estilo por defecto para todo el párrafo
            style: GoogleFonts.lato(
              fontSize: 20,
              height: 1.6, // Interlineado para mejor lectura
              fontWeight: FontWeight.w400,
              color: colorTexto.withOpacity(0.9),
            ),
            children: const [
              TextSpan(text: "Bienvenidos a nuestro refugio. Más que un taller, este es un espacio donde la calma y las manos se encuentran.\n\n"),
              TextSpan(text: "Aquí, cada pieza es un diálogo con la arcilla; una obra de artesanía única que nace sin apuros, moldeada con la paciencia que solo el oficio artesanal conoce. Creemos que la cerámica es un "),
              TextSpan(
                text: "latido de la tierra", 
                style: TextStyle(fontWeight: FontWeight.w700, fontStyle: FontStyle.italic)
              ),
              TextSpan(text: ". Es una forma de conectar con lo elemental y transformar un material simple en algo extraordinario, que lleva la huella de quien lo creó. Cada objeto es irrepetible y está lleno de dedicación."),
            ],
          ),
        ),
      ),
    );
  }
}

// --- 3. TEXTO DE TÉCNICAS (¡NUEVO!) ---
class _TechniquesText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const Color colorTexto = Color(0xFF6D5F5C);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 40.0),
      margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
      constraints: const BoxConstraints(maxWidth: 900),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3), // Un fondo sutil
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorTexto.withOpacity(0.2), width: 1),
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: GoogleFonts.lato(
            fontSize: 19,
            height: 1.5,
            fontWeight: FontWeight.w400,
            color: colorTexto,
          ),
          children: [
            TextSpan(
              text: "Técnica, Oficio y Aprendizaje\n",
              style: GoogleFonts.lora(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: colorTexto,
                height: 1.8
              ),
            ),
            const TextSpan(text: "Nuestro trabajo explora un mundo de posibilidades, combinando técnicas ancestrales y modernas. Desde la precisión y la calma del "),
            const TextSpan(text: "torno alfarero", style: TextStyle(fontWeight: FontWeight.w700)),
            const TextSpan(text: " hasta la libertad del "),
            const TextSpan(text: "modelado manual", style: TextStyle(fontWeight: FontWeight.w700)),
            const TextSpan(text: " (como el pellizco o los colombinos), cada método ofrece un camino distinto.\n\n"),
            const TextSpan(text: "Nos especializamos en "),
            const TextSpan(text: "esgrafiado", style: TextStyle(fontWeight: FontWeight.w700)),
            const TextSpan(text: " para crear texturas y dibujos únicos sobre la superficie, y jugamos con el fuego y los "),
            const TextSpan(text: "esmaltes", style: TextStyle(fontWeight: FontWeight.w700)),
            const TextSpan(text: " para lograr paletas de colores irrepetibles.\n\n"),
            TextSpan(
              text: "Si sentís la curiosidad de crear, también abrimos las puertas del taller. Ofrecemos ",
              style: TextStyle(color: colorTexto.withOpacity(0.9)),
            ),
            TextSpan(
              text: "clases",
              style: TextStyle(fontWeight: FontWeight.w700, color: colorTexto),
            ),
            TextSpan(
              text: " para todos los niveles, donde podés desconectar de la rutina y aprender a crear tus propias piezas desde cero.",
              style: TextStyle(color: colorTexto.withOpacity(0.9)),
            ),
          ],
        ),
      ),
    );
  }
}


// --- 4. ENCABEZADO DE GALERÍA ---
class _GalleryHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0).copyWith(bottom: 30.0, top: 30.0),
      child: Text(
        "Explora Nuestro Trabajo",
        style: GoogleFonts.lora(
          fontSize: 32,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF6D5F5C),
        ),
      ),
    );
  }
}


// --- 5. GALERÍA ---
class _ImageGallery extends StatelessWidget {
  final List<String> images;
  const _ImageGallery({required this.images});

  @override
  Widget build(BuildContext context) {
    // LayoutBuilder nos permite hacer la grilla responsive
    return LayoutBuilder(
      builder: (context, constraints) {
        // Ajustamos el número de columnas según el ancho de la pantalla
        int crossAxisCount;
        if (constraints.maxWidth > 900) {
          crossAxisCount = 4; // 4 columnas en pantallas grandes
        } else if (constraints.maxWidth > 600) {
          crossAxisCount = 3; // 3 en medianas
        } else {
          crossAxisCount = 2; // 2 en móviles
        }

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.0, // Imágenes cuadradas
          ),
          itemCount: images.length,
          shrinkWrap: true, // Para que funcione dentro de un Column
          physics: const NeverScrollableScrollPhysics(), // El scroll lo maneja el SingleChildScrollView
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          itemBuilder: (context, index) {
            return _ImageTile(imagePath: images[index]);
          },
        );
      },
    );
  }
}

// --- WIDGET PARA CADA IMAGEN DE LA GALERÍA ---
class _ImageTile extends StatefulWidget {
  final String imagePath;
  const _ImageTile({required this.imagePath});

  @override
  State<_ImageTile> createState() => _ImageTileState();
}

class _ImageTileState extends State<_ImageTile> {
  bool _isHovered = false;

  void _showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min, // Esto es clave
          children: [
            // --- CORRECCIÓN DE OVERFLOW ---
            Flexible(
              child: ClipRRect(
            // --- FIN CORRECCIÓN ---
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget.imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.5),
              ),
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text(
                'Cerrar',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _showImageDialog(context),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          // Aplicamos escala y sombra en el hover
          transform: _isHovered
              ? (Matrix4.identity()..scale(1.03)) // Zoom leve
              : Matrix4.identity(),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: _isHovered
                ? [ // Sombra profesional
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    )
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    )
                  ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              widget.imagePath,
              fit: BoxFit.cover,
              // Error builder por si falta una imagen
              errorBuilder: (context, error, stackTrace) => const Center(
                child: Icon(Icons.broken_image, color: Colors.grey, size: 40),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// --- 6. FOOTER ---
class _Footer extends StatelessWidget {
  
  // Función helper para lanzar URLs
  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      // Podrías manejar el error aquí (ej. un snackbar)
      debugPrint('No se pudo lanzar $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color colorTexto = Color(0xFF6D5F5C);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 24.0),
      margin: const EdgeInsets.only(top: 60),
      width: double.infinity,
      // Color de fondo sutilmente diferente o con un borde
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: colorTexto.withOpacity(0.2), width: 1),
        ),
      ),
      child: Column(
        children: [
          Text(
            'Contacto',
            style: GoogleFonts.lora(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: colorTexto,
            ),
          ),
          const SizedBox(height: 30),
          // Fila para WhatsApp
          _InfoRow(
            iconWidget: FaIcon(
              FontAwesomeIcons.whatsapp,
              color: colorTexto,
              size: 22,
            ),
            text: '11 3282-0164',
            onTap: () {
              // El +549 es clave para chats internacionales de WhatsApp
              _launchURL('https://wa.me/5491132820164');
            },
          ),
          const SizedBox(height: 20),
          // Fila para la Dirección
          _InfoRow(
            iconWidget: Icon(
              Icons.location_on_outlined,
              color: colorTexto,
              size: 24, // Ajustado ligeramente para alinear mejor con el wpp
            ),
            text: 'Fray Castañeda 2488, Ricardo Rojas',
            onTap: () {
              // URL encode para asegurar que los espacios funcionen
              _launchURL('https://www.google.com/maps/search/?api=1&query=Fray+castañeda+2488,+Ricardo+Rojas');
            },
          ),
        
        ],
      ),
    );
  }
}

// --- WIDGET HELPER PARA LAS FILAS DEL FOOTER (MODIFICADO) ---
class _InfoRow extends StatelessWidget {
  // Cambiamos 'IconData icon' por 'Widget iconWidget'
  final Widget iconWidget;
  final String text;
  final VoidCallback onTap;

  const _InfoRow({
    required this.iconWidget, // Actualizado
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const Color colorTexto = Color(0xFF6D5F5C);

    // Usamos MouseRegion para que la manito aparezca en toda la fila
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector( // Cambiado de InkWell a GestureDetector para mejor control
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min, // Para que no ocupe todo el ancho
            children: [
              // Simplemente usamos el widget que nos pasaron
              iconWidget,
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  text,
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: colorTexto,
                    // --- CORREGIDO SIN SUBRAYADO ---
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
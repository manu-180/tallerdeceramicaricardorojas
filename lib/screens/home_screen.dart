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

                  // 2. TEXTO INTRODUCTORIO (¡NUEVO!)
                  _IntroText(),

                  // 3. ENCABEZADO DE GALERÍA (¡NUEVO!)
                  _GalleryHeader(),
                  
                  // 4. GALERÍA DE IMÁGENES
                  _ImageGallery(images: dummyImages),
                  
                  // 5. FOOTER (CONTACTO)
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

// --- 2. TEXTO INTRODUCTORIO (¡NUEVO!) ---
class _IntroText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0).copyWith(bottom: 50.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700), // Limitamos ancho del texto
        child: Text(
          "Bienvenidos. En este taller, cada pieza es una obra única de artesanía, moldeada con paciencia y llena de dedicación. Creemos que la cerámica es más que arcilla; es una forma de conectar con la tierra y transformar lo simple en algo extraordinario.",
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            fontSize: 20,
            height: 1.6, // Interlineado para mejor lectura
            fontWeight: FontWeight.w400,
            color: const Color(0xFF6D5F5C).withOpacity(0.9),
          ),
        ),
      ),
    );
  }
}

// --- 3. ENCABEZADO DE GALERÍA (¡NUEVO!) ---
class _GalleryHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0).copyWith(bottom: 30.0),
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


// --- 4. GALERÍA ---
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
          mainAxisSize: MainAxisSize.min, // Esto es clave para que la columna no ocupe toda la pantalla
          children: [

            // --- INICIO DE LA CORRECCIÓN ---
            // Envolvemos la imagen en Flexible para que se achique
            // si no hay espacio vertical suficiente.
            Flexible(
              child: ClipRRect(
            // --- FIN DE LA CORRECCIÓN ---
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

// --- 5. FOOTER ---
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
          const SizedBox(height: 40),
          Text(
            '© ${DateTime.now().year} Taller de Cerámica Ricardo Rojas. Todos los derechos reservados.',
            style: TextStyle(
              fontSize: 12,
              color: colorTexto.withOpacity(0.7),
            ),
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
                    // Dejamos el subrayado constante para que sea obvio que es un link
                    decoration: TextDecoration.underline,
                    decorationThickness: 0.5,
                    decorationColor: colorTexto.withOpacity(0.8),
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
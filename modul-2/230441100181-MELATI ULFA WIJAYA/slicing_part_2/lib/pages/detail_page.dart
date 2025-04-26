import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:typed_data';

class DetailPage extends StatelessWidget {
  final String? harga;
  final Uint8List? imageBytes; // menambahkan parameter gambar

  const DetailPage({super.key, this.harga, this.imageBytes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // tombol kembali di sebelah kiri
          },
        ),
        centerTitle: true,
        title: const Text(
          'National Park Yosemite',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menampilkan gambar dari imageBytes
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child:
                  imageBytes == null
                      ? Image.asset(
                        'assets/images/Panjang.png', // fallback jika gambar tidak ada
                        fit: BoxFit.cover,
                      )
                      : Image.memory(
                        imageBytes!, // menampilkan gambar yang diupload
                        fit: BoxFit.cover,
                      ),
            ),
            const SizedBox(height: 16),
            //  informasi wisata
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Kiri: Kategori & Lokasi
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        //ikon dan teks kategori
                        children: const [
                          Icon(
                            FontAwesomeIcons.tree,
                            size: 18,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Wisata Alam',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/Location.svg',
                            width: 12,
                            height: 12,
                            color: Colors.black54,
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            'California',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              color: Color(0xFF424040),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Kanan: Harga
                Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.ticket,
                      size: 20,
                      color: Colors.black87,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      harga ?? '30.000,00',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16),
            const Text(
              'Lorem ipsum est donec non interdum amet phasellus egestas id dignissim in vestibulum augue ut a lectus rhoncus sed ullamcorper at vestibulum sed mus neque amet turpis placerat in luctus at eget egestas praesent congue semper in facilisis purus dis pharetra odio ullamcorper euismod a donec consectetur pellentesque pretium sapien proin tincidunt non augue turpis massa euismod quis lorem et feugiat ornare id cras sed eget adipiscing dolor urna mi sit a a auctor mattis urna fermentum facilisi sed aliquet odio at suspendisse posuere tellus pellentesque id quis libero fames blandit ullamcorper interdum eget placerat tortor cras nulla consectetur et duis viverra mattis libero scelerisque gravida egestas blandit tincidunt ullamcorper auctor aliquam leo urna adipiscing est ut ipsum consectetur id erat semper fames elementum rhoncus quis varius pellentesque quam neque vitae sit velit leo massa habitant tellus velit pellentesque cursus laoreet donec etiam id vulputate nisi integer eget gravida volutpat.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}

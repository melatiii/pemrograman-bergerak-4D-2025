// TambahWisataPage implementation
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TambahWisataPage extends StatefulWidget {
  final Function(Map<String, dynamic>) onTambah;

  const TambahWisataPage({super.key, required this.onTambah});

  @override
  State<TambahWisataPage> createState() => _TambahWisataPageState();
}

class _TambahWisataPageState extends State<TambahWisataPage> {
  final _formKey = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final lokasiController = TextEditingController();
  final hargaController = TextEditingController();
  final deskripsiController = TextEditingController();

  // menyimpan gambar diuploud dan jenis wisata
  String? jenisWisata;
  Uint8List? _imageBytes;
  // dafrtar pilihan jenis wisita
  final List<String> jenisWisataList = [
    'Alam',
    'Rekreasi',
    'Kuliner',
    'Bahari',
    'Budaya',
  ];
  // pick memilih gambar dari galeri
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
      });
    }
  }

  // mereset semua input form ke nilai awal
  void resetForm() {
    setState(() {
      namaController.clear();
      lokasiController.clear();
      hargaController.clear();
      deskripsiController.clear();
      jenisWisata = null;
      _imageBytes = null;
    });
  }

  // gambar harus di uploud
  void simpanData() {
    if (_formKey.currentState!.validate()) {
      if (_imageBytes == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Gambar harus diupload')));
        return;
      }

      final data = {
        'nama': namaController.text,
        'lokasi': lokasiController.text,
        'harga': hargaController.text,
        'deskripsi': deskripsiController.text,
        'jenis': jenisWisata,
        'image': _imageBytes,
      };
      widget.onTambah(data);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 208, 208, 208),
      appBar: AppBar(
        title: const Text('Tambah Wisata'),
        backgroundColor: Colors.grey[300],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        //agar bisa di scroll
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                //area uploud gambar
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child:
                    _imageBytes == null
                        ? const Icon(
                          Icons.add_photo_alternate,
                          size: 60,
                          color: Colors.grey,
                        )
                        : ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.memory(_imageBytes!, fit: BoxFit.cover),
                        ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: pickImage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                child: const Text(
                  'Upload Image',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              buildInputField('Nama Wisata', namaController),
              buildInputField('Lokasi Wisata', lokasiController),
              buildDropdownField(),
              buildInputField(
                'Harga Tiket',
                hargaController,
                keyboardType: TextInputType.number,
              ),
              buildInputField('Deskripsi', deskripsiController, maxLines: 4),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: simpanData, //untuk menyimpan data
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  minimumSize: const Size(double.infinity, 45),
                ),
                child: const Text(
                  'Simpan',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: resetForm, //reset data
                child: const Text(
                  'Reset',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputField(
    String label,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label :'),
          const SizedBox(height: 6),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: maxLines,
            validator: (value) {
              //validasi wajib diisi
              if (value == null || value.isEmpty) {
                return '$label tidak boleh kosong';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Masukkan $label di sini',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDropdownField() {
    //dropdown memilih jenis wisata
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Jenis Wisata :'),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: DropdownButtonFormField<String>(
              value: jenisWisata,
              hint: const Text('Pilih Jenis Wisata'),
              onChanged: (value) {
                setState(() {
                  jenisWisata = value;
                });
              },
              validator:
                  (value) =>
                      value == null ? 'Jenis wisata harus dipilih' : null,
              items:
                  jenisWisataList
                      .map(
                        (jenis) =>
                            DropdownMenuItem(value: jenis, child: Text(jenis)),
                      )
                      .toList(),
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}

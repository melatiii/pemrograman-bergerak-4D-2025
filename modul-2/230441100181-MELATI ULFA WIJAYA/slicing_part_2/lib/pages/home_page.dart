import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Slicing_part_2/pages/tambah_wisata.dart';
import 'package:Slicing_part_2/pages/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> daftarWisata = []; //menyimpan wisata yg ditambah user

  void tambahWisataBaru(Map<String, dynamic> wisata) {
    setState(() {
      daftarWisata.add(wisata);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push( //tombol tambah mengarah ke page tambah wisata 
            context,
            MaterialPageRoute(
              builder:
                  (context) => TambahWisataPage(onTambah: tambahWisataBaru),
            ),
          );
        },
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _buildHeader(),
                  const SizedBox(height: 20),
                  _buildSectionTitle('Hot Places'),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            _buildHotPlaces(),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Best Hotels'),
                  const SizedBox(height: 10),
                  _buildHotelList(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Hi, User',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage('assets/images/Ellipse 1.png'),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Text('See All', style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildHotPlaces() {
    final List<Map<String, String>> places = [
      {
        'image': 'assets/images/Rectangle 4.png',
        'title': 'National Park Yosemite',
        'location': 'California',
      },
      {
        'image': 'assets/images/Rectangle 4.png',
        'title': 'National Park Yosemite',
        'location': 'California',
      },
      {
        'image': 'assets/images/Rectangle 4.png',
        'title': 'National Park Yosemite',
        'location': 'California',
      },
      {
        'image': 'assets/images/Rectangle 4.png',
        'title': 'National Park Yosemite',
        'location': 'California',
      },
      {
        'image': 'assets/images/Rectangle 4.png',
        'title': 'National Park Yosemite',
        'location': 'California',
      },
    ];

    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: places.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final place = places[index];
          return Container(
            width: 240,
            height: 70,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    place['image']!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place['title']!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF424040),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/Location.svg',
                            width: 12,
                            height: 12,
                            color: Colors.black54,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            place['location']!,
                            style: const TextStyle(
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
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHotelList(BuildContext context) {
    // Data statis (default)
    final List<Map<String, dynamic>> dataAwal = [
      {
        'image': 'assets/images/Panjang.png',
        'nama': 'National Park Yosemite',
        'deskripsi':
            'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis, doloribus.',
        'lokasi': 'California',
        'harga': '30.000,00',
        'isAsset': true,
      },

      {
        'image': 'assets/images/Panjang.png',
        'nama': 'National Park Yosemite',
        'deskripsi':
            'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis, doloribus.',
        'lokasi': 'California',
        'harga': '30.000,00',
        'isAsset': true,
      },

      {
        'image': 'assets/images/Panjang.png',
        'nama': 'National Park Yosemite',
        'deskripsi':
            'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis, doloribus.',
        'lokasi': 'California',
        'harga': '30.000,00',
        'isAsset': true,
      },

      {
        'image': 'assets/images/Panjang.png',
        'nama': 'National Park Yosemite',
        'deskripsi':
            'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis, doloribus.',
        'lokasi': 'California',
        'harga': '30.000,00',
        'isAsset': true,
      },
    ];

    // Gabungkan data awal dengan daftar wisata user
    final allData = [
      ...dataAwal,
      ...daftarWisata.map((item) => {...item, 'isAsset': false}),
    ];

    return Column(
      children:
          allData.map((wisata) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(harga: wisata['harga']),
                  ),
                );
              },

              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 5),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child:
                          wisata['isAsset']
                              ? Image.asset(
                                wisata['image'],
                                width: 100,
                                height: 80,
                                fit: BoxFit.cover,
                              )
                              : Image.memory(
                                wisata['image'],
                                width: 100,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            wisata['nama'] ?? 'Tanpa Nama',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF424040),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            wisata['deskripsi'] ?? '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF424040),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Lokasi: ${wisata['lokasi'] ?? '-'}',
                            style: const TextStyle(fontSize: 12),
                          ),
                          Text(
                            'Harga: Rp ${wisata['harga'] ?? '-'}',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
    );
  }
}

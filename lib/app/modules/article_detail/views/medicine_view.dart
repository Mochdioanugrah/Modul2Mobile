import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/medicine_controller.dart';
import 'package:tugas1mobile/app/modules/home/views/home_view.dart'; // Import halaman HomeView

class MedicineView extends StatelessWidget {
  // Membuat instance dari MedicineController
  final MedicineController controller = Get.put(MedicineController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            // Membuka Drawer ketika tombol menu diklik
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart,
                color: Color.fromARGB(255, 251, 251, 251)),
            onPressed: () {
              // Bisa implementasikan aksi lain di sini
            },
          )
        ],
      ),
      // Tambahkan Drawer di sini
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                'MEDITEK',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildSearchBar(),
              const SizedBox(height: 20),
              _buildUploadPrescription(),
              const SizedBox(height: 20),
              _buildBanner(),
              const SizedBox(height: 20),
              _buildCategories(),
              const SizedBox(height: 20),
              _buildImagePicker(),
              const SizedBox(height: 20),
              // Tambahkan tombol untuk masuk ke halaman HomeView
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(HomeView()); // Navigasi ke halaman HomeView
                  },
                  child: const Text('Masuk ke Halaman HomeView'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16),
                    backgroundColor: Colors.purple,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // Sidebar (Drawer) widget
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            child: const Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context); // Menutup drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.navigate_next),
            title: const Text('Halaman Selanjutnya'),
            onTap: () {
              Navigator.pop(context); // Menutup drawer
              // Navigasi ke halaman selanjutnya
              Get.to(HomeView()); // Navigasi ke halaman HomeView
            },
          ),
        ],
      ),
    );
  }

  // Search bar widget
  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Cari Obat',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Upload Prescription section
  Widget _buildUploadPrescription() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.purple[100],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Pesan Obat',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Pesan lebih mudah di MEDITEK'),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // Aksi saat tombol ditekan
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 180, 89, 196),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: const Text(
              'PESAN',
              style: TextStyle(
                color: Color.fromARGB(
                    255, 216, 203, 203), // Mengubah warna teks menjadi putih
              ),
            ),
          )
        ],
      ),
    );
  }

  // Banner section
  Widget _buildBanner() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Diskon 80% \ndi Produk Kesehatan',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Image.asset(
            'assets/medicine_bottles.png',
            height: 80,
          ),
        ],
      ),
    );
  }

  // Popular Categories section
  Widget _buildCategories() {
    final List<Map<String, dynamic>> categories = [
      {'title': 'Nutritional Drinks', 'image': 'assets/nutrition.png'},
      {'title': 'Ayurveda', 'image': 'assets/ayurveda.png'},
      {'title': 'Vitamin', 'image': 'assets/vitamin.png'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Popular Categories',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset(
                  categories[0]['image'],
                  height: 60,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image, size: 60);
                  },
                ),
                const SizedBox(height: 8),
                Text(categories[0]['title']),
              ],
            ),
            Column(
              children: [
                Image.asset(
                  categories[1]['image'],
                  height: 60,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image, size: 60);
                  },
                ),
                const SizedBox(height: 8),
                Text(categories[1]['title']),
              ],
            ),
            Column(
              children: [
                Image.asset(
                  categories[2]['image'],
                  height: 60,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image, size: 60);
                  },
                ),
                const SizedBox(height: 8),
                Text(categories[2]['title']),
              ],
            ),
          ],
        ),
      ],
    );
  }

  // Image picker widget
  Widget _buildImagePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text(
          'Upload resep dari dokter',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Obx(() {
          // Observing selected image from controller
          return controller.selectedImage.value == null
              ? ElevatedButton(
                  onPressed: () {
                    controller.pickImage(ImageSource.gallery);
                  },
                  child: const Text('ambil dari galeri'),
                )
              : Column(
                  children: [
                    Image.file(controller.selectedImage.value!),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        controller.pickImage(ImageSource.camera);
                      },
                      child: const Text('Ubah kamera (Camera)'),
                    ),
                  ],
                );
        }),
      ],
    );
  }

  // Bottom Navigation Bar
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'Order',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_offer),
          label: 'Offers',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.grey,
    );
  }
}

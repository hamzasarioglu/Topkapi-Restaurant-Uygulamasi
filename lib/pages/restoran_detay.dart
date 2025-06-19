import 'package:flutter/material.dart';
import 'package:restoran_app/models/restoran_model.dart';
import 'package:restoran_app/snackbar_show.dart';

class RestoranDetay extends StatefulWidget {
  final RestoranModel restoran;
  const RestoranDetay({super.key, required this.restoran});

  @override
  State<RestoranDetay> createState() => _RestoranDetayState();
}

List<MenuModel> siparisler = [];
int fiyat = 0;

class _RestoranDetayState extends State<RestoranDetay> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  // Tüm menü öğelerini tek listede topla
  List<MenuModel> get tumMenuler {
    List<MenuModel> tumListe = [];
    widget.restoran.kategoriler.forEach((kategori, menuler) {
      tumListe.addAll(menuler);
    });
    return tumListe;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MyEndDrawer(menu: siparisler, Scaffoldkey: _scaffoldKey),
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.restoran.ad),
        backgroundColor: const Color(0xFF2E7D32),
        actions: [
          IconButton(
            onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 180,
            width: double.infinity,
            child: Image.asset(
              "assets/restoranlar/${widget.restoran.foto}",
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.restoran.kategoriler.length,
              itemBuilder: (context, categoryIndex) {
                String kategoriAdi = widget.restoran.kategoriler.keys.elementAt(
                  categoryIndex,
                );
                List<MenuModel> kategoriMenuleri =
                    widget.restoran.kategoriler[kategoriAdi]!;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      color: const Color(0xFF2E7D32),
                      child: Text(
                        kategoriAdi,
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: kategoriMenuleri.length,
                      itemBuilder: (context, menuIndex) {
                        MenuModel siparis = kategoriMenuleri[menuIndex];
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFF4CAF50).withOpacity(0.1),
                                const Color(0xFF81C784).withOpacity(0.1),
                              ],
                            ),
                            border: Border.all(
                              color: const Color(0xFF4CAF50).withOpacity(0.3),
                            ),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {
                              fiyat += siparis.fiyat;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "${siparis.isim} siparişinize eklendi!",
                                  ),
                                  backgroundColor: const Color(0xFF4CAF50),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                              siparisler.add(siparis);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      siparis.fotoYol,
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                      errorBuilder: (
                                        context,
                                        error,
                                        stackTrace,
                                      ) {
                                        return Container(
                                          width: 60,
                                          height: 60,
                                          color: Colors.grey[300],
                                          child: const Icon(Icons.restaurant),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          siparis.isim,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleMedium?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xFF2E7D32),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "${siparis.fiyat} TL",
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleSmall?.copyWith(
                                            color: const Color(0xFF4CAF50),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF4CAF50),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyEndDrawer extends StatefulWidget {
  final List<MenuModel> menu;
  final GlobalKey<ScaffoldState> Scaffoldkey;
  const MyEndDrawer({required this.menu, required this.Scaffoldkey, super.key});

  @override
  State<MyEndDrawer> createState() => _MyEndDrawerState();
}

class _MyEndDrawerState extends State<MyEndDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 120.0,
            child: DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(color: Color(0xFF2E7D32)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Siparişleriniz:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        fiyat = 0;
                        siparisler.clear();
                        setState(() {});
                      },
                      icon: const Icon(Icons.cancel, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ...List.generate(
                        widget.menu.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF4CAF50).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xFF4CAF50).withOpacity(0.3),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.menu[index].isim,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text(
                                "${widget.menu[index].fiyat} TL",
                                style: const TextStyle(
                                  color: Color(0xFF2E7D32),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            color: const Color(0xFF2E7D32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Toplam Fiyat",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$fiyat TL",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 70,
            width: double.infinity,
            color: const Color(0xFF4CAF50),
            child: TextButton(
              child: Text(
                "Sipariş Ver!",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        actions: [
                          TextButton(
                            onPressed: () {
                              snackBarGoster(
                                context,
                                "Siparişiniz alınmıştır!",
                              );
                              widget.menu.clear();
                              fiyat = 0;
                              Navigator.pop(context);
                              widget.Scaffoldkey.currentState!.closeEndDrawer();
                              setState(() {});
                            },
                            child: const Text(
                              "Evet",
                              style: TextStyle(color: Color(0xFF2E7D32)),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Hayır",
                              style: TextStyle(color: Color(0xFF2E7D32)),
                            ),
                          ),
                        ],
                        content: const Text(
                          "Sipariş vermek istediğinizden emin misiniz?",
                        ),
                      ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

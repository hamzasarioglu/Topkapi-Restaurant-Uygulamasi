import 'package:flutter/material.dart';
import 'package:restoran_app/models/restoran_model.dart';
import 'package:restoran_app/pages/restoran_detay.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Topkapı Restaurant"),
        backgroundColor: const Color(0xFF2E7D32),
      ),
      body: GridView.builder(
        itemCount: restoranlar.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            RestoranDetay(restoran: restoranlar[index]),
                  ),
                ),
            child: Container(
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.black54),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          restoranlar[index].konum,
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          restoranlar[index].ad,
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.all(20),
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/restoranlar/${restoranlar[index].foto}",
                  ),
                  fit: BoxFit.fitWidth,
                ),
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          );
        },
      ),
    );
  }
}

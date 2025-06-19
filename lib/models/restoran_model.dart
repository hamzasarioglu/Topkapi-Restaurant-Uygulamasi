class RestoranModel {
  int id;
  String ad;
  String foto;
  String konum;
  Map<String, List<MenuModel>> kategoriler;

  RestoranModel({
    required this.id,
    required this.ad,
    required this.foto,
    required this.konum,
    required this.kategoriler,
  });
}

class MenuModel {
  int id;
  String isim;
  String fotoYol;
  int fiyat;
  String kategori;

  MenuModel({
    required this.id,
    required this.isim,
    required this.fiyat,
    required this.fotoYol,
    required this.kategori,
  });
}

// Kategorilere göre düzenlenmiş menü
Map<String, List<MenuModel>> topkapiMenu = {
  "Ana Yemekler": [
    MenuModel(
      id: 0,
      isim: "Izgara Tavuk",
      fiyat: 120,
      fotoYol:
          "https://images.unsplash.com/photo-1532550907401-a500c9a57435?w=400",
      kategori: "Ana Yemekler",
    ),
    MenuModel(
      id: 1,
      isim: "Köfte",
      fiyat: 110,
      fotoYol:
          "https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=400",
      kategori: "Ana Yemekler",
    ),
    MenuModel(
      id: 2,
      isim: "Adana Kebap",
      fiyat: 140,
      fotoYol:
          "https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=400",
      kategori: "Ana Yemekler",
    ),
    MenuModel(
      id: 3,
      isim: "Döner",
      fiyat: 90,
      fotoYol:
          "https://images.unsplash.com/photo-1613564834361-9436948817d1?w=400",
      kategori: "Ana Yemekler",
    ),
    MenuModel(
      id: 4,
      isim: "Balık Izgara",
      fiyat: 160,
      fotoYol:
          "https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?w=400",
      kategori: "Ana Yemekler",
    ),
    MenuModel(
      id: 5,
      isim: "Kuzu Şiş",
      fiyat: 180,
      fotoYol:
          "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=400",
      kategori: "Ana Yemekler",
    ),
    MenuModel(
      id: 6,
      isim: "Tavuk Şiş",
      fiyat: 130,
      fotoYol:
          "https://images.unsplash.com/photo-1603360946369-dc9bb6258143?w=400",
      kategori: "Ana Yemekler",
    ),
    MenuModel(
      id: 28,
      isim: "Spagetti Bolonez",
      fiyat: 85,
      fotoYol:
          "https://images.unsplash.com/photo-1551892374-ecf8754cf8b0?w=400",
      kategori: "Ana Yemekler",
    ),
  ],

  "Salatalar": [
    MenuModel(
      id: 16,
      isim: "Sezar Salata",
      fiyat: 70,
      fotoYol:
          "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400",
      kategori: "Salatalar",
    ),
    MenuModel(
      id: 17,
      isim: "Yunan Salatası",
      fiyat: 65,
      fotoYol:
          "https://images.unsplash.com/photo-1540420773420-3366772f4999?w=400",
      kategori: "Salatalar",
    ),
    MenuModel(
      id: 19,
      isim: "Tavuklu Salata",
      fiyat: 80,
      fotoYol:
          "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400",
      kategori: "Salatalar",
    ),
  ],

  "Pizzalar": [
    MenuModel(
      id: 8,
      isim: "Margherita Pizza",
      fiyat: 100,
      fotoYol:
          "https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=400",
      kategori: "Pizzalar",
    ),
    MenuModel(
      id: 9,
      isim: "Karışık Pizza",
      fiyat: 120,
      fotoYol:
          "https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400",
      kategori: "Pizzalar",
    ),
    MenuModel(
      id: 10,
      isim: "Sucuklu Pizza",
      fiyat: 110,
      fotoYol:
          "https://images.unsplash.com/photo-1628840042765-356cda07504e?w=400",
      kategori: "Pizzalar",
    ),
  ],

  "Çorbalar": [
    MenuModel(
      id: 25,
      isim: "Mercimek Çorbası",
      fiyat: 40,
      fotoYol:
          "https://images.unsplash.com/photo-1547592180-85f173990554?w=400",
      kategori: "Çorbalar",
    ),
    MenuModel(
      id: 26,
      isim: "Domates Çorbası",
      fiyat: 45,
      fotoYol:
          "https://images.unsplash.com/photo-1547592166-23ac45744acd?w=400",
      kategori: "Çorbalar",
    ),
    MenuModel(
      id: 27,
      isim: "Tavuk Çorbası",
      fiyat: 50,
      fotoYol:
          "https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=400",
      kategori: "Çorbalar",
    ),
  ],

  "Tatlılar": [
    MenuModel(
      id: 31,
      isim: "Tiramisu",
      fiyat: 60,
      fotoYol:
          "https://images.unsplash.com/photo-1571877227200-a0d98ea607e9?w=400",
      kategori: "Tatlılar",
    ),
    MenuModel(
      id: 32,
      isim: "Cheesecake",
      fiyat: 55,
      fotoYol:
          "https://images.unsplash.com/photo-1524351199678-941a58a3df50?w=400",
      kategori: "Tatlılar",
    ),
    MenuModel(
      id: 34,
      isim: "Sütlaç",
      fiyat: 45,
      fotoYol:
          "https://images.unsplash.com/photo-1488477181946-6428a0291777?w=400",
      kategori: "Tatlılar",
    ),
    MenuModel(
      id: 35,
      isim: "Chocolate Lava Cake",
      fiyat: 65,
      fotoYol:
          "https://images.unsplash.com/photo-1606313564200-e75d5e30476c?w=400",
      kategori: "Tatlılar",
    ),
  ],

  "İçecekler": [
    MenuModel(
      id: 36,
      isim: "Kola",
      fiyat: 25,
      fotoYol:
          "https://images.unsplash.com/photo-1581006852262-e4307cf6283a?w=400",
      kategori: "İçecekler",
    ),
    MenuModel(
      id: 37,
      isim: "Fanta",
      fiyat: 25,
      fotoYol:
          "https://images.unsplash.com/photo-1624517452488-04869289c4ca?w=400",
      kategori: "İçecekler",
    ),
    MenuModel(
      id: 38,
      isim: "Ayran",
      fiyat: 20,
      fotoYol:
          "https://images.unsplash.com/photo-1563227812-0ea4c22e6cc8?w=400",
      kategori: "İçecekler",
    ),
    MenuModel(
      id: 39,
      isim: "Su",
      fiyat: 15,
      fotoYol:
          "https://images.unsplash.com/photo-1548839140-29a749e1cf4d?w=400",
      kategori: "İçecekler",
    ),
    MenuModel(
      id: 40,
      isim: "Çay",
      fiyat: 18,
      fotoYol:
          "https://images.unsplash.com/photo-1544787219-7f47ccb76574?w=400",
      kategori: "İçecekler",
    ),
    MenuModel(
      id: 41,
      isim: "Türk Kahvesi",
      fiyat: 30,
      fotoYol:
          "https://images.unsplash.com/photo-1610632380989-680fe40816c6?w=400",
      kategori: "İçecekler",
    ),
    MenuModel(
      id: 42,
      isim: "Cappuccino",
      fiyat: 35,
      fotoYol:
          "https://images.unsplash.com/photo-1572442388796-11668a67e53d?w=400",
      kategori: "İçecekler",
    ),
    MenuModel(
      id: 43,
      isim: "Fresh Orange Juice",
      fiyat: 40,
      fotoYol:
          "https://images.unsplash.com/photo-1621506289937-a8e4df240d0b?w=400",
      kategori: "İçecekler",
    ),
  ],
};

List<RestoranModel> restoranlar = [
  RestoranModel(
    id: 0,
    ad: "Topkapı Restaurant",
    foto: "sual.png",
    konum: "İstanbul",
    kategoriler: topkapiMenu,
  ),
];

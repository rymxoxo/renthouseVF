class House {
  String name;
  String address;
  String imageUrl;

  House(this.name, this.address, this.imageUrl);

  static List<House> generateRecommended() {
    return [
      House('Appartment Marsa', 'Route Marsa', 'assets/images/house01.jpeg'),
      House('Gammarth Villa', 'Route Gammarth', 'assets/images/house02.jpeg'),
    ];
  }

  static List<House> generateBestOffer() {
    return [
      House('Appartment Marsa', '1500dt/month', 'assets/images/offer01.jpeg'),
      House('Gammarth Villa', '1000dt/month', 'assets/images/offer02.jpeg'),
    ];
  }
}

class Destinos {
  String imageUrl;
  String ciudad;
  String pais;
  String descripcion;

  Destinos({
    this.imageUrl,
    this.ciudad,
    this.pais,
    this.descripcion,
  });
}

List<Destinos> destinos = [
  Destinos(
    imageUrl: 'assets/images/pucon.jpg',
    ciudad: 'Pucon',
    pais: 'Chile',
    descripcion: 'Visita Pucon para una aventura inolvidable.',
  ),
  Destinos(
    imageUrl: 'assets/images/puertomontt.jpg',
    ciudad: 'Puerto Montt',
    pais: 'Chile',
    descripcion: 'Visita Puerto Montt para vivir momentos lindos.',
  ),
  Destinos(
    imageUrl: 'assets/images/patagonia.jpg',
    ciudad: 'Patagonia',
    pais: 'Chile',
    descripcion: 'Visita Patagonia para vivir momentos inolvidables.',
  ),
  Destinos(
    imageUrl: 'assets/images/puntaArenas.jpg',
    ciudad: 'Punta Arenas',
    pais: 'Chile',
    descripcion: 'Visite Punta Arenas para vivir momentos especiales.',
  ),
  Destinos(
    imageUrl: 'assets/images/Villarrica.jpg',
    ciudad: 'Villa rica',
    pais: 'Chile',
    descripcion: 'Visite Villa Rica para vivir momentos geniales.',
  ),
];

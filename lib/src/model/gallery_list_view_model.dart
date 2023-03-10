class GalleryListViewModel{
  final String imageUrl;
  GalleryListViewModel({
    required this.imageUrl,
  });
}

class AllGalleryListViewModel{
  final String imageUrl;
  final int galleryImageCrossAxisCellCount;
  final double galleryImageMainAxisCellCount;
  AllGalleryListViewModel({
    required this.imageUrl,
    required this.galleryImageMainAxisCellCount,
    required this.galleryImageCrossAxisCellCount
  });
}

final List<GalleryListViewModel> galleryImageList = [
  GalleryListViewModel(
    imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/Before_Machu_Picchu.jpg/1200px-Before_Machu_Picchu.jpg",
  ),
  GalleryListViewModel(
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeO1YN0h533FW_p45ZoGE4z3F4t3Ryi5Lmjw&usqp=CAU",
  ),
  GalleryListViewModel(
      imageUrl: "https://www.villa-bali.com/guide/wp-content/uploads/2013/07/14823672449_c1a13ab10e_k-630x419.jpg",
  ),
  GalleryListViewModel(
      imageUrl: "https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1200,h_630/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/cb3rcucjerqdltdquhlo/Bali%20Private%20UNESCO%20Heritage%20Sites%20Day%20Trip%20in%20Indonesia.jpg",
  ),
  GalleryListViewModel(
      imageUrl: "https://pictures.altai-travel.com/1920x0/panoramic-view-of-the-machu-picchu-35.jpg",
  ),
  GalleryListViewModel(
      imageUrl: "https://cdn.britannica.com/14/117414-050-3DA939E4/cave-dwellings-site-churches-homes-monks-Cappadocia.jpg",
  ),
  GalleryListViewModel(
      imageUrl: "https://previews.123rf.com/images/vita48/vita481702/vita48170200002/70823219-love-valley-in-goreme-national-park-cappadocia-turkey.jpg",
  ),
  GalleryListViewModel(
      imageUrl: "https://i0.wp.com/images.fineartamerica.com/images-medium-large-5/goreme-national-park-cappadocia-turkey-ivan-pendjakov.jpg",
  ),
  GalleryListViewModel(
      imageUrl: "https://www.worldatlas.com/r/w768/upload/10/07/ad/1024px-borobudur-nothwest-view.jpg",
  ),

];

final List<AllGalleryListViewModel> allGalleryImageList = [
  AllGalleryListViewModel(
    imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/Before_Machu_Picchu.jpg/1200px-Before_Machu_Picchu.jpg",
    galleryImageCrossAxisCellCount: 3,
    galleryImageMainAxisCellCount: 1,
  ),
  AllGalleryListViewModel(
    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeO1YN0h533FW_p45ZoGE4z3F4t3Ryi5Lmjw&usqp=CAU",
    galleryImageCrossAxisCellCount: 1,
    galleryImageMainAxisCellCount: 1.4,
  ),
  AllGalleryListViewModel(
    imageUrl: "https://www.villa-bali.com/guide/wp-content/uploads/2013/07/14823672449_c1a13ab10e_k-630x419.jpg",
    galleryImageCrossAxisCellCount: 1,
    galleryImageMainAxisCellCount: 2,
  ),
  AllGalleryListViewModel(
    imageUrl: "https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1200,h_630/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/cb3rcucjerqdltdquhlo/Bali%20Private%20UNESCO%20Heritage%20Sites%20Day%20Trip%20in%20Indonesia.jpg",
    galleryImageCrossAxisCellCount: 1,
    galleryImageMainAxisCellCount: 2,
  ),
  AllGalleryListViewModel(
    imageUrl: "https://pictures.altai-travel.com/1920x0/panoramic-view-of-the-machu-picchu-35.jpg",
    galleryImageCrossAxisCellCount: 1,
    galleryImageMainAxisCellCount: 1.4,
  ),
  AllGalleryListViewModel(
    imageUrl: "https://cdn.britannica.com/14/117414-050-3DA939E4/cave-dwellings-site-churches-homes-monks-Cappadocia.jpg",
    galleryImageCrossAxisCellCount: 1,
    galleryImageMainAxisCellCount: 2,
  ),
  AllGalleryListViewModel(
    imageUrl: "https://previews.123rf.com/images/vita48/vita481702/vita48170200002/70823219-love-valley-in-goreme-national-park-cappadocia-turkey.jpg",
    galleryImageCrossAxisCellCount: 1,
    galleryImageMainAxisCellCount: 1.4,
  ),
  AllGalleryListViewModel(
    imageUrl: "https://i0.wp.com/images.fineartamerica.com/images-medium-large-5/goreme-national-park-cappadocia-turkey-ivan-pendjakov.jpg",
    galleryImageCrossAxisCellCount: 1,
    galleryImageMainAxisCellCount: 2,
  ),
  AllGalleryListViewModel(
    imageUrl: "https://www.worldatlas.com/r/w768/upload/10/07/ad/1024px-borobudur-nothwest-view.jpg",
    galleryImageCrossAxisCellCount: 1,
    galleryImageMainAxisCellCount: 1.4,
  ),

];
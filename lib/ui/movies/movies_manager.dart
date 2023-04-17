import 'package:flutter/foundation.dart';
import '../../models/movie.dart';

class MoviesManager with ChangeNotifier {
  final List<Movie> _items = [
    Movie(
      id: 'm1',
      name: 'Black Panther 2',
      description:
          'Black Panther: Wakanda Forever là một bộ phim siêu anh hùng của Mỹ năm 2022 dựa trên nhân vật Black Panther của Marvel Comics. Được sản xuất bởi Marvel Studios và được phân phối bởi Walt Disney Studios Motion Pictures, đây là phần tiếp theo của Black Panther (2018) và là bộ phim thứ 30 trong Vũ trụ Điện ảnh Marvel (MCU).',
      nation: 'USA',
      genre: 'Superhero',
      posterUrl: 'https://metiz.vn/media/poster_film/black.jpg',
      watchUrl: 'https://youtu.be/_Z3QKkl1WyM',
      year: 2022,
      isFavorite: false,
    ),
    Movie(
      id: 'm2',
      name: 'Bỗng Dưng Trúng Số',
      description:
          'Phim Bỗng Dưng Trúng Số - 6/45 có nội dung vô cùng hài hước éo le xoay quanh Chun Woo là 1 người lính Hàn Quốc, trong lúc đang túng thiếu thì may mắn thay nhặt được 1 tấm vé số trúng độc đắc với số tiền lên đến 6 triệu đô, cứ tưởng được đổi đời nào ngờ sơ ý gió thổi bay tấm vé sang bên kia biên giới bị 1 anh lính Triều Tiên tên là Yong Ho lấy được. Bên này anh lính Hàn mong lấy tờ vé số để đổi tiền, trong khi anh chàng Yong Ho cầm trên tay tấm vé độc đắc nhưng lại không thể đổi vì đang ở Triều Tiên không thể bước chân sàng Hàn Quốc được. Thông tin này lan truyền đến tai của những đồng đội của 2 anh chàng, thế là cuộc đàm phán chia 5 xẻ 7 diễn ra. Liệu ai sẽ là người được hưởng lộc trời ban này? Mời các bạn cùng đón xem Bỗng Dưng Trúng Số - 6/45 (2022).',
      nation: 'Hàn Quốc',
      genre: 'Hài Hước',
      posterUrl:
          'https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/b/d/bdts_main-poster_vi_print_1_.jpg',
      watchUrl: 'https://youtu.be/1H9HPbWt3es',
      year: 2022,
      isFavorite: false,
    ),
    Movie(
      id: 'm3',
      name: 'Monster Portal',
      description:
          'Sau khi mất cha một phụ nữ trẻ được thừa kế tài sản của cha mình. Trong khi cố gắng tìm hiểu thêm về những bỉ ẩn về người cha chết, cô phát hiện ra rằng ngôi nhà đang được sử dụng bởi một giáo phái đang tìm cách triệu hồi những sinh vật đáng sợ nhất của HP Lovecraft.',
      nation: 'United Kingdom',
      genre: 'Kinh Dị',
      posterUrl:
          'https://m.media-amazon.com/images/M/MV5BYjg3MmExN2QtZTA2ZS00MTc1LWJjMWUtOTMwOWNiMmE0NTZhXkEyXkFqcGdeQXVyNTU2NzI2MzI@._V1_.jpg',
      watchUrl: 'https://youtu.be/JG89em8fPL0',
      year: 2022,
      isFavorite: false,
    ),
    Movie(
      id: 'm4',
      name: 'Slumberland',
      description:
          'Xứ Sở Mộng Mơ - Slumberland theo chân cô bé Nemo khám phá vùng đất kỳ diệu Slumberland cùng với người bạn Flip. Cả hai bắt đầu một hành trình đáng kinh ngạc với hy vọng tìm lại người cha đang mất tích của Nemo.',
      nation: 'USA',
      genre: 'Phiêu Lưu',
      posterUrl:
          'https://m.media-amazon.com/images/M/MV5BNDUzMzE3NDktN2JmOC00ZjJmLTg0NmMtODE0NDkzNDE5OGYwXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_.jpg',
      watchUrl: 'https://youtu.be/FBnkVJslRGo',
      year: 2022,
      isFavorite: false,
    ),
    Movie(
      id: 'm5',
      name: 'The Limit',
      description:
          'Hành trình truy đuổi bọn bắt cóc của một nữ cảnh sát (Lee Jung Hyun) đóng giả mẹ của một nạn nhân khiến chính con trai cô cũng bị đặt vào vòng nguy hiểm, khi thân phận của cô có khả năng bị bại lộ. Giới Hạn Truy Lùng không chỉ mang đến những màn rượt đuổi hồi hộp, các pha hành động mãn nhãn, mà còn là cuộc đấu trí đầy gây cấn giữa hai phe chính - tà.',
      nation: 'Hàn Quốc',
      genre: 'Tâm Lý',
      posterUrl:
          'https://m.media-amazon.com/images/M/MV5BM2Y4YzY2YjUtOTBjOS00NGVmLWFhMTUtZTRhZDgyNzIyOWIyXkEyXkFqcGdeQXVyMTAzNzI5MDE2._V1_FMjpg_UX1000_.jpg',
      watchUrl: 'https://youtu.be/ozWVNVZLaao',
      year: 2022,
      isFavorite: true,
    ),
    Movie(
      id: 'm6',
      name: 'The Inhabitant',
      description:
          'The Inhabitant kể về câu chuyện của cô bé Tara, cô biết rằng bản thân và gia đình mình có gì đó không giống với bạn bè. Và rồi một loạt các vụ án giết người bằng rìu xảy ra trong thị trấn, khiến Tara chắc chắn rằng có gì đó không đúng về gia đình của mình.',
      nation: 'USA',
      genre: 'Tâm Lý',
      posterUrl:
          'https://m.media-amazon.com/images/M/MV5BNjZmYTliYTctODcwNi00MTY3LWEzZjUtMTVlMWIyYTFkN2QzXkEyXkFqcGdeQXVyMDIyMDM0OQ@@._V1_.jpg',
      watchUrl: 'https://youtu.be/FpO37i1ZvwM',
      year: 2022,
      isFavorite: true,
    ),
    Movie(
      id: 'm7',
      name: 'Shadow Master',
      description:
          'Shadow Master sau khi bị giết bởi một nhóm tội phạm, An Voaen được tái sinh với siêu năng lực siêu nhiên chưa thể lý giải được và thực hiện sứ mệnh của mình để sửa chữa những sai trái cho thành phố của mình. Anh ta sẽ đối đầu với ai và những pha hành động như thế nào ?',
      nation: 'USA',
      genre: 'Hành Động',
      posterUrl:
          'https://m.media-amazon.com/images/M/MV5BMzQwNDY0NGEtYzFmOC00ZmRkLWEzZmUtZTQ0MjQ0YjRhMDA1XkEyXkFqcGdeQXVyOTg4MDYyNw@@._V1_FMjpg_UX1000_.jpg',
      watchUrl: 'https://youtu.be/HD_H9VmwZio',
      year: 2022,
      isFavorite: true,
    ),
  ];

  int get itemCount {
    return _items.length;
  }

  List<Movie> get items {
    return [..._items];
  }

  List<Movie> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  List<Movie> findByString(String searchQuery) {
    return _items
        .where((prodItem) =>
            prodItem.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  List<Movie> findFavoriteByString(String searchQuery, bool isFavorite) {
    return _items
        .where((prodItem) =>
            prodItem.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList()
        .where((prodItem) => prodItem.isFavorite == isFavorite)
        .toList();
  }

  Movie findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addMovie(Movie movie) {
    _items.add(
      movie.copyWith(
        id: 'movie${DateTime.now().toIso8601String()}',
      ),
    );
    notifyListeners();
  }

  void updateMovie(Movie movie) {
    final index = _items.indexWhere((item) => item.id == movie.id);
    if (index >= 0) {
      _items[index] = movie;
      notifyListeners();
    }
  }

  void toggleFavoriteStatus(Movie movie) {
    final savedStatus = movie.isFavorite;
    movie.isFavorite = !savedStatus;
    notifyListeners();
  }

  void deleteMovie(String id) {
    final index = _items.indexWhere((item) => item.id == id);
    _items.removeAt(index);
    notifyListeners();
  }
}

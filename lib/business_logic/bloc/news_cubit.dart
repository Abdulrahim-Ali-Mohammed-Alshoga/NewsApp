import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/news.dart';
import '../../data/repository/news_hive_repository.dart';
import '../../data/repository/news_repository.dart';
import 'news_state.dart';


class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this.newsRepository, this.newsHiveRepository)
      : super(NewsInitial());
  NewsRepository newsRepository;
  NewsHiveRepository newsHiveRepository;
  late List<News> news = [];

  void getNews(String typeNews) async {
    //NewsInitial().availableNews(typeNews);
    if (news.isEmpty) {
      news = await newsHiveRepository.getAllNewsHive(typeNews);
      if (news.isEmpty) {
        emit(NewsLoading());
        _getData(true, typeNews);
      } else {
        emit(NewsSuccess());
        _getData(false, typeNews);
      }
    } else {
      emit(NewsSuccess());
    }
  }

  _getData(bool isElse, String typeNews) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        news = await newsRepository.getAllNews(typeNews);
        emit(NewsSuccess());
        await newsHiveRepository.putNewsHive(news, typeNews);
      } catch (e) {
        emit(NewsFailure());
      }
    } else if (isElse) {
      emit(NewsNotConnected());
    }
  }
}
//   late List<News> newAnime=[];
//
//   void getAnimeNews() async {
//     //NewsInitial().availableNews(typeNews);
//     if (newAnime.isEmpty) {
//       newAnime = await newsHiveRepository.getAllNewsHive("anime");
//       if (newAnime.isEmpty) {
//         emit(NewsAnimeLoading());
//         try {
//               newAnime = await newsRepository.getAllNews("anime");
//               emit(NewsAnimeSuccess());
//               print(55555);
//               await newsHiveRepository.putNewsHive(newAnime, "anime");
//             } catch (e) {
//               emit(NewsAnimeFailure());
//               print(e);
//             }
//       } else {
//         emit(NewsAnimeSuccess());
//       }
//     } else {
//       emit(NewsAnimeSuccess());
//     }
//     // var connectivityResult = await (Connectivity().checkConnectivity());
//     // if (connectivityResult != ConnectivityResult.none) {
//     //   try {
//     //     newAnime = await newsRepository.getAllNews("anime");
//     //     emit(NewsAnimeSuccess());
//     //     print(55555);
//     //     await newsHiveRepository.putNewsHive(newAnime, "anime");
//     //   } catch (e) {
//     //     emit(NewsAnimeFailure());
//     //     print(e);
//     //   }
//     // }
//   }
//
//   late List<News> newSport=[];
//
//   void getSportNews() async {
//     //NewsInitial().availableNews(typeNews);
//     if (newSport.isEmpty) {
//       newSport = await newsHiveRepository.getAllNewsHive("sport");
//       if (newSport.isEmpty) {
//         emit(NewsSportLoading());
//         try {
//           newSport = await newsRepository.getAllNews("sport");
//           emit(NewsSportSuccess());
//           await newsHiveRepository.putNewsHive(newSport, "sport");
//         } catch (e) {
//           emit(NewsSportFailure());
//         }
//       } else {
//         emit(NewsSportSuccess());
//       }
//     } else {
//       emit(NewsSportSuccess());
//     }
//     // var connectivityResult = await (Connectivity().checkConnectivity());
//     // if (connectivityResult != ConnectivityResult.none) {
//     //   try {
//     //     newSport = await newsRepository.getAllNews("sport");
//     //     emit(NewsSportSuccess());
//     //     await newsHiveRepository.putNewsHive(newSport, "sport");
//     //   } catch (e) {
//     //     emit(NewsSportFailure());
//     //   }
//     // }
//   }
// }

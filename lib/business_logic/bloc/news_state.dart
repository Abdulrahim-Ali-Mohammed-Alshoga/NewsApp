abstract class NewsState {}

class NewsInitial extends NewsState {
//  late NewsHiveRepository newsHiveRepository;
//  Future<List<News>> availableNews(String typeNews)  async{
//   print(555);
//   print(await newsHiveRepository.getAllNewsHive(typeNews));
//  return await newsHiveRepository.getAllNewsHive(typeNews);
// }
}

class NewsLoading extends NewsState {}

class NewsSuccess extends NewsState {}

class NewsFailure extends NewsState {}

class NewsNotConnected extends NewsState {}

// class NewsAnimeLoading extends NewsState{}
// class NewsAnimeSuccess extends NewsState{}
// class NewsAnimeFailure extends NewsState{}
//
// class NewsSportLoading extends NewsState{}
// class NewsSportSuccess extends NewsState{}
// class NewsSportFailure extends NewsState{}

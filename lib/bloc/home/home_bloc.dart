import 'package:rxdart/rxdart.dart';
import 'package:civic_bulb/bloc/common/bloc_base.dart';
import 'home_state.dart';
import 'package:civic_bulb/models/story.dart';

class HomeBloc implements BlocBase {
  final _homeStateSubject = BehaviorSubject.seeded(defaultState);
  Observable<HomeState> get stream => _homeStateSubject.stream.distinct();

  List<Story> stories() => [
        Story(
            title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            subtitle:
                " Proin quis est ante. Ut aliquam enim nisi, et aliquet risus tristique id. Duis fermentum id dolor a posuere. Nulla quis iaculis purus.",
            author: "Dui Sapien",
            location: "Norfolk",
            body: "Etiam orci velit, fermentum a nisi eget, maximus imperdiet massa. Suspendisse est quam, volutpat id justo at, maximus euismod sem. Ut at turpis eu tortor viverra volutpat sit amet id nisl. Nunc vitae sodales nunc, eget semper est. Fusce posuere tellus vel suscipit cursus. Mauris non tellus eu arcu facilisis tincidunt ut id ex. Interdum et malesuada fames ac ante ipsum primis in faucibus.",
            image:"assets/images/Norfolk.jpg"),
        Story(
            title: "Lorem ipsum Nam ultrices, tortor tincidunt molestie posuere,",
            subtitle:
                "Donec interdum vulputate fermentum. Donec convallis enim tellus, ut aliquam purus convallis non. Etiam vitae urna vel mauris ornare fringilla eu egestas nisi.",
            author: "Mauris sed",
            location: "Norfolk",
            body: "Donec pharetra arcu ut tellus pellentesque, et faucibus metus posuere. Vivamus interdum laoreet enim, eu efficitur erat faucibus id. Aliquam ornare suscipit malesuada. Aliquam sed facilisis felis, in scelerisque ante. In vestibulum, lectus ut sollicitudin efficitur, nisl quam porttitor ex, nec vulputate neque nunc sit amet massa. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ante est, vestibulum non nisi ut, laoreet accumsan quam. Pellentesque et fermentum nisl.",
            image:"assets/images/Dallas.jpg"),
        Story(
            title: "Lorem ipsum lorem massa facilisis risus, varius convallis diam ex tristique odio.",
            subtitle:
                "Nam ac neque et ligula ultricies volutpat et vitae quam. Phasellus pellentesque a diam et venenatis.",
            author: "Aenean Interdum",
            location: "Norfolk",
            body: "Duis tempus sem nec ante finibus porta. Aenean interdum massa non leo aliquet, eu tristique ligula faucibus. Aliquam sit amet pellentesque velit, sit amet pharetra nisl. Maecenas efficitur nisi sed interdum ultrices. Aenean in dolor ac orci efficitur euismod eu quis felis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce fermentum est ullamcorper venenatis sodales. Donec molestie lacus a odio pretium venenatis.",
            image:"assets/images/Phoenix.jpg")
      ];

  HomeBloc() {
    final current = _homeStateSubject.value;
    _homeStateSubject.add(current.copy(
      story: stories(),
      isLoading: false,
    ));
  }

  @override
  void dispose() {
     _homeStateSubject?.close();
  }

  static final defaultState = HomeState(
    story: List(),
    isLoading: true,
  );
}

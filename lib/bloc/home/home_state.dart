import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:civic_bulb/models/story.dart';

@immutable
class HomeState extends Equatable {
  final List<Story> story;
  final bool isLoading;

  HomeState({
    this.story,
    this.isLoading,
  }) : super([story, isLoading]);

  HomeState copy({
    List<Story> story,
    bool isLoading,
  }) =>
      HomeState(
        story: story ?? this.story,
        isLoading: isLoading ?? this.isLoading,
      );
}

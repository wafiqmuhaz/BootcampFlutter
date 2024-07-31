part of 'news_org_bloc.dart';

@immutable
abstract class NewsOrgState {}

class NewsOrgInitial extends NewsOrgState {}

class NewsLoadingState extends NewsOrgState {}

class NewsLoadedState extends NewsOrgState {
  final TopHeadlineModel news;
  NewsLoadedState(this.news);
}

class NewsErrorState extends NewsOrgState {
  final String error;
  NewsErrorState(this.error);
}
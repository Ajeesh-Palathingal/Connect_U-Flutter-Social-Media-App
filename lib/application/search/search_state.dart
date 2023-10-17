part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required List<dynamic> searchResultList,
    required List<dynamic> idleList,
    required bool isLoading,
    required bool userNotFound,
    required bool isError,
  })=_SearchState;


  factory SearchState.initial() => const SearchState(
        searchResultList: [],
        idleList: [],
        isLoading: false,
        userNotFound:false,
        isError: false,
      );
}


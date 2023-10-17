import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:connect_u/presentation/widgets/user_not_found.dart';
import 'package:connect_u/service/database_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState.initial()) {
    on<Initialize>((event, emit) async {
      try {
        emit(state.copyWith(isLoading: true));
        if (state.idleList.isNotEmpty) {
          log("bloc  idle list not empty");
          emit(state.copyWith(isLoading: false, idleList: state.idleList));
          return;
        } else {
          log("bloc  idle list empty");

          emit(state.copyWith(isLoading: false, userNotFound: true));
        }

        //fetch all the users from firebase
        List usersList = [];
        usersList = await DatabaseServices("").getUsersList();
        // log("user idle list : $usersList");
        if (usersList.isEmpty) {
          log("bloc  user list empty");

          // log("isLoading is false");
          emit(state.copyWith(isLoading: false, userNotFound: true));
        } else {
          log("bloc  userlist list not empty");

          emit(
            state.copyWith(idleList: usersList, isLoading: false, userNotFound: false),
          );
        }
      } catch (e) {
        print(e);
      }
    });
    on<SearchUser>((event, emit) async {
      try {
        emit(state.copyWith(isLoading: true));
        List searchResult = [];
        searchResult = await DatabaseServices("").getUserWithName(event.searchKey);

        if (searchResult.isNotEmpty) {
          emit(state.copyWith(isLoading: false, searchResultList: searchResult, userNotFound: false));
        } else {
          emit(state.copyWith(isLoading: false, userNotFound: true));
        }
      } catch (e) {
        print(e);
      }
    });
  }
}

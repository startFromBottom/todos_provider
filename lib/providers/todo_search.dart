// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';

///
/// Q) 단순한 String인데 이렇게 클래스로 만드는게 과한 것이 아닌가?
/// A)
/// 1. 모든 State를 다룰 때에 일관성을 지키기. (협업 시 예측이 가능한 코드를 만들기)
/// 2. type 충돌을 피할 수 있다.
///   - Provider는 type을 기준으로 wdiget tree에서 오브젝트를 찾음. 타입이 같으면,
///    자기보다 먼 Provider에는 접근할 수가 없다. (중요)
///
class TodoSearchState extends Equatable {
  final String searchTerm;
  TodoSearchState({
    required this.searchTerm,
  });

  factory TodoSearchState.initial() {
    return TodoSearchState(searchTerm: "");
  }

  TodoSearchState copyWith({
    String? searchTerm,
  }) {
    return TodoSearchState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }

  @override
  List<Object> get props => [searchTerm];

  @override
  bool get stringify => true;
}

class TodoSearch extends StateNotifier<TodoSearchState> {
  TodoSearch() : super(TodoSearchState.initial());

  void setSearchTerm(String newSearchTerm) {
    state = state.copyWith(searchTerm: newSearchTerm);
  }
}

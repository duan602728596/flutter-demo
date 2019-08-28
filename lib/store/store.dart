import 'package:redux/redux.dart';
import '../home/actions.dart';

/* 初始值 */
Map<String, dynamic> initialState = {
  'home': homeInitialState
};

/* reducers map */
Map<String, dynamic> reducers = {
  'home': homeReducer
};

/* 合并reducers */
Map<String, dynamic> counterReducer(Map<String, dynamic> state, dynamic action) {
  // 拆分命名空间
  List<String> type = action['type'].split('/');

  if (reducers.containsKey(type[0])) {
    return reducers[type[0]](state, action);
  }

  return state;
}

Store store = new Store<Map<String, dynamic>>(
  counterReducer,
  initialState: initialState
);
import 'package:redux/redux.dart';

Map<String, dynamic> initialState = {
  'homeList': []
};

Map<String, dynamic> counterReducer(Map<String, dynamic> state, dynamic action) {

  return state;
}

Store store = new Store<Map<String, dynamic>>(
  counterReducer,
  initialState: initialState
);
/* 初始值 */
Map<String, dynamic> myInitialState = {
  'userInfo': null
};

/* reducer */
Map<String, dynamic> myReducer(Map<String, dynamic> state, dynamic action) {
  switch(action['type']) {
    case 'my/userInfo':
      state['my']['userInfo'] = action['payload'];
      break;
  }

  return state;
}

/* action */
Map<String, dynamic> loginUserInfoAction(dynamic payload) {
  return {
    'type': 'my/userInfo',
    'payload': payload
  };
}
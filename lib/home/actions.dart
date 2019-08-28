/* 初始值 */
Map<String, dynamic> homeInitialState = {
  'homeData': []
};

/* reducer */
Map<String, dynamic> homeReducer(Map<String, dynamic> state, dynamic action) {
  switch(action['type']) {
    case 'home/homeData':
      state['home']['homeData'] = action['payload'];
      break;
  }

  return state;
}

/* action */
Map<String, dynamic> homeDataAction(dynamic payload) {
  return {
    'type': 'home/homeData',
    'payload': payload
  };
}
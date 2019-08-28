Map<String, dynamic> homeReducer(Map<String, dynamic> state, dynamic action) {
  switch(action['type']) {
    case 'home/homeData':
      state['homeData'] = action['payload'];
      break;
  }

  return state;
}

Map<String, dynamic> homeDataAction(dynamic payload) {
  return {
    'type': 'home/homeData',
    'payload': payload
  };
}
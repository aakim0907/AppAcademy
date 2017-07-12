import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/todos_reducer';
import thunkMiddleware from '../middleware/thunk';

const configureStore = (preloadedState = {}) => (
  createStore(rootReducer, preloadedState, applyMiddleware(thunkMiddleware))
);

export default configureStore;

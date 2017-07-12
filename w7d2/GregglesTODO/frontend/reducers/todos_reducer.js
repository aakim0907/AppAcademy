import { RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO } from '../actions/todo_actions.js';
import merge from 'lodash/merge';

// const initialState = {
//   1: {
//     id: 1,
//     title: "create Greg TODO app",
//     body: "curl whiskers",
//     done: false
//   },
//   2: {
//     id: 2,
//     title: "bother Greg",
//     body: "by curling his whiskers",
//     done: false
//   },
// };

const todosReducer = (state = {}, action) => {
  Object.freeze(state);
  const dupState = merge({}, state);

  switch(action.type) {
    case RECEIVE_TODOS:
      action.todos.forEach(todo => {
        dupState[todo.id] = todo;
      });
      return dupState;

    case RECEIVE_TODO:
      dupState[action.todo.id] = action.todo;
      return dupState;

    case REMOVE_TODO:
      const curID = action.todo.id;
      delete dupState[curID];
      return dupState;

    default:
      return state;
  }
};

export default todosReducer;

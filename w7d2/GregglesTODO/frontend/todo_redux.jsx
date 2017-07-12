import React from 'react';
import ReactDOM from 'react-dom';
import { receiveTodo, fetchTodos, receiveTodos } from './actions/todo_actions';
import configureStore from './store/store.js';
import Root from './components/root.jsx';
import App from './components/app.jsx';

document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
		ReactDOM.render(<Root store={ store }/>, document.getElementById('root'));
  window.store = store;
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  window.fetchTodos = fetchTodos;
});

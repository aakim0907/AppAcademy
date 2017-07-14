import React from 'react';
import ReactDOM from 'react-dom';
import { HashRouter, Route } from 'react-router-dom';
import configureStore from "./store/store";

import Root from './components/root';

import { fetchPokemon, fetchAllPokemon } from './util/api_util';
import { requestPokemon, receiveAllPokemon, receivePokemon } from './actions/pokemon_actions';
import selectAllPokemon from './reducers/selectors';


document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  const rootEl = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, rootEl);

  window.fetchAllPokemon = fetchAllPokemon;
  window.fetchPokemon = fetchPokemon;
  window.receivePokemon = receivePokemon;
  window.receiveAllPokemon = receiveAllPokemon;
  window.requestPokemon = requestPokemon;
  window.selectAllPokemon = selectAllPokemon;
  window.getState = store.getState;
  window.dispatch = store.dispatch;
});

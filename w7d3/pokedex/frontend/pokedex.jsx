import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from "./store/store";

import { fetchAllPokemon } from './util/api_util';
import { requestAllPokemon, receiveAllPokemon } from './actions/pokemon_actions';
import selectAllPokemon from './reducers/selectors';

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  const rootEl = document.getElementById('root');
  ReactDOM.render(<h1>Pokedex</h1>, rootEl);
  window.fetchAllPokemon = fetchAllPokemon;
  window.receiveAllPokemon = receiveAllPokemon;
  window.requestAllPokemon = requestAllPokemon;
  window.selectAllPokemon = selectAllPokemon;
  window.getState = store.getState;
  window.dispatch = store.dispatch;
});

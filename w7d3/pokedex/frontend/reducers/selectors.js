import values from 'lodash/values';

const selectAllPokemon = state => (values(state.pokemon.entities));

export default selectAllPokemon;

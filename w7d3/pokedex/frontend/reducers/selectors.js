import values from 'lodash/values';

const selectAllPokemon = state => (values(state.pokemon));

export default selectAllPokemon;

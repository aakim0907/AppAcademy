import { connect } from 'react-redux';
import PokemonDetail from './pokemon_detail';
import { requestPokemon } from '../../actions/pokemon_actions';

const mapStateToProps = ({ pokemon, items }) => {
  console.log(items);
  return {
    pokemon: pokemon.entities[pokemon.currentPoke],
    items
  };
};

const mapDispatchToProps = dispatch => ({
  requestPokemon: id => dispatch(requestPokemon(id))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);

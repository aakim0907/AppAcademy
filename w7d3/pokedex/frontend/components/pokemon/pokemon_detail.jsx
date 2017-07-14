import React from 'react';

class PokemonDetail extends React.Component {
  componentDidMount() {
    this.props.requestPokemon(this.props.match.params.pokemonId);
  }

  componentWillReceiveProps(newProps) {
  if (this.props.match.params.pokemonId !== newProps.match.params.pokemonId) {
    this.props.requestPokemon(newProps.match.params.pokemonId);
    }
  }

  render() {
    const { pokemon, items } = this.props;

    if (!pokemon) {
      return null;
    }

    return (
      <section>
        <figure>
          <img src={pokemon.image_url} alt={pokemon.name} />
        </figure>

        <ul>
          <li>
            <h2>{pokemon.name}</h2>
          </li>
          <li>Type: {pokemon.poke_type}</li>
          <li>Attack: {pokemon.attack}</li>
          <li>Defense: {pokemon.defense}</li>
          <li>Moves: {pokemon.moves.join(', ')}</li>
        </ul>

        <section className="toys">
          <h3>Items</h3>
          <ul className="toy-list">
            {items.map(item => item.name)}
          </ul>
        </section>

      </section>
    );
  }
}

export default PokemonDetail;

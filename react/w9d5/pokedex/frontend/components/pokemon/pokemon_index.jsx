import React from "react";

class PokemonIndex extends React.Component {
  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    const { pokemon } = this.props;
    return (
      <ul>
        {pokemon.map(poke => {
          return ( <li key={poke.id}>
              {poke.name}
              <img src={poke.image_url} alt={poke.name} />
            </li>
          );
        })}
      </ul>
    );
  }
}

export default PokemonIndex;

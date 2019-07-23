import { connect } from "react-redux";
// import { selectAllPokemon } from "../../reducers/selector";
import { requestSinglePokemon } from "../../actions/pokemon_actions";
import PokemonDetail from "./pokemon_detail";
import { selectPokemonItem } from "../../reducers/selector";

const mapStateToProps = (state, ownProps) => {
  const pokemon = state.entities.pokemon[ownProps.match.params.pokemonId];
  // debugger
  return { 
    pokemon,
    items: state.entities.items
  };
};

const mapDispatchToProps = dispatch => ({
  requestSinglePokemon: id => dispatch(requestSinglePokemon(id))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);

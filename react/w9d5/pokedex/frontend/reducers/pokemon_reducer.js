import {
  RECEIVE_ALL_POKEMON,
  RECEIVE_SINGLE_POKEMON
} from "../actions/pokemon_actions";
import { merge } from "lodash";

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  let pokemon;
  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      return merge({}, state, action.pokemon); 
    case RECEIVE_SINGLE_POKEMON:
      pokemon = action.payload.pokemon
      return merge({}, state, { [pokemon.id]: pokemon });
    case CREATE_NEW_POKEMON:
      pokemon = action.payload.pokemon
      return merge({}, state, pokemon)
    default:
      return state;
  }
};

export default pokemonReducer;
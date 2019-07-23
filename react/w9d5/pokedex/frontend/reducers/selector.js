export const selectAllPokemon = state => Object.values(state.entities.pokemon);

export const selectPokemonItem = (state, itemId) => {
  return state.entities.items[itemId]
};

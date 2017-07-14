export const fetchAllPokemon = () => (
  $.ajax({
    method: "GET",
    url: "/api/pokemon"
  })
);

export const fetchPokemon = id => (
  $.ajax({
    method: "GET",
    url: `/api/pokemon/${id}`
  })
);

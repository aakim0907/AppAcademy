const allTodos = (state) => {
  const keys = Object.keys(state);
  return keys.map(key => state[key]);
};

export default allTodos;

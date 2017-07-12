export const todosRequest = function() {
  return $.ajax({
    method: "GET",
    url: "/api/todos"
  });
};

export const createTodo = function(todo) {
  return $.ajax({
    method: "POST",
    url: "/api/todos",
    data: todo
  });
};

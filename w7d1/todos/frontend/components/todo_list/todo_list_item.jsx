import React from 'react';

const TodoListItem = ({todo, receiveTodo, removeTodo}) => (
    <li>{todo.title}
      <button onClick={()=>removeTodo(todo)}>Delete</button>
      <button onClick={()=>receiveTodo(todo)}>{todo.done === "false" ? "Undo" : "Done" }</button>
    </li>

);


export default TodoListItem;

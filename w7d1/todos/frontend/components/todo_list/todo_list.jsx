import React from 'react';
import ReactDOM from 'react';
import allTodos from '../../reducers/selectors';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';


// const TodoList = ({todos, receiveTodo}) => (
//   <div>
//     <ul>
//       {todos.map( (todo,idx) => <TodoListItem todo={todo} key={idx}/> )}
//     </ul>
//     <TodoForm receiveTodo={receiveTodo}/>
//   </div>
//
// );

const TodoList = ({todos, receiveTodo, removeTodo}) => {
  return (
    <div>
        <ul>
          {todos.map( (todo,idx) => <TodoListItem todo={todo} key={idx} removeTodo={removeTodo}/> )}

        </ul>
        <TodoForm receiveTodo={receiveTodo}/>
      </div>
  );
};



export default TodoList;

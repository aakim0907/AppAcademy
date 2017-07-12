import React from 'react';
import ReactDOM from 'react';
import allTodos from '../../reducers/selectors';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {
  componentDidMount() {
    this.props.fetchTodos();
  }

  constructor(props) {
    super(props);
  }

  render(){
    const {todos, createTodo, removeTodo} = this.props;
    return (
      <div>
          <ul>
            {todos.map( (todo,idx) => <TodoListItem todo={todo} key={idx} removeTodo={removeTodo} receiveTodo={receiveTodo}/>)}
          </ul>
          <TodoForm createTodo={createTodo}/>
        </div>
    );
  }
}



export default TodoList;

import React from 'react';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = this.props.todo;
    this.toggleTodo = this.toggleTodo.bind(this);
  }

  toggleTodo(event) {
    event.preventDefault();
    const { todo, receiveTodo } = this.props;
    todo.done = (todo.done === false ? true : false);
    receiveTodo(todo);
    this.setState({done: todo.done});
  }

  render() {
    const { todo, removeTodo } = this.props;
    return (
      <li>{ todo.title }
        <button onClick={()=>removeTodo(todo)}>Delete</button>
        <button onClick={this.toggleTodo}>{todo.done === false ? "Done" : "Undo" }</button>
      </li>
    );
  }
}


export default TodoListItem;

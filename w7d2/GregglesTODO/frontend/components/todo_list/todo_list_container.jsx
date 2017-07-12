import { connect } from 'react-redux';
import Todolist from './todo_list';
import allTodos from '../../reducers/selectors';
import { createTodo, removeTodo, fetchTodos } from '../../actions/todo_actions';

const mapStateToProps  = state => ({
  todos: allTodos(state)
});

const mapDispatchToProps = dispatch => ({
  createTodo: todo => dispatch(createTodo(todo)),
  removeTodo: todo => dispatch(removeTodo(todo)),
  fetchTodos: todos => dispatch(fetchTodos(todos))
  });

const TodoListContainer = connect(
  mapStateToProps, mapDispatchToProps)(Todolist);
export default TodoListContainer;

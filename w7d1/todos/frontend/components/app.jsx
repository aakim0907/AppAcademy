import React from 'react';
import ReactDOM from 'react';
import TodoListContainer from './todo_list/todo_list_container';

class App extends React.Component {

  render(){
    return (
      <div>
        <h1>Greggles the magnificent Todo</h1>
        <TodoListContainer/>
      </div>
    );
  }

}

export default App;

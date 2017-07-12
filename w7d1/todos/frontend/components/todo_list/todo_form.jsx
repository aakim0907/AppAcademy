import React from 'react';
import ReactDOM from 'react';
import uniqueId from '../../../util';

class TodoForm extends React.Component {
  constructor(props){
    super(props);
    this.state = {id: "", title: "", body: "", done: false};
    this.handleTitleChange = this.handleTitleChange.bind(this);
    this.handleBodyChange = this.handleBodyChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleTitleChange(event) {
    this.setState({id: uniqueId(), title: event.target.value});
  }

  handleBodyChange(event) {
    this.setState({body: event.target.value});
  }

  handleSubmit(event) {
    event.preventDefault();
    this.props.receiveTodo(this.state);
    this.setState({id: "", title: "", body:""});
  }

  render() {
    const self = this;
    return (
      <div>
        <form onSubmit={ self.handleSubmit }>

          <label>Title
            <input type="text" value={self.state.title} onChange={self.handleTitleChange}></input>
          </label>
          <br/>

          <label>Body
            <input type="text" value={self.state.body} onChange={self.handleBodyChange}></input>
          </label>
          <br/>

          <button>Submit</button>
        </form>
      </div>
    );
  }
}

export default TodoForm;

import React from 'react';

class Autocomplete extends React.Component {
  constructor(props) {
    super(props);
    this.state = { inputVal: "", names: props.names };
  }

  render() {
    const { names } = this.state;
    console.log(names);
    return (
      <div>
        <input onChange={this.state.inputVal} type="text" value={this.state.inputVal} placeholder="search..."/>
          <ul>
            {
              names.map((name, idx) => <li key={idx}>{name}</li>)
            }
          </ul>
      </div>
    );
  }
}

export default Autocomplete;

<input onClice

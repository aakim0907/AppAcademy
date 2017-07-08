import React from 'react';
import ReactDOM from 'react-dom';

import Clock from './frontend/clock';
import Weather from './frontend/weather';
import Autocomplete from './frontend/autocomplete';

const names = ["Aaron", "Young", "Leo", "Kevin", "Greg", "Elliot", "Munyo", "Wen"];

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <div>
      <Clock />
      <Weather />
      <Autocomplete names={names} />
    </div>,
    document.getElementById('root'));
});

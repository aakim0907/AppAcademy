import React from 'react';
//api key 624f5c9f94031841d6837d395cd23a1f
// 4e7bce6e31210f7be49391414ed60a2b
//api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}
class Weather extends React.Component {
  componentDidMount() {
    let self = this;
    navigator.geolocation.getCurrentPosition(function(position) {
      const lat = position.coords.latitude;
      const lon = position.coords.longitude;
      self.request(lat, lon);
    });
  }

  constructor() {
    super();
    this.state = {temp: "", city: ""};
  }

  request(lat, lon) {
    let self = this;
    var request = new XMLHttpRequest();
    request.open('GET', `http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&units=imperial&APPID=624f5c9f94031841d6837d395cd23a1f`, true);

    request.onload = function() {
      if (request.status >= 200 && request.status < 400) {
        var resp = JSON.parse(request.responseText);
        self.setState({temp: resp.main.temp, city: resp.name});
      } else {
        // We reached our target server, but it returned an error
      }
    };

    request.onerror = function() {
      // There was a connection error of some sort
    };

    request.send();
  }

  render(){
    const { temp, city } = this.state;
    return (
      <div className="awesomeClock">
        <h2>Weather</h2>
        <div className="clock" id="weather">
          <div>
            <span className="city">{city}</span>
          </div>

          <div>
            <span className="temp">{temp}°F</span>
          </div>
        </div>

      </div>
    );
  }
}

export default Weather;

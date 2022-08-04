import { getJSON } from './utilities.js';
// Quake Model
export default class Quake {
  constructor() {
    this.baseUrl =
      'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson';
    // store the last batch of retrieved quakes in the model.  I don't always do this...in this case the api doesn't have an endpoint to request one quake.
    this._quakes = [];
    this._quakes2 = [];
  }
  async getEarthQuakesByRadius(position, radius = 100) {
    this._quakes = await getJSON(
      this.baseUrl +
        `&starttime=2019-01-01&endtime=2019-03-02&latitude=${
          position.lat
        }&longitude=${position.lon}&maxradiuskm=${radius}`
    );

    this._quakes2 = 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2020-01-01&endtime=2020-02-02&latitude=37.4013952&longitude=-122.9209344&maxradiuskm=100';

    return this._quakes2;
  }
  getQuakeById(id) {
    return this._quakes.features.filter(item => item.id === id)[0];
  }
}

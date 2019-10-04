import React from 'react';
import logo from './logo.svg';
import './App.css';
import Home from './Containers/Home';
import Jobs from './Containers/Jobs';
import {BrowserRouter, Route, withRouter, Switch} from 'react-router-dom';

function App() {
  return (
    <BrowserRouter>
    <Switch>
      <Route exact path = '/' component = {Home} />
      <Route exact path = '/Jobs' component = {Jobs}/>
    </Switch>
    </BrowserRouter>
  );
}

export default App;

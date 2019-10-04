import React from 'react';
import logo from './logo.svg';
import './App.css';
import {BrowserRouter} from 'react-router-dom';
import AppMain from './Containers/AppMain'

function App() {
  return (
    <BrowserRouter>
      <AppMain/>
    </BrowserRouter>
  );
}

export default App;

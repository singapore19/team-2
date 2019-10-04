import {BrowserRouter, Route} from 'react-router-dom'
import React, {Component} from 'react'
import Home from './Home'
import Jobs from './Jobs'

class AppRoutes extends Component {
	render(){
		return(
			<main>
				<BrowserRouter>
					<Route exact path = '/' component = {Home} />
					<Route exact path = '/Jobs' component = {Jobs}/>
				</BrowserRouter>
			</main>
		)
	}
}

export default AppRoutes
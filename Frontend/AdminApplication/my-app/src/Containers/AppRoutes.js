import {Switch, Route} from 'react-router-dom'
import React, {Component} from 'react'
import Home from './Home'

class AppRoutes extends Component {
	render(){
		return(
			<main>
				<Switch>
					<Route exact path = '/' component = {Home} />
				</Switch>
			</main>
		)
	}
}

export default AppRoutes
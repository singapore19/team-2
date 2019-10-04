import React, {Component} from 'react'
import Signin from './Login'

class Home extends Component {
	render(){
		return(
			<Signin {...this.props}/>
		)
	}
}

export default Home
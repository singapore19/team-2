import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import Paper from '@material-ui/core/Paper';

const useStyles = makeStyles(theme => ({
  root: {
    width: '100%',
    marginTop: theme.spacing(3),
    overflowX: 'auto',
  },
  table: {
    minWidth: 650,
  },
}));

function createData(User, Driver, JobTime, JobStatus, JobType, JobVolume, JobNumber) {
  return {User, Driver, JobTime, JobStatus, JobType, JobVolume, JobNumber};
}

const rows = [
  createData('John', 'Jack', '', 'Submitted', 'delivery', 15, 0),
  createData('John', 'Jack', '09:00', 'Submitted', 'pickup', 0, 10),
  createData('John', 'Jack', '', 'Submitted', 'delivery', 25, 0),
  createData('John', 'Jack', '', 'Submitted', 'delivery', 40, 0),
  createData('John', 'Jack', '16:00', 'Submitted', 'pcikup', 10, 4.0),
];


export default function Jobs() {
  const classes = useStyles();

  return (
    <Paper className={classes.root}>
      <Table className={classes.table}>
        <TableHead>
          <TableRow>
            <TableCell align="right">User</TableCell>
            <TableCell align="right">Driver</TableCell>
            <TableCell align="right">Job Time</TableCell>
            <TableCell align="right">Job Status</TableCell>
            <TableCell align="right">Job Type</TableCell>
            <TableCell align="right">Job Volume</TableCell>
            <TableCell align="right">Job Number</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {rows.map(row => (
            <TableRow key={row.name}>
              <TableCell align="right">{row.User}</TableCell>
              <TableCell align="right">{row.Driver}</TableCell>
              <TableCell align="right">{row.JobTime}</TableCell>
              <TableCell align="right">{row.JobStatus}</TableCell>
              <TableCell align="right">{row.JobType}</TableCell>
              <TableCell align="right">{row.JobVolume}</TableCell>
              <TableCell align="right">{row.JobNumber}</TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </Paper>
  );
}

-----------------------------------------------------------------------
import React, {useState} from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import Paper from '@material-ui/core/Paper';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import Typography from '@material-ui/core/Typography';
import ListItemText from '@material-ui/core/ListItemText';
import axios from 'axios'

function createData(username, time, status, type, volume, number) {
  return {username, time, status, type, volume, number};
}

const rows = [
  createData('John', '', 'Submitted', 'delivery', 15, 0),
  createData('John', '09:00', 'Submitted', 'pickup', 0, 10),
  createData('John', '', 'Submitted', 'delivery', 25, 0),
  createData('John', '', 'Submitted', 'delivery', 40, 0),
  createData('John', '16:00', 'Submitted', 'pcikup', 10, 4),
];

export async function componentDidMount(deviceToken){
    try {    
      const subIndustryResponse = await axios({
        method: 'get',
        url: "/v1/sub_industries",
        headers: {}
      });
      this.setState({
        loading: false,
        subIndustryData: rows,
      });
    } catch (error) {
      console.log(error);
    }
  }

export default class Jobs extends React.Component{
  constructor(props) {
    super(props);
    this.state = {
      subIndustryData: rows
    }
  }
  render() {
  return ( 
    <div>
    <h1> All jobs</h1>
      <List>
      {
        this.state.subIndustryData.map(({username, time, status, type, volume, number}) => {
          return (<ListItem>
            <ListItemText primary={
              <React.Fragment>
              <Typography
                component="span"
                variant="body2"
                color="textPrimary"
              >
                {username}
              </Typography>
              &nbsp;{time}
            </React.Fragment>
            }
            secondary={
              <React.Fragment>
              <Typography
                component="span"
                variant="body2"
                color="textPrimary"
              >
                {status}
              </Typography>
                &nbsp;{type}
            </React.Fragment>              
            }>
            </ListItemText>
          </ListItem>)
        })
        }
      </List>
    </div>
  );
  }
}
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
    <div>
    <h1> All Jobs </h1>
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
    </div>
  );
}

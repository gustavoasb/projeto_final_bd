import React, { useState } from "react";
import { makeStyles } from "@material-ui/core/styles";
import TextField from "@material-ui/core/TextField";
import Button from '@material-ui/core/Button';
import { useHistory } from 'react-router-dom';
import LocalHospital from '@material-ui/icons/LocalHospital';
import Face from '@material-ui/icons/Face';

const useStyles = makeStyles((theme) => ({
  root: {
    "& > *": {
      margin: theme.spacing(1),
      width: "25ch",
      display: "flex",
      flexDirection: "column"
    },
  },
}));

export default function Login() {
  const classes = useStyles();
  let history = useHistory()

  return (
    <div style={{ height: "100vh", width: "100vw" }}>
      <div
        style={{
          height: "100%",
          flexDirection: "column",
          display: "flex",
          alignItems: "center",
          justifyContent: "center",
        }}
      >
        <div style={{ fontSize: "1.2rem", marginBottom: "0.6rem" }}>
          Faça login
        </div>
          <Button color="primary" onClick={() => history.push('/login_doctor')} startIcon={<LocalHospital />}>Logar como médico</Button>
          <Button color="primary" onClick={() => history.push('/login_user')} startIcon={<Face />}>Logar como usuário</Button>
      </div>
    </div>
  );
}

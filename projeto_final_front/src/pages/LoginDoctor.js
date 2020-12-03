import React, { useState } from "react";
import { makeStyles } from "@material-ui/core/styles";
import TextField from "@material-ui/core/TextField";
import Button from '@material-ui/core/Button';
import { useHistory } from 'react-router-dom';
import ExitToApp from '@material-ui/icons/ExitToApp';
import api from '../services/api'

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
  const [crm, setCrm] = useState("");
  let history = useHistory()

  function handleSubmit(){
    console.log("oi")
    api.get(`doctors/${crm}`)
      .then(res => {
        console.log(res)
        localStorage.setItem("doctor-crm", crm)
        localStorage.setItem("doctor-name", res.data.name)
        history.push("/doctor")
      })
      .catch(res => {
        console.log(res)
        alert("crm não encontrado")
      })
  }

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
        <form className={classes.root} noValidate autoComplete="off">
          <TextField
            id="outlined-basic"
            label="CRM"
            variant="outlined"
            required
            value={crm}
            onChange={e => setCrm(e.target.value)}
          />
          <Button color="primary" onClick={() => handleSubmit()} startIcon={<ExitToApp />}>Logar</Button>
          <Button color="primary" onClick={() => history.push('/signup')}>Criar conta</Button>
        </form>
      </div>
    </div>
  );
}

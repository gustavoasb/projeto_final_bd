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
  const [cpf, setCpf] = useState("");
  let history = useHistory()

  function handleSubmit(){
    console.log("oi")
    api.get(`users/${cpf}`)
      .then(res => {
        console.log(res)
        localStorage.setItem("user-cpf", cpf)
        localStorage.setItem("user-name", res.data.name)
        history.push("/user")
      })
      .catch(res => {
        console.log(res)
        alert("CPF não encontrado")
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
            label="CPF"
            variant="outlined"
            required
            value={cpf}
            onChange={e => setCpf(e.target.value)}
          />
          <Button color="primary" onClick={() => handleSubmit()} startIcon={<ExitToApp />}>Logar</Button>
          <Button color="primary" onClick={() => history.push('/signup')}>Criar conta</Button>
        </form>
      </div>
    </div>
  );
}

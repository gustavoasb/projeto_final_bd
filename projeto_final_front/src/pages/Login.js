import React, { useState } from "react";
import { makeStyles } from "@material-ui/core/styles";
import TextField from "@material-ui/core/TextField";
import Button from '@material-ui/core/Button';
import { useHistory } from 'react-router-dom';
import ExitToApp from '@material-ui/icons/ExitToApp';

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
    localStorage.setItem("user-cpf", cpf)
    history.push("/user")
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
        <form className={classes.root} noValidate autoComplete="off" onSubmit={handleSubmit}>
          <TextField
            id="outlined-basic"
            label="CPF"
            variant="outlined"
            required
            value={cpf}
            onChange={e => setCpf(e.target.value)}
          />
          <Button color="primary" type="submit" startIcon={<ExitToApp />}>Logar</Button>
          <Button color="primary" onClick={() => history.push('/signup')}>Criar conta</Button>
          {/* <TextField id="outlined-basic" label="cpf" variant="outlined" /> */}
        </form>
      </div>
    </div>
  );
}

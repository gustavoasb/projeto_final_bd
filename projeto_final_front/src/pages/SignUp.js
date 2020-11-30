import React, { useState } from "react";
import { makeStyles } from "@material-ui/core/styles";
import TextField from "@material-ui/core/TextField";
import Button from "@material-ui/core/Button";
import { useHistory } from "react-router-dom";

const useStyles = makeStyles((theme) => ({
  root: {
    "& > *": {
      margin: theme.spacing(1),
      width: "25ch",
      display: "flex",
      flexDirection: "  column",
    },
    dateField: {
      marginLeft: theme.spacing(1),
      marginRight: theme.spacing(1),
      width: 200,
    },
  },
}));

export default function SignUp() {
  const classes = useStyles();
  const [user, setUser] = useState({
    cpf: "",
    home_phone: "",
    cell_phone: "",
    name: "",
    email: "",
    birth_date: "",
  });
  let history = useHistory();

  function handleSubmit() {
    localStorage.setItem("user-cpf", user.cpf);
    history.push("/user");
  }
  console.log(user.birth_date)
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
          Crie uma conta
        </div>
        <form
          className={classes.root}
          noValidate
          autoComplete="off"
          onSubmit={handleSubmit}
        >
          <TextField
            id="outlined-basic"
            label="Nome"
            variant="outlined"
            required
            value={user.name}
            onChange={(e) => setUser({ ...user, name: e.target.value })}
          />
          <TextField
            id="outlined-basic"
            label="Email"
            variant="outlined"
            required
            value={user.email}
            onChange={(e) => setUser({ ...user, email: e.target.value })}
          />
          <TextField
            id="outlined-basic"
            label="CPF"
            variant="outlined"
            required
            value={user.cpf}
            onChange={(e) => setUser({ ...user, cpf: e.target.value })}
          />
          <TextField
            id="outlined-basic"
            label="Telefone Residencial"
            variant="outlined"
            required
            value={user.home_phone}
            onChange={(e) => setUser({ ...user, home_phone: e.target.value })}
          />
          <TextField
            id="outlined-basic"
            label="Celular"
            variant="outlined"
            required
            value={user.cell_phone}
            onChange={(e) => setUser({ ...user, cell_phone: e.target.value })}
          />
          <TextField
            id="date"
            label="Data de Nascimento"
            type="date"
            defaultValue={user.birth_date}
            onChange={(e) => setUser({ ...user, birth_date: e.target.value })}
            className={classes.dateField}
            InputLabelProps={{
              shrink: true,
            }}
          />
          <Button color="primary" type="submit">
            Criar conta
          </Button>
        </form>
      </div>
    </div>
  );
}

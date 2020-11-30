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

export default function Admin() {
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
  console.log(user.birth_date);
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
          Opções de Administrador
        </div>
        <Button color="primary" onClick={() => history.push("/notification")}>
          Gerar nova notificação
        </Button>
        <Button color="primary" onClick={() => history.push("/doctor")}>
          Criar médico
        </Button>
        <Button color="primary" onClick={() => history.push("/symptom")}>
          Criar sintoma
        </Button>
        <Button color="primary" onClick={() => history.push("/specialization")}>
          Criar especialização
        </Button>
        <Button color="primary" onClick={() => history.push("/attendant")}>
          Criar atendente
        </Button>
        <Button color="primary" onClick={() => history.push("/unit")}>
          Criar unidade
        </Button>
        <Button color="primary" onClick={() => history.push("/hospital")}>
          Criar hospital
        </Button>
        <Button color="secondary" onClick={() => history.push("/user")}>
          Voltar
        </Button>
      </div>
    </div>
  );
}

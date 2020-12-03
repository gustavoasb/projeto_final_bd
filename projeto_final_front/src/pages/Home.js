import React, { useState, useEffect } from "react";
import { makeStyles } from "@material-ui/core/styles";
import Button from "@material-ui/core/Button";
import { useHistory } from "react-router-dom";
import InputLabel from "@material-ui/core/InputLabel";
import MenuItem from "@material-ui/core/MenuItem";
import FormHelperText from "@material-ui/core/FormHelperText";
import FormControl from "@material-ui/core/FormControl";
import Select from "@material-ui/core/Select";
import api from "../services/api";
import ConfirmedIcon from "@material-ui/icons/AssignmentTurnedIn";
import ViewList from "@material-ui/icons/ViewList";

const useStyles = makeStyles((theme) => ({
  formControl: {
    margin: theme.spacing(1),
    minWidth: 200,
  },
  selectEmpty: {
    marginTop: theme.spacing(2),
  },
}));

export default function Login() {
  const classes = useStyles();
  const [entry, setEntry] = useState({
    user_cpf: "",
    doctor_crm: "",
    health_condition_id: "",
  });
  const [doctors, setDoctors] = useState([]);
  const [health_conditions, setHealthConditions] = useState([]);
  let history = useHistory();
  const name = localStorage.getItem("user-name");
  const cpf = localStorage.getItem("user-cpf");

  useEffect(() => {
    api.get("/doctors").then((res) => {
      setDoctors(res.data);
    });
    api.get("/health_conditions").then((res) => {
      setHealthConditions(res.data);
    });
    if (cpf) {
      setEntry({ ...entry, user_cpf: cpf });
    }
  }, []);

  function handleSubmit() {
    api
      .post("/entries", entry)
      .then((res) => {
        alert("Entrada registrada com sucesso");
      })
      .catch((res) => {
        alert("Erro na hora de criar a entrada");
      });
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
        <div style={{ fontSize: "1.2rem", marginBottom: "2rem" }}>
          Olá {name}, seja bem vindo(a)!
        </div>
        <div style={{ fontSize: "1.2rem", marginBottom: "0.6rem" }}>
          Dar entrada
        </div>
        <FormControl className={classes.formControl}>
          <InputLabel id="demo-simple-select-label">Médico</InputLabel>
          <Select
            labelId="demo-simple-select-label"
            id="demo-simple-select"
            value={entry.doctor_crm}
            onChange={(e) => setEntry({ ...entry, doctor_crm: e.target.value })}
          >
            {doctors.map((item, idx) => (
              <MenuItem value={item.crm}>{item.name}</MenuItem>
            ))}
          </Select>
        </FormControl>
        <FormControl className={classes.formControl}>
          <InputLabel id="demo-simple-select-label">Estado de Saúde</InputLabel>
          <Select
            labelId="demo-simple-select-label"
            id="demo-simple-select"
            value={entry.health_condition_id}
            onChange={(e) =>
              setEntry({ ...entry, health_condition_id: e.target.value })
            }
          >
            {health_conditions.map((item, idx) => (
              <MenuItem value={item.id}>{item.name}</MenuItem>
            ))}
          </Select>
        </FormControl>
        <Button
          color="primary"
          onClick={() => handleSubmit()}
        >
          Confirmar
        </Button>
        <br />
        <Button
          color="primary"
          onClick={() => history.push("/user_entries")}
          startIcon={<ViewList />}
        >
          Ver entradas
        </Button>
      </div>
    </div>
  );
}

import React, { useState } from "react";
import { makeStyles } from "@material-ui/core/styles";
import Button from "@material-ui/core/Button";
import { useHistory } from "react-router-dom";
import InputLabel from "@material-ui/core/InputLabel";
import MenuItem from "@material-ui/core/MenuItem";
import FormHelperText from "@material-ui/core/FormHelperText";
import FormControl from "@material-ui/core/FormControl";
import Select from "@material-ui/core/Select";

const useStyles = makeStyles((theme) => ({
  formControl: {
    margin: theme.spacing(1),
    minWidth: 120,
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
  let history = useHistory();

  function handleSubmit() {
    history.push("/user");
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
          Dar entrada
        </div>
        <FormControl className={classes.formControl}>
          <InputLabel id="demo-simple-select-label">Médico</InputLabel>
          <Select
            labelId="demo-simple-select-label"
            id="demo-simple-select"
            value={entry.doctor_crm}
            onChange={(e) => setEntry({...entry, doctor_crm: e.target.value})}
          >
            <MenuItem value={10}>Ten</MenuItem>
            <MenuItem value={20}>Twenty</MenuItem>
            <MenuItem value={30}>Thirty</MenuItem>
          </Select>
        </FormControl>
        <FormControl className={classes.formControl}>
          <InputLabel id="demo-simple-select-label">Estado de Saúde</InputLabel>
          <Select
            labelId="demo-simple-select-label"
            id="demo-simple-select"
            value={entry.health_condition_id}
            onChange={(e) => setEntry({...entry, health_condition_id: e.target.value})}
          >
            <MenuItem value={10}>Ten</MenuItem>
            <MenuItem value={20}>Twenty</MenuItem>
            <MenuItem value={30}>Thirty</MenuItem>
          </Select>
        </FormControl>
        <Button color="primary" type="submit">Confirmar</Button>
      </div>
    </div>
  );
}

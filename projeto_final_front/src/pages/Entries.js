import React, { useState, useEffect } from "react";
import { makeStyles } from "@material-ui/core/styles";
import Table from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableContainer from "@material-ui/core/TableContainer";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import Paper from "@material-ui/core/Paper";
import api from "../services/api";
import MenuItem from "@material-ui/core/MenuItem";
import FormHelperText from "@material-ui/core/FormHelperText";
import FormControl from "@material-ui/core/FormControl";
import Select from "@material-ui/core/Select";
import InputLabel from "@material-ui/core/InputLabel";

const useStyles = makeStyles((theme) => ({
  table: {
    minWidth: 650,
    maxWidth: 1200,
  },
  formControl: {
    margin: theme.spacing(1),
    minWidth: 200,
  },
  selectEmpty: {
    marginTop: theme.spacing(2),
  },
}));

export default function Entries() {
  const classes = useStyles();
  const [entries, setEntries] = useState([]);
  const [doctors, setDoctors] = useState([]);
  const [selectedDoctor, setSelectedDoctor] = useState("");
  let leveCounter = 0;
  let graveCounter = 0;

  const cpf = localStorage.getItem("user-cpf");

  function isFromUser(value) {
    if(selectedDoctor === value.doctor_crm){
      if (!value.was_attended) {
        if (value.health_condition_id === 1) {
          leveCounter += 1;
          value.posicao = leveCounter;
        } else {
          graveCounter += 1;
          value.posicao = graveCounter;
        }
      }
      if (value.user_cpf.replace(/[^\w\s]/gi, "") === cpf) {
        return value;
      }
    }
  }

  useEffect(() => {
    api.get("/doctors").then((res) => {
      setDoctors(res.data);
    });
  }, []);

  function getEntries() {
    api.get("/entries").then((res) => {
      setEntries(res.data.filter(isFromUser));
    });
  }

  function handleChange(e) {
    setSelectedDoctor(e.target.value);
    getEntries();
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
          Entradas cadastradas
        </div>
        <FormControl className={classes.formControl}>
          <InputLabel id="demo-simple-select-label">Médico</InputLabel>
          <Select
            labelId="demo-simple-select-label"
            id="demo-simple-select"
            value={selectedDoctor}
            onChange={(e) => handleChange(e)}
          >
            {doctors.map((item, idx) => (
              <MenuItem value={item.crm}>{item.name}</MenuItem>
            ))}
          </Select>
        </FormControl>
        <div>
          {selectedDoctor && (
            <TableContainer component={Paper}>
              <Table className={classes.table} aria-label="simple table">
                <TableHead>
                  <TableRow>
                    <TableCell>CRM do Doutor</TableCell>
                    <TableCell align="right">Hora de chegada</TableCell>
                    <TableCell align="right">Posição na Fila</TableCell>
                    <TableCell align="right">Fila</TableCell>
                    <TableCell align="right">Atendido</TableCell>
                  </TableRow>
                </TableHead>
                <TableBody>
                  {entries.map((row) => (
                    <TableRow key={row.id}>
                      <TableCell component="th" scope="row">
                        {row.doctor_crm}
                      </TableCell>
                      <TableCell align="right">{row.arrival_time}</TableCell>
                      <TableCell align="right">
                        {row.was_attended ? "" : row.posicao}
                      </TableCell>
                      <TableCell align="right">
                        {row.health_condition_id === 1
                          ? "Comum"
                          : "Preferencial"}
                      </TableCell>
                      <TableCell align="right">
                        {row.was_attended ? "Sim" : "Não"}
                      </TableCell>
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </TableContainer>
          )}
        </div>
      </div>
    </div>
  );
}

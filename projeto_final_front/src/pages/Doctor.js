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
import Button from "@material-ui/core/Button";
import Check from "@material-ui/icons/Check";
import Notificate from "@material-ui/icons/NotificationsActive";

const useStyles = makeStyles({
  table: {
    minWidth: 650,
    maxWidth: 1200,
  },
});

export default function Doctor() {
  const classes = useStyles();
  const [entries, setEntries] = useState([]);
  const [refresh, setRefresh] = useState(0);
  let leveCounter = 0;
  let graveCounter = 0;

  const crm = localStorage.getItem("doctor-crm");

  function isFromUser(value) {
    if (!value.was_attended) {
      if (value.doctor_crm === crm) {
        if (value.health_condition_id === 1) {
          leveCounter += 1;
          value.posicao = leveCounter;
        } else {
          graveCounter += 1;
          value.posicao = graveCounter;
        }
        return value;
      }
    }
  }

  function handleNotificate(entry_id) {
    api.post("/entry_notification", { entry_id });
  }

  function handleConclude(entry_id) {
    let data = {
      entry_id,
      was_attended: true,
    };
    api.put(`entries/${entry_id}`, data).then(() => {
      setRefresh((refresh) => refresh + 1);
    });
  }

  useEffect(() => {
    api.get("/entries").then((res) => {
      setEntries(res.data.filter(isFromUser));
      console.log(entries);
    });
  }, [refresh]);

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
          Fila de espera
        </div>
        <div>
          <TableContainer component={Paper}>
            <Table className={classes.table} aria-label="simple table">
              <TableHead>
                <TableRow>
                  <TableCell>CRM do Doutor</TableCell>
                  <TableCell align="right">Hora de chegada</TableCell>
                  <TableCell align="right">Posição na Fila</TableCell>
                  <TableCell align="right">Fila</TableCell>
                  <TableCell align="right">Ações</TableCell>
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
                      {row.health_condition_id === 1 ? "Comum" : "Preferencial"}
                    </TableCell>
                    <TableCell align="right">
                      <Button
                        color="primary"
                        onClick={() => handleNotificate(row.id)}
                        startIcon={<Notificate />}
                      />
                      <Button
                        color="primary"
                        onClick={() => handleConclude(row.id)}
                        startIcon={<Check />}
                      />
                    </TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          </TableContainer>
        </div>
      </div>
    </div>
  );
}

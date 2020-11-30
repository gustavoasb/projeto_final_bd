import React, { useState } from "react";
import { makeStyles } from "@material-ui/core/styles";
import TextField from "@material-ui/core/TextField";
import Button from "@material-ui/core/Button";
import { useHistory } from "react-router-dom";
// import { DataGrid } from "@material-ui/data-grid";

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

export default function Hospital() {
  const classes = useStyles();
  const [hospital, setHospital] = useState({
    name: "",
    abbreviation: "",
  });
  let history = useHistory();

  function handleSubmit() {
    // api cria hospital
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
        <Button color="secondary" onClick={() => history.push("/admin")}>
          Voltar
        </Button>
        <div style={{ fontSize: "1.2rem", marginBottom: "0.6rem" }}>
          Criar novo hospital
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
            value={hospital.name}
            onChange={(e) => setHospital({ ...hospital, name: e.target.value })}
          />
          <TextField
            id="outlined-basic"
            label="Sigla"
            variant="outlined"
            required
            value={hospital.abbreviation}
            onChange={(e) =>
              setHospital({ ...hospital, abbreviation: e.target.value })
            }
          />
          <Button color="primary" type="submit">
            Criar hospital
          </Button>
        </form>
        {/* <DataGrid rows={rows} columns={columns} pageSize={5} checkboxSelection /> */}
      </div>
    </div>
  );
}

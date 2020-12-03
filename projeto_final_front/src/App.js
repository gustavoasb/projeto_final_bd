import 'fontsource-roboto';
import './App.css';
import {
  BrowserRouter as Router,
  Switch,
  Route,
} from "react-router-dom";
import Home from "./pages/Home"
import Login from "./pages/Login"
import Admin from "./pages/Admin"
import Doctor from "./pages/Doctor"
import SignUp from "./pages/SignUp"
import Hospital from "./pages/Hospital"
import Entries from "./pages/Entries"

function App() {
  return (
    <Router>
      <Switch>
        <Route path="/user" >
          <Home />
        </Route>
        <Route exact path="/">
          <Login />
        </Route>
        <Route path="/admin">
          <Admin />
        </Route>
        <Route path="/doctor">
          <Doctor />
        </Route>
        <Route path="/signup">
          <SignUp />
        </Route>
        <Route path="/hospital">
          <Hospital />
        </Route>
        <Route path="/unit">
          <Hospital />
        </Route>
        <Route path="/attendant">
          <Hospital />
        </Route>
        <Route path="/notification">
          <Hospital />
        </Route>
        <Route path="/user_entries">
          <Entries />
        </Route>
      </Switch>
    </Router>
  );
}

export default App;

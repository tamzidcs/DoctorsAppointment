
import './App.css';
import DisplayAppointments from './components/DisplayAppointments';

import {
  BrowserRouter as Router,
  Routes,
  Route
} from "react-router-dom";

function App() {
  return (
    <div className="App">
     <DisplayAppointments />
     </div>
  );
}
const styles={
  test:{
    color:'red',
    display:'inline-flex',
    
  },
  sidebar:{
    display:'inline-block',
    width:'100vw',
    
  },
  container:{
    display:'inline-flex',
    width:'10vw'
  },
  landing:{
    width:'10vw',
    display:'inine-flex'
  }
}
export default App;

import axios from "axios";
import {useState } from "react";
import AppointmentListView from "./AppointmentListView";
import PhysicianListView from "./PhysicianListView";

export default function DisplayAppointments() {
    
    const [data, setData] = useState([])
    
    const getAppointments = (physician_id) => {
        console.log(physician_id)
        axios.get('http://localhost:3005/Appointments',{params:{physician_id:physician_id}})
            .then(resp => {
                setData(resp.data)
            })
    }
    
    return (
        <div>
            <PhysicianListView getAppointments={getAppointments}/>
            <AppointmentListView data={data}  />
        </div>
    );
}

const styles = {
    getBooksButtonView: {
        display: 'inline-block',
        verticalAlign: 'top',
        padding: '3vw'

    },
    button: {
        padding: '1vw',
    }
}
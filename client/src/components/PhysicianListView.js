
import { useEffect, useState } from "react";
const axios = require('axios')

export default function PhysicianListView(props) {
    const [selectedPhysician,setSelectedPhysician] = useState('')
    const [data, setData] = useState([])

    useEffect(() => {
        console.log('use effect')
        axios.get('http://localhost:3005/Physicians')
            .then(resp => {
                setData(resp.data)
            })
        
    },[]);

    return (

        <div style={styles.container}>  
            <ul>
                {data.map(item => (        
                    <li key={item.physician_id}>
                        <button style={selectedPhysician ===  item.physician_id? styles.selectedButton : styles.button} onClick={()=>{props.getAppointments(item.physician_id); setSelectedPhysician(item.physician_id)}}>{item.last_name}, {item.first_name}</button>
                    </li>
                ))}
            </ul>
        </div>
    );
}

const styles = {
    container: {
        display: 'inline-block',
        backgroundColor:'lightgray',
        marginTop:'8vh',
        paddingRight:'2vw',
        verticalAlign: 'top',
        height:'50vh'
    },
    button:{
        padding:'1vw',
        width:'10vw',
        border:0,
    },
    selectedButton:{
        padding:'1vw',
        width:'10vw',
        backgroundColor:'gray',
        border:0,
    }
}
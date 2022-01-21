import Table from "./Table";
const axios = require('axios')

export default function AppointmentListView(props){

    return(
        <div style={styles.container}>
            <Table rows={props.data}/>
        </div>
    );
}

const styles={
    container:{
        display:'inline-block'
    }
}
export default function Table(props) {
    
    return (
        <div style={styles.tableView}>
            <table style={styles.table}>
                <thead>
                    <tr>
                        <th style={styles.tableHeaderStyle}>#</th>
                        <th style={styles.tableHeaderStyle}>Name</th>
                        <th style={styles.tableHeaderStyle}>Time</th>
                        <th style={styles.tableHeaderStyle}>Kind</th>
                    </tr>
                </thead>
                <tbody>
                    {
                        props.rows.map((rows,indx) => (
                            <tr>
                                <td>{indx+1}</td>
                                <td>{rows.patient_name}</td>
                                <td>{rows.time}</td>
                                <td>{rows.kind}</td>
                                
                            </tr>
                        ))
                    }
                </tbody>
            </table>
        </div>
    );
}

const styles = {
    table: {
        marginLeft: 'auto',
        marginRight: 'auto'
    },
    tableView: {
        display: 'inline-block',
        alignItems: 'center',
        justifyContents: 'center',
        padding: '3vw',

    },
    tableHeaderStyle: {
        padding: '1vw',
        minWidth: '10vw',
        backgroundColor: 'gray'
    },
}
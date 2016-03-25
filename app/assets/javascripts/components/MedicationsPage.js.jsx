class MedicationsPage extends React.Component {
    constructor(props){
        super(props);
    }

    addMedication(e){
        e.preventDefault();
    }

    render(){
        return(
          <div>
            <h3>Here you must specify medications for your student</h3>
            <h3>
                <small>
                   * Not required
                </small>
            </h3>
            <br/>
            <Medication/>
            <Medication/>
            <button className="btn btn-default" onClick={ this.addMedication.bind(this) }>
                <h2>+</h2>
            </button>
          </div>
        );
    }
}

class MedicationsSection extends React.Component {
    constructor(props){
        super(props);
        this.state = {meds: []};
    }

    addMedication(e){
        e.preventDefault();
        var meds = this.state.meds;
        meds.push(1);
        this.setState({meds: meds});
    }

    render(){
        return(
          <div>
            <h3>Medications for your child</h3>
            <h4>
                <small>
                   Here you can specify medications for your child
                </small>
            </h4>
            <hr/>
           {this.state.meds.map((item, index) => {
               return <Medication/>;
           })
           }
            <div>
               <a href="#" className="btn btn-primary" onClick={ this.addMedication.bind(this) }>
                  <i className="fa fa-fw fa-plus"/>
                  Add
               </a>
            </div>
            <br/>
          </div>
        );
    }
}

class MedicationsSection extends React.Component {
    constructor(props){
        super(props);
        this.state = {medications: []};
    }

    addMedication(e){
        e.preventDefault();
        var meds = this.state.medications;
        meds.push({name:'', notes: ''});
        this.setState({medications: meds});
    }

    updateMedication(medication, index){
        var data = {};
        data.type = 'Medications';

        var meds = this.state.medications;
        meds[index] = medication;
        this.setState({medications: meds});

        data.medications = meds;
        this.props.updateData(data);
        console.log(data);
    }

    componentWillMount(){
        props = this.props;
        if(props.values){
            this.setState({medications: props.values.medications});
        }
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
           {this.state.medications.map((medication, index) => {
               return <Medication onUpdate={ this.updateMedication.bind(this) }
                                  key={ index }
                                  medication={ this.state.medications[index] }
                                  index={ index }
               />;
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

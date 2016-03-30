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

    validateItem(item){
        return((item.name && (item.name != ''))&& (item.notes && (item.notes != '')));
    }

    calculatePercentage(){
        var count = 0;
        this.state.medications.map( (item) => {
               if(this.validateItem(item)){
                   count += 1;
               }
        });
        return ( count / this.state.medications.length);
    }

    updateMedication(medication, index){
        var data = {};
        data.type = 'Medications';

        var meds = this.state.medications;
        meds[index] = medication;
        this.setState({medications: meds});

        data.medications = meds;
        this.props.updateData(data);
        this.props.updatePercentage(data.type, this.calculatePercentage());
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

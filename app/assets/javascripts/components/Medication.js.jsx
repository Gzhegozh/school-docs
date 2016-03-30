class Medication extends React.Component {
    constructor(props){
        super(props);
    }

    valuesChanged(e){
        e.preventDefault();
        this.props.onUpdate({name: this.name.value,
                             notes: this.notes.value}, this.props.index);
    }

    componentDidMount(){
        this.name.value = this.props.medication.name;
        this.notes.value = this.props.medication.notes;
    }

    render(){
        return (
            <div className="panel panel-default panel-body semi-gray">
                <div className="col-lg-4">
                    <input type="text"
                           className="form-control"
                           ref={ (ref) => this.name = ref }
                           onChange={ this.valuesChanged.bind(this) }
                           placeholder="Medication name"/>
                </div>
                <div className="col-lg-8">
                    <input type="text"
                           className="form-control"
                           ref={ (ref) => this.notes = ref}
                           onChange={ this.valuesChanged.bind(this) }
                           placeholder="Notes"/>
                </div>
            </div>
        );
    }
}
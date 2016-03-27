class Medication extends React.Component {
    constructor(props){
        super(props);
    }

    render(){
        return (
            <div className="panel panel-default panel-body">
                <div className="col-lg-4">
                    <input type="text"
                           className="form-control"
                           ref={ (ref) => this.name = ref }
                           placeholder="Medication name"/>
                </div>
                <div className="col-lg-8">
                    <input type="text"
                           className="form-control"
                           ref={ (ref) => this.notes = ref}
                           placeholder="Notes"/>
                </div>
            </div>
        );
    }
}
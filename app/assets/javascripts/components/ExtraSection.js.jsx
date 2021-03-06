class ExtraSection extends React.Component {
    constructor(props){
        super(props);
    }

    componentDidMount(){
        props = this.props;
        if(props.values){
            this.person.value = props.values.person;
            this.contacts.value = props.values.contacts;
        }
    }

    calculatePercentage(){
        var count = 0;
        if(this.person.value)
            count += 1;
        if(this.contacts.value)
            count += 1;
        return (count / 2);
    }

    valuesChanged(){
        var data = {};
        data.type = 'Extra';
        data.person = this.person.value;
        data.contacts = this.contacts.value;
        this.props.updateData(data);
        this.props.updatePercentage(data.type, this.calculatePercentage());
    }

    render(){
        return (
          <div>
            <h3>Emergency contacts</h3>
            <h4>
                <small>
                    If main contacts will unavailable
                </small>
            </h4>
            <hr/>
            <div className="row">
                <div className="form-group">
                    <label className="col-lg-2 label-control">Person </label>
                    <div className="col-lg-10">
                        <input type="text"
                               className="form-control"
                               ref={(ref) => this.person = ref}
                               onChange={ this.valuesChanged.bind(this) }
                        />
                    </div>
                </div>
            </div>
            <br/>
            <div className="row">
                <div className="form-group">
                    <label className="col-lg-2 label-control"> Contacts</label>
                    <div className="col-lg-10">
                        <input type="text"
                               className="form-control"
                               ref={(ref) => this.contacts = ref}
                               onChange={ this.valuesChanged.bind(this) }
                        />
                    </div>
                </div>
            </div>
            <br/>
          </div>
        );
    }
}
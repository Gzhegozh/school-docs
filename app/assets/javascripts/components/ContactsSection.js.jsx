class ContactsSection extends React.Component {
    constructor(props){
        super(props);
    }

    importFromProfile(e){
        e.preventDefault();
        alert('Imported');
    }

    valuesChanged(){
        var data = {};
        data.type = 'Contacts';
        data.phone = this.phone.value;
        data.skype = this.skype.value;
        data.email = this.email.value;
        this.props.updateData(data);
        this.props.updatePercentage(data.type, this.calculatePercentage());
    }

    calculatePercentage(){
        var count = 0;
        if(this.phone.value)
            count += 1;
        if(this.skype.value)
            count += 1;
        if(this.email.value)
            count += 1;
        return count / 3;
    }

    componentDidMount(){
        props = this.props;
        if(props.values){
            this.phone.value = props.values.phone;
            this.skype.value = props.values.skype;
            this.email.value = props.values.email;
        }
    }

    render(){
        return (
            <div>
                <h3>Leave your contacts here</h3>
                <h4>
                    <small>
                        <a href="#" onClick={ this.importFromProfile }>Import </a>
                        phone and email from profile
                    </small>
                </h4>
                <hr/>
                <div className="row">
                    <label className="col-lg-3 control-label">
                        Phone:
                    </label>
                    <div className="col-lg-9">
                        <input className="form-control"
                               placeholder="Your phone"
                               type="text"
                               ref={(ref) => this.phone = ref}
                               onChange={ this.valuesChanged.bind(this) }
                        />
                    </div>
                </div>
                <br/>
                <div className="row">
                    <label className="col-lg-3 control-label">
                        Skype:
                    </label>
                    <div className="col-lg-9">
                        <input className="form-control"
                               placeholder="Your skype login"
                               type="text"
                               ref={(ref) => this.skype = ref}
                               onChange={ this.valuesChanged.bind(this) }
                        />
                    </div>
                </div>
                <br/>
                <div className="row">
                    <label className="col-lg-3 control-label">
                        Email:
                    </label>
                    <div className="col-lg-9">
                        <input className="form-control"
                               placeholder="your-email@example.com"
                               type="text"
                               ref={(ref) => this.email = ref}
                               onChange={ this.valuesChanged.bind(this) }
                        />
                    </div>
                </div>
                <br/>
            </div>
        );
    }
}
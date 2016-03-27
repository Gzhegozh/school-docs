class ContactsSection extends React.Component {
    constructor(props){
        super(props);
    }

    importFromProfile(e){
        e.preventDefault();
        alert('Imported');
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
                        <input className="form-control" type="text" ref={(ref) => this.phone = ref}/>
                    </div>
                </div>
                <br/>
                <div className="row">
                    <label className="col-lg-3 control-label">
                        Skype:
                    </label>
                    <div className="col-lg-9">
                        <input className="form-control" type="text" ref={(ref) => this.skype = ref}/>
                    </div>
                </div>
                <br/>
                <div className="row">
                    <label className="col-lg-3 control-label">
                        Email:
                    </label>
                    <div className="col-lg-9">
                        <input className="form-control" type="text" ref={(ref) => this.email = ref}/>
                    </div>
                </div>
                <br/>
            </div>
        );
    }
}
class ContactsSection extends React.Component {
    constructor(props){
        super(props);
    }

    render(){
        return (
            <div>
                <h3>Leave your contacts here</h3>
                <br/>
                <div className="row">
                    <label className="col-lg-3 control-label">
                        Phone:
                    </label>
                    <div className="col-lg-9">
                        <input className="form-control" type="text" ref={(ref) => this.phone = ref}/>
                    </div>
                </div>
            </div>
        );
    }
}
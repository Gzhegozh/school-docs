class ExtraSection extends React.Component {
    constructor(props){
        super(props);
    }

    render(){
        return (
          <div>
            <h3>Emergency contacts</h3>
            <hr/>
            <div className="row">
                <div className="form-group">
                    <label className="col-lg-2 label-control">Person </label>
                    <div className="col-lg-10">
                        <input type="text" className="form-control" ref={(ref) => this.person = ref} />
                    </div>
                </div>
            </div>
            <br/>
            <div className="row">
                <div className="form-group">
                    <label className="col-lg-2 label-control"> Contacts</label>
                    <div className="col-lg-10">
                        <input type="type" className="form-control" ref={(ref) => this.contacts = ref}/>
                    </div>
                </div>
            </div>
            <br/>
          </div>
        );
    }
}
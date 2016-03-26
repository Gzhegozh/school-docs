class BasicsSection extends React.Component {
    constructor(props){
        super(props);
    }

    infoFromProfile(e){
        e.preventDefault();
        alert(this);
    }

    render(){
        console.log(this);
        return (
          <div>
              <h3>This is basic info about enrolling student</h3>
              <h4>
                  <small>
                      You can
                      <a href="#" onClick={ this.infoFromProfile.bind(this) }> import </a>
                      this information from his profile
                  </small>
              </h4>
              <hr/>
              <div className="row">
                  <div className="form-group">
                      <label className="col-md-2 control-label"> Enter name: </label>
                      <div className="col-md-10">
                          <input className="form-control" type="text" ref={ (ref) => this.name = ref }/>
                      </div>
                  </div>
              </div>
              <br/>
              <div className="row">
                  <div className="form-group">
                      <label className="col-md-2 control-label"> Enter last name: </label>
                      <div className="col-md-10">
                          <input className="form-control" type="text" ref={ (ref) => this.last_name = ref }/>
                      </div>
                  </div>
              </div>
              <br/>
              <div className="row">
                  <div className="form-group">
                      <label className="col-md-2 control-label"> Enter middle name: </label>
                      <div className="col-md-10">
                          <input className="form-control" type="text" ref={ (ref) => this.middle_name = ref }/>
                      </div>
                  </div>
              </div>
              <br/>
              <div className="row">
                  <div className="form-group">
                      <label className="col-md-2 control-label">Enter birthday: </label>
                      <div className="col-md-10">
                          <input className="form-control" type="date" ref={ (ref) => this.birthday = ref }/>
                      </div>
                  </div>
              </div>
              <br/>
          </div>
        );
    }
}
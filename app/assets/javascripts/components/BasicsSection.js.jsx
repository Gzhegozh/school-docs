class BasicsSection extends React.Component {
    constructor(props){
        super(props);
    }

    infoFromProfile(e){
        e.preventDefault();
        alert(this.birthday.value);
        this.birthday.value = '2016-03-12';
    }

    componentDidMount(){
        props = this.props;
        if(props.values) {
            this.name.value = props.values.name;
            this.last_name.value = props.values.last_name;
            this.middle_name.value = props.values.middle_name;
            this.birthday.value = props.values.birthday;
        }
    }

    valuesChanged(){
        var data = {};
        data.type = 'Basics';
        data.name = this.name.value;
        data.last_name = this.last_name.value;
        data.middle_name = this.middle_name.value;
        data.birthday = this.birthday.value;
        this.props.updateData(data);
    }

    render(){
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
                          <input className="form-control"
                                 type="text"
                                 ref={ (ref) => this.name = ref }
                                 onChange={ this.valuesChanged.bind(this) }
                          />
                      </div>
                  </div>
              </div>
              <br/>
              <div className="row">
                  <div className="form-group">
                      <label className="col-md-2 control-label"> Enter last name: </label>
                      <div className="col-md-10">
                          <input className="form-control"
                                 type="text"
                                 ref={ (ref) => this.last_name = ref }
                                 onChange={ this.valuesChanged.bind(this) }
                          />
                      </div>
                  </div>
              </div>
              <br/>
              <div className="row">
                  <div className="form-group">
                      <label className="col-md-2 control-label"> Enter middle name: </label>
                      <div className="col-md-10">
                          <input className="form-control"
                                 type="text"
                                 ref={ (ref) => this.middle_name = ref }
                                 onChange={ this.valuesChanged.bind(this) }
                          />
                      </div>
                  </div>
              </div>
              <br/>
              <div className="row">
                  <div className="form-group">
                      <label className="col-md-2 control-label">Enter birthday: </label>
                      <div className="col-md-10">
                          <input className="form-control"
                                 type="date"
                                 ref={ (ref) => this.birthday = ref }
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
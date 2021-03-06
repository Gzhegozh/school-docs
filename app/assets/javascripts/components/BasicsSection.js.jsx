class BasicsSection extends React.Component {
    constructor(props){
        super(props);
    }

    infoFromProfile(e){
        e.preventDefault();
        this.name.value = 'John';
        this.last_name.value = 'Petrucci';
        this.middle_name.value = 'Smith';
        this.birthday.value = '2016-03-10';
        this.props.updatePercentage('Basics', this.calculatePercentage());
    }

    calculatePercentage(){
        var count = 0;
        if(this.name.value)
            count += 1;
        if(this.last_name.value)
            count += 1;
        if(this.middle_name.value)
            count += 1;
        if(this.birthday.value)
            count += 1;
        return (count / 4);
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
        this.props.updatePercentage(data.type, this.calculatePercentage());
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
                                 placeholder="Child name"
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
                                 placeholder="Child last name"
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
                                 placeholder="Child middle name"
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
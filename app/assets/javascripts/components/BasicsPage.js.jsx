class BasicsPage extends React.Component {
    constructor(props){
        super(props);
    }

    render(){
        return (
          <div className="row">
              <div className="col-lg-2">
                  <p> Enter name: </p>
              </div>
              <div className="col-lg-10">
                  <input className="form-control" type="text" ref={ (ref) => this.name = ref }/>
              </div>
              <div className="col-lg-2">
                  <p> Enter last name: </p>
              </div>
              <div className="col-lg-10">
                  <input className="form-control" type="text" ref={ (ref) => this.last_name = ref }/>
              </div>
              <div className="col-lg-2">
                  <p> Enter middle name: </p>
              </div>
              <div className="col-lg-10">
                  <input className="form-control" type="text" ref={ (ref) => this.middle_name = ref }/>
              </div>
          </div>
        );
    }
}